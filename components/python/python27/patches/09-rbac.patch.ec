This patch provides Python RBAC support.

diff --git Python-2.6.4/Modules/authattr.c Python-2.6.4/Modules/authattr.c
new file mode 100644
--- /dev/null
+++ Python-2.6.4/Modules/authattr.c
@@ -0,0 +1,261 @@
+/*
+ * CDDL HEADER START
+ *
+ * The contents of this file are subject to the terms of the
+ * Common Development and Distribution License (the "License").
+ * You may not use this file except in compliance with the License.
+ *
+ * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+ * or http://www.opensolaris.org/os/licensing.
+ * See the License for the specific language governing permissions
+ * and limitations under the License.
+ *
+ * When distributing Covered Code, include this CDDL HEADER in each
+ * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+ * If applicable, add the following below this CDDL HEADER, with the
+ * fields enclosed by brackets "[]" replaced with your own identifying
+ * information: Portions Copyright [yyyy] [name of copyright owner]
+ *
+ * CDDL HEADER END
+ */
+
+/*
+ * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
+ */
+
+/*
+ * RBAC Bindings for Python - auth_attr functions
+ */
+
+#include <auth_attr.h>
+#include "Python.h"
+#include "pyrbac.h"
+
+static PyObject*
+pyrbac_setauthattr(PyObject* self, PyObject* args) {
+	setauthattr();
+	return Py_None;
+}
+
+static PyObject*
+pyrbac_endauthattr(PyObject* self, PyObject* args) {
+	endauthattr();
+	return Py_None;
+}
+
+PyObject*
+pyrbac_getauthnamattr(PyObject* self, char* authname, int mode) {
+	
+
+	
+	authattr_t * ret_authattr = (mode == PYRBAC_NAM_MODE) ? getauthnam(authname) : getauthattr();
+	if (ret_authattr == NULL)
+		return Py_None;
+		
+	PyObject* kv_data = PyDict_New();
+	if (kv_data == NULL) {
+		free_authattr(ret_authattr);
+		return NULL;
+	}
+
+	if(ret_authattr->attr != NULL) {
+		int len;
+		for(len = 0; len < ret_authattr->attr->length; len++) {
+			kv_t current = ret_authattr->attr->data[len];
+
+			PyObject* set = PyList_New(NULL);
+			char* saveptr;
+			char* item = strtok_r(current.value, ",", &saveptr);
+			PyList_Append(set, PyString_FromString(item));
+
+			while((item = strtok_r(NULL, ",", &saveptr)) != NULL) {
+				if(PyList_Append(set, PyString_FromString(item)) != 0) {
+					Py_XDECREF(set);
+					Py_XDECREF(kv_data);
+					free_authattr(ret_authattr);
+					return NULL;
+				}
+			}
+			if(PyDict_SetItemString(kv_data, current.key, set)) {
+					free_authattr(ret_authattr);
+					return NULL;
+			}
+		}
+	}
+	PyObject * retval = Py_BuildValue("{s:s,s:s,s:s,s:s,s:s,s:O}",
+		"name",ret_authattr->name,
+		"res1",ret_authattr->res1,
+		"res2",ret_authattr->res2,
+		"short",ret_authattr->short_desc,
+		"long",ret_authattr->long_desc,
+		"attributes",kv_data);
+
+	free_authattr(ret_authattr);
+	return retval;
+
+}
+
+static PyObject*
+pyrbac_getauthattr(PyObject* self, PyObject* args) {
+	return(pyrbac_getauthnamattr(self, NULL, PYRBAC_ATTR_MODE));
+}
+
+static PyObject*
+pyrbac_getauthnam(PyObject* self, PyObject* args) {
+	char* name = NULL;
+	if(!PyArg_ParseTuple(args, "s:getauthnam", &name))
+		return NULL;
+	return(pyrbac_getauthnamattr(self, name, PYRBAC_NAM_MODE));
+}
+
+static PyObject *
+pyrbac_chkauthattr(PyObject* self, PyObject* args) {
+	char* authstring = NULL;
+	char* username = NULL;
+	if(!PyArg_ParseTuple(args, "ss:chkauthattr", &authstring, &username))
+		return NULL;
+	return PyBool_FromLong((long)chkauthattr(authstring, username));
+}
+
+static PyObject*
+pyrbac_authattr_next(PyObject* self, PyObject* args) {
+	PyObject* retval = pyrbac_getauthattr(self, args);
+	if( retval == Py_None ) {
+		setauthattr();
+		return NULL;
+	}
+	return retval;
+}
+static PyObject*
+pyrbac_authattr__iter__(PyObject* self, PyObject* args) {
+	return self;
+}
+
+typedef struct {
+	PyObject_HEAD
+} Authattr;
+
+static void
+Authattr_dealloc(Authattr* self) {
+	endauthattr();
+	self->ob_type->tp_free((PyObject*) self);
+}
+
+static PyObject*
+Authattr_new(PyTypeObject *type, PyObject *args, PyObject *kwds) {
+	Authattr *self;
+	self = (Authattr*)type->tp_alloc(type, 0);
+
+	return ((PyObject *) self);
+}
+
+static int
+Authattr_init(Authattr* self, PyObject *args, PyObject *kwargs) {
+	setauthattr();
+	return 0;
+}
+
+static char pyrbac_authattr__doc__[];
+
+PyDoc_STRVAR(pyrbac_authattr__doc__, """provides interfaces to the auth_attr \
+database. may be iterated over to return all auth_attr entries\n\n\
+Methods provided:\n\
+setauthattr\n\
+endauthattr\n\
+getauthattr\n\
+chkauthattr\n\
+getauthnam""");
+
+static char pyrbac_setauthattr__doc__[];
+static char pyrbac_endauthattr__doc__[];
+static char pyrbac_getauthattr__doc__[];
+static char pyrbac_chkauthattr__doc__[];
+
+PyDoc_STRVAR(pyrbac_setauthattr__doc__, 
+"\"rewinds\" the auth_attr functions to the first entry in the db. Called \
+automatically by the constructor\n\tArguments: None\n\tReturns: None");
+
+PyDoc_STRVAR(pyrbac_endauthattr__doc__, 
+"closes the auth_attr database, cleans up storage. called automatically by \
+the destructor\n\tArguments: None\n\tReturns: None");
+
+PyDoc_STRVAR(pyrbac_chkauthattr__doc__, "verifies if a user has a given \
+authorization.\n\tArguments: 2 Python strings, 'authname' and 'username'\n\
+\tReturns: True if the user is authorized, False otherwise");
+
+PyDoc_STRVAR(pyrbac_getauthattr__doc__, 
+"return one entry from the auth_attr database\n\
+\tArguments: None\n\
+\tReturns: a dict representing the authattr_t struct:\n\
+\t\t\"name\": Authorization Name\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"short\": Short Description\n\
+\t\t\"long\": Long Description\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as either a list \
+or a string depending on value");
+
+PyDoc_STRVAR(pyrbac_getauthnam__doc__, 
+"searches the auth_attr database for a given authorization name\n\
+\tArguments: a Python string containing the auth name\n\
+\tReturns: a dict representing the authattr_t struct:\n\
+\t\t\"name\": Authorization Name\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"short\": Short Description\n\
+\t\t\"long\": Long Description\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as either a list \
+or a string depending on value");
+
+static PyMethodDef Authattr_methods[] = {
+	{"setauthattr", pyrbac_setauthattr, METH_NOARGS, pyrbac_setauthattr__doc__},
+	{"endauthattr", pyrbac_endauthattr, METH_NOARGS, pyrbac_endauthattr__doc__},
+	{"chkauthattr", pyrbac_chkauthattr, METH_VARARGS, pyrbac_chkauthattr__doc__},
+	{"getauthattr", pyrbac_getauthattr, METH_NOARGS, pyrbac_getauthattr__doc__},
+	{"getauthnam", pyrbac_getauthnam, METH_VARARGS, pyrbac_getauthnam__doc__},
+	{NULL}
+};
+
+PyTypeObject AuthattrType = {
+	PyObject_HEAD_INIT(NULL)
+	0,                         /*ob_size*/
+	"rbac.authattr",             /*tp_name*/
+	sizeof(Authattr),             /*tp_basicsize*/
+	0,                         /*tp_itemsize*/
+	(destructor)Authattr_dealloc, /*tp_dealloc*/
+	0,                         /*tp_print*/
+	0,                         /*tp_getattr*/
+	0,                         /*tp_setattr*/
+	0,                         /*tp_compare*/
+	0,                         /*tp_repr*/
+	0,                         /*tp_as_number*/
+	0,                         /*tp_as_sequence*/
+	0,                         /*tp_as_mapping*/
+	0,                         /*tp_hash */
+	0,                         /*tp_call*/
+	0,                         /*tp_str*/
+	0,                         /*tp_getattro*/
+	0,                         /*tp_setattro*/
+	0,                         /*tp_as_buffer*/
+	Py_TPFLAGS_DEFAULT |
+	Py_TPFLAGS_BASETYPE |
+	Py_TPFLAGS_HAVE_ITER, /*tp_flags*/
+	pyrbac_authattr__doc__,           /* tp_doc */
+	0,		               /* tp_traverse */
+	0,		               /* tp_clear */
+	0,		               /* tp_richcompare */
+	0,		               /* tp_weaklistoffset */
+	pyrbac_authattr__iter__,		               /* tp_iter */
+	pyrbac_authattr_next,         /* tp_iternext */
+	Authattr_methods,             /* tp_methods */
+	0,             /* tp_members */
+	0,                         /* tp_getset */
+	0,                         /* tp_base */
+	0,                         /* tp_dict */
+	0,                         /* tp_descr_get */
+	0,                         /* tp_descr_set */
+	0,                         /* tp_dictoffset */
+	(initproc)Authattr_init,      /* tp_init */
+	0,                         /* tp_alloc */
+	Authattr_new,                 /* tp_new */
+};
diff --git Python-2.6.4/Modules/execattr.c Python-2.6.4/Modules/execattr.c
new file mode 100644
--- /dev/null
+++ Python-2.6.4/Modules/execattr.c
@@ -0,0 +1,313 @@
+/*
+ * CDDL HEADER START
+ *
+ * The contents of this file are subject to the terms of the
+ * Common Development and Distribution License (the "License").
+ * You may not use this file except in compliance with the License.
+ *
+ * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+ * or http://www.opensolaris.org/os/licensing.
+ * See the License for the specific language governing permissions
+ * and limitations under the License.
+ *
+ * When distributing Covered Code, include this CDDL HEADER in each
+ * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+ * If applicable, add the following below this CDDL HEADER, with the
+ * fields enclosed by brackets "[]" replaced with your own identifying
+ * information: Portions Copyright [yyyy] [name of copyright owner]
+ *
+ * CDDL HEADER END
+ */
+
+/*
+ * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
+ */
+
+/*
+ * RBAC Bindings for Python - exec_attr functions
+ */
+
+#include <exec_attr.h>
+#include "Python.h"
+#include "pyrbac.h"
+
+static PyObject *
+pyrbac_setexecattr(PyObject* self, PyObject* args) {
+	setexecattr();
+	return Py_None;
+}
+
+static PyObject *
+pyrbac_endexecattr(PyObject* self, PyObject* args) {
+	endexecattr();
+	return Py_None;
+}
+
+PyObject *
+pyrbac_getexecuserprofattr(PyObject* self, char* userprofname, char* type, char* id, int mode) {
+
+	PyObject* ep_data = (mode == PYRBAC_ATTR_MODE) ? NULL : PyList_New(0);
+	
+	if (ep_data == NULL && mode != PYRBAC_ATTR_MODE )
+		return NULL;
+	
+	execattr_t *execprof;
+	if (mode == PYRBAC_USER_MODE)
+		execprof = getexecuser(userprofname, type, id, GET_ALL);
+	else if (mode == PYRBAC_PROF_MODE)
+		execprof = getexecprof(userprofname, type, id, GET_ALL);
+	else if (mode == PYRBAC_ATTR_MODE)
+		execprof = getexecattr();
+	else
+		return NULL;
+
+	if (execprof == NULL)
+		return Py_None;
+	
+	execattr_t *execprof_head = execprof;
+
+	while(execprof != NULL) {
+		
+		PyObject* kv_data = PyDict_New();
+
+		if(execprof->attr != NULL) {
+			int len;
+			for(len = 0; len < execprof->attr->length; len++) {
+				kv_t current = execprof->attr->data[len];
+
+				PyObject* set = PyList_New(NULL);
+				char* saveptr;
+				char* item = strtok_r(current.value, ",", &saveptr);
+				PyList_Append(set, PyString_FromString(item));
+
+				while((item = strtok_r(NULL, ",", &saveptr)) != NULL) {
+					if(PyList_Append(set, PyString_FromString(item)) != 0) {
+						Py_XDECREF(set);
+						Py_XDECREF(kv_data);
+						free_execattr(execprof_head);
+						return NULL;
+					}
+				}
+				if(PyDict_SetItemString(kv_data, current.key, set)) {
+						free_execattr(execprof_head);
+						return NULL;
+				}
+			}
+		}
+		PyObject* entry = Py_BuildValue("{s:s,s:s,s:s,s:s,s:s,s:s,s:O}",
+			"name", execprof->name,
+			"type", execprof->type,
+			"policy", execprof->policy,
+			"res1", execprof->res1,
+			"res2", execprof->res2,
+			"id", execprof->id,
+			"attributes", kv_data);
+		
+		if (entry == NULL) {
+			Py_XDECREF(kv_data);
+			free_execattr(execprof_head);
+			return NULL;
+		}
+		
+		if (mode == PYRBAC_ATTR_MODE) {
+			free_execattr(execprof_head);
+			return(entry);
+		}
+		PyList_Append(ep_data, entry);
+		execprof = execprof->next;
+	}
+
+	free_execattr(execprof_head);
+	return(ep_data);
+ 
+}
+
+static PyObject *
+pyrbac_getexecuser(PyObject* self, PyObject* args) {
+	char* username = NULL;
+	char* type = NULL;
+	char* id = NULL;
+	
+	if(!PyArg_ParseTuple(args, "sss:getexecuser", &username, &type, &id))
+		return NULL;
+
+	return (pyrbac_getexecuserprofattr(self, username, type, id, PYRBAC_USER_MODE));
+}
+
+static PyObject *
+pyrbac_getexecprof(PyObject* self, PyObject* args) {
+
+	char* profname = NULL;
+	char* type = NULL;
+	char* id = NULL;
+	
+	if(!PyArg_ParseTuple(args, "sss:getexecprof", &profname, &type, &id))
+		return NULL;
+
+	return (pyrbac_getexecuserprofattr(self, profname, type, id, PYRBAC_PROF_MODE));
+}
+
+static PyObject*
+pyrbac_getexecattr(PyObject* self, PyObject* args) {
+	return pyrbac_getexecuserprofattr(self, NULL, NULL, NULL, PYRBAC_ATTR_MODE);
+}
+
+static PyObject*
+pyrbac_execattr_next(PyObject* self, PyObject* args) {
+	PyObject* retval = pyrbac_getexecattr(self, args);
+	if( retval == Py_None ) {
+		setexecattr();
+		return NULL;
+	}
+	return retval;
+}
+static PyObject*
+pyrbac_execattr__iter__(PyObject* self, PyObject* args) {
+	return self;
+}
+
+typedef struct {
+	PyObject_HEAD
+} Execattr;
+
+static void
+Execattr_dealloc(Execattr* self) {
+	endexecattr();
+	self->ob_type->tp_free((PyObject*) self);
+}
+
+static PyObject*
+Execattr_new(PyTypeObject *type, PyObject *args, PyObject *kwds) {
+	Execattr *self;
+	self = (Execattr*)type->tp_alloc(type, 0);
+
+	return ((PyObject *) self);
+}
+
+static int
+Execattr_init(Execattr* self, PyObject *args, PyObject *kwargs) {
+	setexecattr();
+	return 0;
+}
+
+static char pyrbac_execattr__doc__[];
+
+PyDoc_STRVAR(pyrbac_execattr__doc__, "provides functions for \
+interacting with the execution profiles database. May be iterated over to \
+enumerate exec_attr(4) entries\n\n\
+Methods provided:\n\
+setexecattr\n\
+endexecattr\n\
+getexecattr\n\
+getexecprof\n\
+getexecuser");
+
+
+static char pyrbac_getexecuser__doc__[];
+static char pyrbac_getexecprof__doc__[];
+static char pyrbac_getexecattr__doc__[];
+static char pyrbac_setexecattr__doc__[];
+static char pyrbac_endexecattr__doc__[];
+
+PyDoc_STRVAR(pyrbac_setexecattr__doc__,
+"\"rewinds\" the exec_attr functions to the first entry in the db. Called \
+automatically by the constructor.\n\
+\tArguments: None\
+\tReturns: None");
+
+PyDoc_STRVAR(pyrbac_endexecattr__doc__, 
+"closes the exec_attr database, cleans up storage. called automatically by \
+the destructor.\n\
+\tArguments: None\
+\tReturns: None");
+
+PyDoc_STRVAR(pyrbac_getexecuser__doc__, "corresponds with getexecuser(3SECDB)\
+\nTakes: \'username\', \'type\', \'id\'\n\
+Return: a single exec_attr entry\n\
+\tArguments: None\n\
+\tReturns: a dict representation of an execattr_t struct:\n\
+\t\t\"name\": Authorization Name\n\
+\t\t\"type\": Profile Type\n\
+\t\t\"policy\": Policy attributes are relevant in\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"id\": unique identifier\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as\
+either a list or a string depending on value");
+
+PyDoc_STRVAR(pyrbac_getexecprof__doc__, "corresponds with getexecprof(3SECDB)\
+\nTakes: \'profile name\', \'type\', \'id\'\n\
+\tReturns: a dict representation of an execattr_t struct:\n\
+\t\t\"name\": Authorization Name\n\
+\t\t\"type\": Profile Type\n\
+\t\t\"policy\": Policy attributes are relevant in\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"id\": unique identifier\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as\
+either a list or a string depending on value");
+
+PyDoc_STRVAR(pyrbac_getexecattr__doc__, "corresponds with getexecattr(3SECDB)\
+\nTakes 0 arguments\n\
+\tReturns: a dict representation of an execattr_t struct:\n\
+\t\t\"name\": Authorization Name\n\
+\t\t\"type\": Profile Type\n\
+\t\t\"policy\": Policy attributes are relevant in\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"id\": unique identifier\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as\
+either a list or a string depending on value");
+
+static PyMethodDef Execattr_methods[] = {
+	{"setexecattr", pyrbac_setexecattr, METH_NOARGS, pyrbac_setexecattr__doc__},
+	{"endexecattr", pyrbac_endexecattr, METH_NOARGS, pyrbac_endexecattr__doc__},
+	{"getexecprof", pyrbac_getexecprof, METH_VARARGS, pyrbac_getexecprof__doc__},	
+	{"getexecuser", pyrbac_getexecuser, METH_VARARGS, pyrbac_getexecuser__doc__},
+	{"getexecattr", pyrbac_getexecattr, METH_NOARGS, pyrbac_getexecattr__doc__},
+	{NULL}
+};
+
+PyTypeObject ExecattrType = {
+	PyObject_HEAD_INIT(NULL)
+	0,                         /*ob_size*/
+	"rbac.execattr",             /*tp_name*/
+	sizeof(Execattr),             /*tp_basicsize*/
+	0,                         /*tp_itemsize*/
+	(destructor)Execattr_dealloc, /*tp_dealloc*/
+	0,                         /*tp_print*/
+	0,                         /*tp_getattr*/
+	0,                         /*tp_setattr*/
+	0,                         /*tp_compare*/
+	0,                         /*tp_repr*/
+	0,                         /*tp_as_number*/
+	0,                         /*tp_as_sequence*/
+	0,                         /*tp_as_mapping*/
+	0,                         /*tp_hash */
+	0,                         /*tp_call*/
+	0,                         /*tp_str*/
+	0,                         /*tp_getattro*/
+	0,                         /*tp_setattro*/
+	0,                         /*tp_as_buffer*/
+	Py_TPFLAGS_DEFAULT |
+	Py_TPFLAGS_BASETYPE |
+	Py_TPFLAGS_HAVE_ITER, /*tp_flags*/
+	pyrbac_execattr__doc__,           /* tp_doc */
+	0,		               /* tp_traverse */
+	0,		               /* tp_clear */
+	0,		               /* tp_richcompare */
+	0,		               /* tp_weaklistoffset */
+	pyrbac_execattr__iter__,		               /* tp_iter */
+	pyrbac_execattr_next,         /* tp_iternext */
+	Execattr_methods,             /* tp_methods */
+	0,             /* tp_members */
+	0,                         /* tp_getset */
+	0,                         /* tp_base */
+	0,                         /* tp_dict */
+	0,                         /* tp_descr_get */
+	0,                         /* tp_descr_set */
+	0,                         /* tp_dictoffset */
+	(initproc)Execattr_init,      /* tp_init */
+	0,                         /* tp_alloc */
+	Execattr_new,                 /* tp_new */
+};
diff --git Python-2.6.4/Modules/privileges.c Python-2.6.4/Modules/privileges.c
new file mode 100644
--- /dev/null
+++ Python-2.6.4/Modules/privileges.c
@@ -0,0 +1,229 @@
+/*
+ * CDDL HEADER START
+ *
+ * The contents of this file are subject to the terms of the
+ * Common Development and Distribution License (the "License").
+ * You may not use this file except in compliance with the License.
+ *
+ * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+ * or http://www.opensolaris.org/os/licensing.
+ * See the License for the specific language governing permissions
+ * and limitations under the License.
+ *
+ * When distributing Covered Code, include this CDDL HEADER in each
+ * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+ * If applicable, add the following below this CDDL HEADER, with the
+ * fields enclosed by brackets "[]" replaced with your own identifying
+ * information: Portions Copyright [yyyy] [name of copyright owner]
+ *
+ * CDDL HEADER END
+ */
+
+/*
+ * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
+ */
+
+/*
+ * privileges(5) bindings for Python
+ */
+
+#include <priv.h>
+#include "Python.h"
+
+static PyObject *
+pyprivileges_setppriv( PyObject *self, PyObject *args) {
+	priv_op_t op = -1 ; 
+	priv_ptype_t which = NULL;
+
+	PyObject* set_list = NULL;
+
+	priv_set_t * set = NULL;
+
+	if(!PyArg_ParseTuple(args, "iiO:setppriv", &op, &which, &set_list))
+		return NULL;
+	
+	if((op != PRIV_ON && op != PRIV_OFF && op != PRIV_SET) ||
+		(which != PRIV_PERMITTED && which != PRIV_EFFECTIVE &&
+		which != PRIV_INHERITABLE && which != PRIV_LIMIT))
+		return NULL;
+	
+	PyObject* set_string = PyList_GetItem(set_list, 0);
+	int i;
+	for (i = 1; i < PyList_Size(set_list); ++i) {
+		PyString_Concat(&set_string, PyString_FromString(","));
+		PyString_Concat(&set_string, PyList_GetItem(set_list, i));
+	}
+
+	set = priv_str_to_set(PyString_AsString(set_string), ",", NULL );
+
+	if ( set == NULL )
+		return NULL;
+
+	long ret = (long) setppriv(op, which, set);
+	priv_freeset(set);	
+	// Python inverts true & false
+	if(ret)
+		Py_RETURN_FALSE;
+	
+	Py_RETURN_TRUE;
+}
+
+static PyObject *
+pyprivileges_getppriv( PyObject *self, PyObject *args) {
+
+	char* set_str = NULL;
+	priv_ptype_t which = NULL;
+	priv_set_t * set = priv_allocset();
+	if (set == NULL)
+		return NULL;
+
+	if(!PyArg_ParseTuple(args, "i:getppriv", &which))
+		return NULL;
+
+	if (which != PRIV_PERMITTED && which != PRIV_EFFECTIVE &&
+	which != PRIV_INHERITABLE && which != PRIV_LIMIT)
+		return NULL;
+
+	if (getppriv(which, set) != 0)
+		return NULL;
+	
+	set_str = priv_set_to_str(set, ',', PRIV_STR_LIT);
+	priv_freeset(set);
+	
+	PyObject* set_list = PyList_New(NULL);
+	char* saveptr;
+	char* item = strtok_r(set_str, ",", &saveptr);
+	PyList_Append(set_list, PyString_FromString(item));
+
+	while((item = strtok_r(NULL, ",", &saveptr)) != NULL) {
+		if(PyList_Append(set_list, PyString_FromString(item)) != 0) {
+			Py_XDECREF(set_list);
+			return NULL;
+		}
+	}
+
+	return(set_list);
+}
+
+static PyObject *
+pyprivileges_priv_inverse( PyObject *self, PyObject *args ) {
+
+	PyObject* set_list_in = NULL;
+	if(!PyArg_ParseTuple(args, "O:priv_inverse", &set_list_in))
+		return NULL;
+
+	PyObject* set_string = PyList_GetItem(set_list_in, 0);
+	int i;
+	for (i = 1; i < PyList_Size(set_list_in); ++i) {
+		PyString_Concat(set_string, PyString_FromString(","));
+		PyString_Concat(set_string, PyList_GetItem(set_list_in, i));
+	}
+
+	priv_set_t * set = priv_str_to_set(PyString_AsString(set_string), ",", NULL);
+	if (set == NULL)
+		return NULL;
+	priv_inverse(set);
+	char * ret_str = priv_set_to_str(set, ',', PRIV_STR_LIT);
+	priv_freeset(set);
+	
+	PyObject* set_list_out = PyList_New(NULL);
+	char* saveptr;
+	char* item = strtok_r(ret_str, ",", &saveptr);
+	PyList_Append(set_list_out, PyString_FromString(item));
+
+	while((item = strtok_r(NULL, ",", &saveptr)) != NULL) {
+		if(PyList_Append(set_list_out, PyString_FromString(item)) != 0) {
+			Py_XDECREF(set_list_out);
+			return NULL;
+		}
+	}
+	
+	Py_XDECREF(set_list_in);
+	
+	return(set_list_out);
+}
+
+/* priv_ineffect is a convienient wrapper to priv_get
+ * however priv_set is, in the context of python, not
+ * much of a convienience, so it's omitted
+ */
+static PyObject * 
+pyprivileges_priv_ineffect(PyObject* self, PyObject* args) {
+	char* privstring=NULL;
+	if (!PyArg_ParseTuple(args, "s:priv_ineffect", &privstring))
+		return NULL;
+	return PyBool_FromLong(priv_ineffect(privstring));
+}
+
+
+static char pyprivileges__doc__[];
+PyDoc_STRVAR(pyprivileges__doc__, 
+"Provides functions for interacting with the Solaris privileges(5) framework\n\
+Functions provided:\n\
+setppriv\n\
+getppriv\n\
+priv_ineffect\n\
+priv_inverse");
+
+static char pyprivileges_setppriv__doc__[];
+static char pyprivileges_getppriv__doc__[];
+static char pyprivileges_priv_ineffect__doc__[];
+static char pyprivileges_priv_inverse__doc__[];
+
+PyDoc_STRVAR(pyprivileges_setppriv__doc__, 
+"Facilitates setting the permitted/inheritable/limit/effective privileges set\n\
+\tArguments:\n\
+\t\tone of (PRIV_ON|PRIV_OFF|PRIV_SET)\n\
+\t\tone of (PRIV_PERMITTED|PRIV_INHERITABLE|PRIV_LIMIT|PRIV_EFFECTIVE)\n\
+\t\tset of privileges: a list of strings\n\
+\tReturns: True on success, False on failure\
+");
+
+PyDoc_STRVAR(pyprivileges_getppriv__doc__, 
+"Return the process privilege set\n\
+\tArguments:\n\
+\t\tone of (PRIV_PERMITTED|PRIV_INHERITABLE|PRIV_LIMIT|PRIV_EFFECTIVE)\n\
+\tReturns: a Python list of strings");
+	
+PyDoc_STRVAR(pyprivileges_priv_ineffect__doc__, 
+"Checks for a privileges presence in the effective set\n\
+\tArguments: a String\n\
+\tReturns: True if the privilege is in effect, False otherwise");
+
+PyDoc_STRVAR(pyprivileges_priv_inverse__doc__, 
+"The complement of the set of privileges\n\
+\tArguments: a list of strings\n\tReturns: a list of strings");
+
+static PyMethodDef module_methods[] = {
+	{"setppriv", pyprivileges_setppriv, METH_VARARGS, pyprivileges_setppriv__doc__}, 
+	{"getppriv", pyprivileges_getppriv, METH_VARARGS, pyprivileges_getppriv__doc__}, 
+	{"priv_ineffect", pyprivileges_priv_ineffect, METH_VARARGS, pyprivileges_priv_ineffect__doc__},
+	{"priv_inverse", pyprivileges_priv_inverse, METH_VARARGS, pyprivileges_priv_inverse__doc__},
+	{NULL}
+};
+
+
+#ifndef PyMODINIT_FUNC	/* declarations for DLL import/export */
+#define PyMODINIT_FUNC void
+#endif
+PyMODINIT_FUNC
+initprivileges(void) {
+	PyObject* m;
+
+	m = Py_InitModule3("privileges", module_methods, pyprivileges__doc__);
+		if ( m == NULL )
+		return;
+		
+	PyObject* d = PyModule_GetDict(m);
+	if (d == NULL)
+		return;
+
+	PyDict_SetItemString(d, "PRIV_ON", PyInt_FromLong((long)PRIV_ON));
+	PyDict_SetItemString(d, "PRIV_OFF", PyInt_FromLong((long)PRIV_OFF));
+	PyDict_SetItemString(d, "PRIV_SET", PyInt_FromLong((long)PRIV_SET));
+
+	PyDict_SetItemString(d, "PRIV_PERMITTED", PyInt_FromLong((long)PRIV_PERMITTED));
+	PyDict_SetItemString(d, "PRIV_INHERITABLE", PyInt_FromLong((long)PRIV_INHERITABLE));
+	PyDict_SetItemString(d, "PRIV_LIMIT", PyInt_FromLong((long)PRIV_LIMIT));
+	PyDict_SetItemString(d, "PRIV_EFFECTIVE", PyInt_FromLong((long)PRIV_EFFECTIVE));
+}
diff --git Python-2.6.4/Modules/pyrbac.c Python-2.6.4/Modules/pyrbac.c
new file mode 100644
--- /dev/null
+++ Python-2.6.4/Modules/pyrbac.c
@@ -0,0 +1,68 @@
+/*
+ * CDDL HEADER START
+ *
+ * The contents of this file are subject to the terms of the
+ * Common Development and Distribution License (the "License").
+ * You may not use this file except in compliance with the License.
+ *
+ * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+ * or http://www.opensolaris.org/os/licensing.
+ * See the License for the specific language governing permissions
+ * and limitations under the License.
+ *
+ * When distributing Covered Code, include this CDDL HEADER in each
+ * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+ * If applicable, add the following below this CDDL HEADER, with the
+ * fields enclosed by brackets "[]" replaced with your own identifying
+ * information: Portions Copyright [yyyy] [name of copyright owner]
+ *
+ * CDDL HEADER END
+ */
+
+/*
+ * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
+ */
+
+/*
+ * RBAC Bindings for Python
+ */
+
+#include <Python.h>
+#include "pyrbac.h"
+
+static PyMethodDef module_methods[] = {NULL};
+static char pyrbac__doc__[];
+
+PyDoc_STRVAR(pyrbac__doc__, "provides access to some objects \
+for interaction with the Solaris Role-Based Access Control \
+framework.\n\nDynamic objects:\n\
+userattr -- for interacting with user_attr(4)\n\
+authattr -- for interacting with auth_attr(4)\n\
+execattr -- for interacting with exec_attr(4)\n");
+
+#ifndef PyMODINIT_FUNC	/* declarations for DLL import/export */
+#define PyMODINIT_FUNC void
+#endif
+PyMODINIT_FUNC
+initrbac(void) {
+	PyObject* m;
+	if (PyType_Ready(&AuthattrType) < 0 || 
+		PyType_Ready(&ExecattrType) < 0 ||
+		PyType_Ready(&UserattrType) < 0 )
+		return;
+
+	m = Py_InitModule3("rbac", module_methods, pyrbac__doc__);
+	if ( m == NULL )
+		return;
+	
+	Py_INCREF(&AuthattrType);
+	PyModule_AddObject(m, "authattr", (PyObject*)&AuthattrType);
+
+	Py_INCREF(&ExecattrType);
+	PyModule_AddObject(m, "execattr", (PyObject*)&ExecattrType);
+
+	Py_INCREF(&UserattrType);
+	PyModule_AddObject(m, "userattr", (PyObject*)&UserattrType);
+
+}
+
diff --git Python-2.6.4/Modules/pyrbac.h Python-2.6.4/Modules/pyrbac.h
new file mode 100644
--- /dev/null
+++ Python-2.6.4/Modules/pyrbac.h
@@ -0,0 +1,45 @@
+/*
+ * CDDL HEADER START
+ *
+ * The contents of this file are subject to the terms of the
+ * Common Development and Distribution License (the "License").
+ * You may not use this file except in compliance with the License.
+ *
+ * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+ * or http://www.opensolaris.org/os/licensing.
+ * See the License for the specific language governing permissions
+ * and limitations under the License.
+ *
+ * When distributing Covered Code, include this CDDL HEADER in each
+ * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+ * If applicable, add the following below this CDDL HEADER, with the
+ * fields enclosed by brackets "[]" replaced with your own identifying
+ * information: Portions Copyright [yyyy] [name of copyright owner]
+ *
+ * CDDL HEADER END
+ */
+
+/*
+ * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
+ */
+
+/* 
+ * RBAC bindings for python
+ */
+#ifndef PYRBAC_H
+#define PYRBAC_H
+
+#include <secdb.h>
+
+
+#define PYRBAC_USER_MODE 1
+#define PYRBAC_PROF_MODE 2
+#define PYRBAC_ATTR_MODE 3
+#define PYRBAC_NAM_MODE 4
+#define PYRBAC_UID_MODE 5
+
+PyTypeObject AuthattrType;
+PyTypeObject ExecattrType;
+PyTypeObject UserattrType;
+
+#endif
diff --git Python-2.6.4/Modules/userattr.c Python-2.6.4/Modules/userattr.c
new file mode 100644
--- /dev/null
+++ Python-2.6.4/Modules/userattr.c
@@ -0,0 +1,308 @@
+/*
+ * CDDL HEADER START
+ *
+ * The contents of this file are subject to the terms of the
+ * Common Development and Distribution License (the "License").
+ * You may not use this file except in compliance with the License.
+ *
+ * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+ * or http://www.opensolaris.org/os/licensing.
+ * See the License for the specific language governing permissions
+ * and limitations under the License.
+ *
+ * When distributing Covered Code, include this CDDL HEADER in each
+ * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+ * If applicable, add the following below this CDDL HEADER, with the
+ * fields enclosed by brackets "[]" replaced with your own identifying
+ * information: Portions Copyright [yyyy] [name of copyright owner]
+ *
+ * CDDL HEADER END
+ */
+
+/*
+ * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
+ */
+
+/*
+ * RBAC Bindings for Python - user_attr functions
+ */
+
+#include <stdio.h>
+#include <user_attr.h>
+#include "Python.h"
+#include "pyrbac.h"
+
+static PyObject*
+pyrbac_setuserattr(PyObject* self, PyObject* args) {
+	setuserattr();
+	return Py_None;
+}
+
+static PyObject*
+pyrbac_enduserattr(PyObject* self, PyObject* args) {
+	enduserattr();
+	return Py_None;
+}
+
+PyObject*
+pyrbac_getuseruidnamattr(PyObject* self, void* arg, int mode, char* filename) {
+	
+	userattr_t *ret_userattr;
+
+	if (mode == PYRBAC_ATTR_MODE) {
+	    if (filename != NULL) {
+            FILE* file = fopen(filename, "r");
+            if (file == NULL)
+                return NULL;
+	        ret_userattr = fgetuserattr(file);
+	        if (fclose(file))
+                return NULL;
+	    }
+	    else
+	    	ret_userattr = getuserattr();
+	}
+	else if (mode == PYRBAC_NAM_MODE)
+		ret_userattr = getusernam((char*) arg);
+	else if (mode == PYRBAC_UID_MODE)
+		ret_userattr = getuseruid(*((uid_t*) arg));
+	
+	if (ret_userattr == NULL)
+		return Py_None;
+	
+	PyObject* entry = PyTuple_New(5);
+	if (entry == NULL) {
+		free_userattr(ret_userattr);
+		return NULL;
+	}
+	
+	PyObject* kv_data = PyDict_New();
+
+	if(ret_userattr->attr != NULL) {
+		int len;
+		for(len = 0; len < ret_userattr->attr->length; len++) {
+			kv_t current = ret_userattr->attr->data[len];
+
+			PyObject* set = PyList_New(NULL);
+			char* saveptr;
+			char* item = strtok_r(current.value, ",", &saveptr);
+			PyList_Append(set, PyString_FromString(item));
+
+			while((item = strtok_r(NULL, ",", &saveptr)) != NULL) {
+				if(PyList_Append(set, PyString_FromString(item)) != 0) {
+					Py_XDECREF(set);
+					Py_XDECREF(kv_data);
+					free_userattr(ret_userattr);
+					return NULL;
+				}
+			}
+			if(PyDict_SetItemString(kv_data, current.key, set)) {
+					free_userattr(ret_userattr);
+					return NULL;
+			}
+		}
+	}
+	entry = Py_BuildValue("{s:s,s:s,s:s,s:s,s:O}", 
+		"name", ret_userattr->name,
+		"qualifier", ret_userattr->qualifier,
+		"res1", ret_userattr->res1,
+		"res2", ret_userattr->res2,
+		"attributes", kv_data);
+
+	free_userattr(ret_userattr);
+	
+	return entry;
+}
+
+
+static PyObject*
+pyrbac_getuserattr(PyObject* self, PyObject* args) {
+	return(pyrbac_getuseruidnamattr(self, (void*) NULL, PYRBAC_ATTR_MODE, NULL));
+}
+
+static PyObject*
+pyrbac_fgetuserattr(PyObject* self, PyObject* args) {
+	char* filename = NULL;
+	if(!PyArg_ParseTuple(args, "s:fgetuserattr", &filename))
+		return NULL;
+	return(pyrbac_getuseruidnamattr(self, NULL, PYRBAC_ATTR_MODE, filename));
+}
+
+static PyObject*
+pyrbac_getusernam(PyObject* self, PyObject* args) {
+	char* name = NULL;
+	if(!PyArg_ParseTuple(args, "s:getusernam", &name))
+		return NULL;
+	return(pyrbac_getuseruidnamattr(self, (void*) name, PYRBAC_NAM_MODE, NULL));
+}
+
+static PyObject*
+pyrbac_getuseruid(PyObject* self, PyObject* args) {
+	uid_t uid;
+	if(!PyArg_ParseTuple(args, "i:getuseruid", &uid))
+		return NULL;
+	return(pyrbac_getuseruidnamattr(self, (void*) &uid, PYRBAC_UID_MODE, NULL));
+}
+
+static PyObject*
+pyrbac_userattr_next(PyObject* self, PyObject* args) {
+	PyObject* retval = pyrbac_getuserattr(self, args);
+	if( retval == Py_None ) {
+		setuserattr();
+		return NULL;
+	}
+	return retval;
+}
+static PyObject*
+pyrbac_userattr__iter__(PyObject* self, PyObject* args) {
+	return self;
+}
+
+typedef struct {
+	PyObject_HEAD
+} Userattr;
+
+static void
+Userattr_dealloc(Userattr* self) {
+	enduserattr();
+	self->ob_type->tp_free((PyObject*) self);
+}
+
+static PyObject*
+Userattr_new(PyTypeObject *type, PyObject *args, PyObject *kwds) {
+	Userattr *self;
+	self = (Userattr*)type->tp_alloc(type, 0);
+
+	return ((PyObject *) self);
+}
+
+static int
+Userattr_init(Userattr* self, PyObject *args, PyObject *kwargs) {
+	setuserattr();
+	return 0;
+}
+
+static char pyrbac_userattr__doc__[];
+PyDoc_STRVAR(pyrbac_userattr__doc__, "provides functions for \
+interacting with the extended user attributes database. May be iterated over \
+to enumerate user_attr(4) entries\n\n\
+Methods provided:\n\
+setuserattr\n\
+enduserattr\n\
+getuserattr\n\
+fgetuserattr\n\
+getusernam\n\
+getuseruid");
+
+static char pyrbac_setuserattr__doc__[];
+static char pyrbac_enduserattr__doc__[];
+static char pyrbac_getuserattr__doc__[];
+static char pyrbac_getusernam__doc__[];
+static char pyrbac_getuseruid__doc__[];
+
+PyDoc_STRVAR(pyrbac_setuserattr__doc__, "\"rewinds\" the user_attr functions \
+to the first entry in the db. Called automatically by the constructor.\n\
+\tArguments: None\n\
+\tReturns: None");
+
+PyDoc_STRVAR(pyrbac_enduserattr__doc__, "closes the user_attr database, \
+cleans up storage. called automatically by the destructor\n\
+\tArguments: None\n\
+\tReturns: None");
+
+PyDoc_STRVAR(pyrbac_getuserattr__doc__, "Return a single user_attr entry\n \
+\tArguments: None\n\
+\tReturns: a dict representation of a userattr_t struct:\n\
+\t\t\"name\": username\n\
+\t\t\"qualifier\": reserved\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as either a list \
+or a string depending on value"
+);
+
+PyDoc_STRVAR(pyrbac_fgetuserattr__doc__, "Return a single user_attr entry \
+from a file, bypassing nsswitch.conf\n\
+\tArguments: \'filename\'\n\
+\tReturns: a dict representation of a userattr_t struct:\n\
+\t\t\"name\": username\n\
+\t\t\"qualifier\": reserved\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as either a list \
+or a string depending on value");
+
+PyDoc_STRVAR(pyrbac_getusernam__doc__, "Searches for a user_attr entry with a \
+given user name\n\
+\tArgument: \'username\'\n\
+\tReturns: a dict representation of a userattr_t struct:\n\
+\t\t\"name\": username\n\
+\t\t\"qualifier\": reserved\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as either a list \
+or a string depending on value");
+
+PyDoc_STRVAR(pyrbac_getuseruid__doc__, "Searches for a user_attr entry with a \
+given uid\n\
+\tArgument: uid\n\
+\tReturns: a dict representation of a userattr_t struct:\n\
+\t\t\"name\": username\n\
+\t\t\"qualifier\": reserved\n\
+\t\t\"res1\": reserved\n\
+\t\t\"res2\": reserved\n\
+\t\t\"attributes\": A Python dict keyed by attribute & valued as either a list \
+or a string depending on value");
+
+static PyMethodDef Userattr_methods[] = {
+	{"setuserattr", pyrbac_setuserattr, METH_NOARGS, pyrbac_setuserattr__doc__},
+	{"enduserattr", pyrbac_enduserattr, METH_NOARGS, pyrbac_enduserattr__doc__},
+	{"getuserattr", pyrbac_getuserattr, METH_NOARGS, pyrbac_getuserattr__doc__},
+	{"fgetuserattr", pyrbac_fgetuserattr, METH_VARARGS, pyrbac_fgetuserattr__doc__},
+	{"getusernam", pyrbac_getusernam, METH_VARARGS, pyrbac_getusernam__doc__},
+	{"getuseruid", pyrbac_getuseruid, METH_VARARGS, pyrbac_getuseruid__doc__},
+	{NULL}
+};
+
+PyTypeObject UserattrType = {
+	PyObject_HEAD_INIT(NULL)
+	0,                         /*ob_size*/
+	"rbac.userattr",             /*tp_name*/
+	sizeof(Userattr),             /*tp_basicsize*/
+	0,                         /*tp_itemsize*/
+	(destructor)Userattr_dealloc, /*tp_dealloc*/
+	0,                         /*tp_print*/
+	0,                         /*tp_getattr*/
+	0,                         /*tp_setattr*/
+	0,                         /*tp_compare*/
+	0,                         /*tp_repr*/
+	0,                         /*tp_as_number*/
+	0,                         /*tp_as_sequence*/
+	0,                         /*tp_as_mapping*/
+	0,                         /*tp_hash */
+	0,                         /*tp_call*/
+	0,                         /*tp_str*/
+	0,                         /*tp_getattro*/
+	0,                         /*tp_setattro*/
+	0,                         /*tp_as_buffer*/
+	Py_TPFLAGS_DEFAULT |
+	Py_TPFLAGS_BASETYPE |
+	Py_TPFLAGS_HAVE_ITER, /*tp_flags*/
+	pyrbac_userattr__doc__,    /* tp_doc */
+	0,		               /* tp_traverse */
+	0,		               /* tp_clear */
+	0,		               /* tp_richcompare */
+	0,		               /* tp_weaklistoffset */
+	pyrbac_userattr__iter__,		               /* tp_iter */
+	pyrbac_userattr_next,         /* tp_iternext */
+	Userattr_methods,             /* tp_methods */
+	0,             /* tp_members */
+	0,                         /* tp_getset */
+	0,                         /* tp_base */
+	0,                         /* tp_dict */
+	0,                         /* tp_descr_get */
+	0,                         /* tp_descr_set */
+	0,                         /* tp_dictoffset */
+	(initproc)Userattr_init,      /* tp_init */
+	0,                         /* tp_alloc */
+	Userattr_new,                 /* tp_new */
+};
--- Python-2.7.6/setup.py.~4~	2014-05-14 13:16:33.749494047 -0700
+++ Python-2.7.6/setup.py	2014-05-14 13:16:33.803607449 -0700
@@ -1573,6 +1573,22 @@
             exts.append( Extension('dlpi', ['dlpimodule.c'],
                                    libraries = ['dlpi']) )
 
