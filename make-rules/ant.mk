#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright (c) 2012,2013 Every City Ltd. All rights reserved.
#

ANT=/ec/bin/ant

COMPONENT_BUILD_ENV+= JAVA_HOME="$(JAVA_HOME)"
# build the configured source
$(BUILD_DIR)/%/.built:	$(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(ANT) $(COMPONENT_BUILD_ARGS) $(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

COMPONENT_INSTALL_ENV+= JAVA_HOME="$(JAVA_HOME)"
# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_INSTALL_ENV) \
		$(ANT) $(COMPONENT_INSTALL_ARGS) $(COMPONENT_INSTALL_TARGETS))
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

clean::
	$(RM) -r $(SOURCE_DIR) $(BUILD_DIR)