+        # privileges module (Solaris)
+        priv_inc = find_file('priv.h', [], inc_dirs)
+        if priv_inc is not None:
+            exts.append( Extension('privileges', ['privileges.c']))
+
+        # rbac module (Solaris)
+        secdb_inc = find_file('secdb.h', [], inc_dirs)
+        aa_inc = find_file('auth_attr.h', [], inc_dirs)
+        ea_inc = find_file('exec_attr.h', [], inc_dirs)
+        ua_inc = find_file('user_attr.h', [], inc_dirs)
+        if secdb_inc is not None and aa_inc is not None and \
+            ea_inc is not None and ua_inc is not None:
+            exts.append( Extension('rbac', ['pyrbac.c', 'authattr.c', \
+                                   'execattr.c', 'userattr.c'],
+                                   libraries = ['nsl', 'socket', 'secdb']) )
+
         # Thomas Heller's _ctypes module
         self.detect_ctypes(inc_dirs, lib_dirs)
 
--- /dev/null	2011-02-12 03:13:57.000000000 -0600
+++ Python-2.6.4/Lib/test/privrbactest.py	2011-01-20 13:52:42.862305331 -0600
@@ -0,0 +1,289 @@
+#!/ec/bin/python2.7
+#
+# CDDL HEADER START
+#
+# The contents of this file are subject to the terms of the
+# Common Development and Distribution License (the "License").
+# You may not use this file except in compliance with the License.
+#
+# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
+# or http://www.opensolaris.org/os/licensing.
+# See the License for the specific language governing permissions
+# and limitations under the License.
+#
+# When distributing Covered Code, include this CDDL HEADER in each
+# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
+# If applicable, add the following below this CDDL HEADER, with the
+# fields enclosed by brackets "[]" replaced with your own identifying
+# information: Portions Copyright [yyyy] [name of copyright owner]
+#
+# CDDL HEADER END
+#
+
+# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
+
+import privileges
+import rbac
+import os
+import sys
+import tempfile
+
+# privileges tests
+
+def test_setppriv():
+    amchild = os.fork()
+    if amchild == 0:
+        if privileges.setppriv(privileges.PRIV_OFF, privileges.PRIV_EFFECTIVE, 
+            ['proc_fork']):
+            try:
+                os.fork()
+                sys.exit(1)
+            except OSError, e:
+                sys.exit(0)
+
+    child = os.wait()
+    if child[1] is not 0:
+        print "setppriv. Bad exit status from pid %i\n" % child[0]
+        return False
+    return True
+
+def test_getppriv():
+    if 'proc_fork' in privileges.getppriv(privileges.PRIV_LIMIT):
+        return True
+    print "getppriv or PRIV_PROC_FORK not in PRIV_LIMIT.\n"
+    return False
+
+def test_priv_ineffect():
+    if privileges.priv_ineffect('proc_fork'):
+        return True
+    print "priv_ineffect or PRIV_PROC_FORK not in effect\n"
+    return False
+
+# authattr tests
+
+def test_chkauthattr():
+    try:
+        a = rbac.authattr()
+    except Exception, e:
+        print "Could not instantiate authattr object: %s\n" % e
+        return False
+    try:
+        res = a.chkauthattr('solaris.*', 'root')
+    except Exception, e:
+        print "chkauthattr failed: %s\n" % e
+        return False
+    if not res:
+        print "chkauthattr failed or \'root\' lacks \'solaris.*\'\n"
+        return False
+    return True
+
+def test_getauthattr():
+    try:
+        a = rbac.authattr()
+    except Exception, e:
+        print "Could not instantiate authattr object: %s\n" % e
+        return False
+    try:
+        res = a.getauthattr()
+    except Exception, e:
+        print "getauthattr failed: %s\n" % e
+        return False
+    if not 'name' in res.keys():
+        print "getauthattr failed\n"
+        return False
+    return True
+
+def test_getauthnam():
+    try:
+        a = rbac.authattr()
+    except Exception, e:
+        print "Could not instantiate authattr object: %s\n" % e
+        return False
+    try:
+        res = a.getauthnam('solaris.')
+    except Exception, e:
+        print "getauthnam failed: %s\n" % e
+        return False
+    if not res:
+        print "getauthnam failed or \'solaris.\' not in auth_attr(4)\n"
+        return False
+    return True
+
+def test_authattr_iter():
+    try:
+        a = rbac.authattr()
+    except Exception, e:
+        print "Could not instantiate authattr object: %s\n" % e
+        return False
+    res = a.next()
+    if not 'name' in res.keys() or type(a) != type(a.__iter__()):
+        print "authattr object is not an iterable\n"
+        return False
+    return True
+
+# execattr tests
+
+def test_getexecattr():
+    try:
+        a = rbac.execattr()
+    except Exception, e:
+        print "Could not instantiate execattr object: %s\n" % e
+        return False
+    try:
+        res = a.getexecattr()
+    except Exception, e:
+        print "getexecattr failed: %s\n" % e
+        return False
+    if not 'name' in res.keys():
+        print "getexecattr failed\n"
+        return False
+    return True
+
+def test_getexecuser():
+    try:
+        a = rbac.execattr()
+    except Exception, e:
+        print "Could not instantiate execattr object: %s\n" % e
+        return False
+    try:
+        res = a.getexecuser("root", "act", "*;*;*;*;*")
+    except Exception, e:
+        print "getexecuser failed: %s\n" % e
+        return False
+    if not res:
+        print "getexecuser failed or \'root\' not assigned to \'act\', " \
+            "\'*;*;*;*;*\' \n"
+        return False
+    return True
+
+
+def test_getexecprof():
+    try:
+        a = rbac.execattr()
+    except Exception, e:
+        print "Could not instantiate execattr object: %s\n" % e
+        return False
+    try:
+        res = a.getexecprof("All", "cmd", "*")
+    except Exception, e:
+        print "getexecprof failed: %s\n" % e
+        return False
+    if not res:
+        print "getexecprof failed or \'All\' not granted \'cmd\' : \'*\'\n"
+        return False
+    return True
+
+def test_execattr_iter():
+    try:
+        a = rbac.execattr()
+    except Exception, e:
+        print "Could not instantiate execattr object: %s\n" % e
+        return False
+    res = a.next()
+    if not 'name' in res.keys() or type(a) != type(a.__iter__()):
+        print "execattr object is not an iterable\n"
+        return False
+    return True
+
+# userattr tests
+
+def test_getuserattr():
+    try:
+        a = rbac.userattr()
+    except Exception, e:
+        print "Could not instantiate userattr object: %s\n" % e
+        return False
+    try:
+        res = a.getuserattr()
+    except Exception, e:
+        print "getuserattr failed: %s\n" % e
+        return False
+    if not 'name' in res.keys():
+        print "getuserattr failed\n"
+        return False
+    return True
+
+def test_fgetuserattr():
+    temp = tempfile.NamedTemporaryFile()
+    temp.write("user::::profiles=Software Installation;roles=foo;"\
+        "auths=solaris.foo.bar")
+    temp.seek(0)
+    try:
+        a = rbac.userattr()
+    except Exception, e:
+        print "Could not instantiate userattr object: %s\n" % e
+        return False
+    try:
+        res = a.fgetuserattr(temp.name)
+        temp.close()    
+    except Exception, e:
+        print "fgetuserattr failed: %s\n" % e
+        temp.close()
+        return False
+    if not 'name' in res.keys():
+        print "fgetuserattr failed\n"
+        return False
+    return True
+
+def test_getuseruid():
+    try:
+        a = rbac.userattr()
+    except Exception, e:
+        print "Could not instantiate userattr object: %s\n" % e
+        return False
+    try:
+        res = a.getuseruid(0)
+    except Exception, e:
+        print "getusernam failed: %s\n" % e
+        return False
+    if not 'name' in res:
+        print "getusernam failed or no uid 0\n"
+        return False
+    return True
+
+def test_getusernam():
+    try:
+        a = rbac.userattr()
+    except Exception, e:
+        print "Could not instantiate userattr object: %s\n" % e
+        return False
+    try:
+        res = a.getusernam('root')
+    except Exception, e:
+        print "getusernam failed: %s\n" % e
+        return False
+    if not 'name' in res:
+        print "getusernam failed or no \'root\' user\n"
+        return False
+    return True
+
+def test_userattr_iter():
+    try:
+        a = rbac.userattr()
+    except Exception, e:
+        print "Could not instantiate userattr object: %s\n" % e
+        return False
+    res = a.next()
+    if not 'name' in res.keys() or type(a) != type(a.__iter__()):
+        print "userattr object is not an iterable\n"
+        return False
+    return True
+
+if not test_setppriv() or not test_getppriv() or not test_priv_ineffect():
+    print "*** Failures detected in privileges module\n"    
+    sys.exit(1)
+
+if not test_getauthattr() or not test_chkauthattr() or not test_getauthnam() \
+    or not test_authattr_iter:
+    print "*** Failures detected in rbac.authattr\n"
+    sys.exit(1)
+
+if not test_getexecattr() or not test_getexecuser() or not test_getexecprof() \
+    or not test_execattr_iter():
+    print "*** Failures detected in rbac.execattr\n"
+    sys.exit(1)
+
+if not test_getuserattr() or not test_fgetuserattr() or not test_getusernam()\
+    or not test_getuseruid() or not test_userattr_iter():
+    print "*** Failures detected in rbac.userattr\n"
+    sys.exit(1)
