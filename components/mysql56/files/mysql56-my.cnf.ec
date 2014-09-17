[client]
port				= 3306
socket				= /tmp/mysql.sock

[mysqld]
# Port and Socket are controlled via SMF properties
#port			= 3306
#socket			= /tmp/mysql.sock

#skip-networking
#skip-external-locking

key_buffer_size			= 64M
max_allowed_packet		= 16M
table_open_cache		= 256
sort_buffer_size		= 1M
read_buffer_size		= 1M
read_rnd_buffer_size		= 8M
myisam_sort_buffer_size		= 32M
thread_cache_size		= 8
thread_concurrency		= 8

#max_connections		= 
#max_sort_length		= 
#tmp_table_size			= 

query_cache_limit		= 8M
query_cache_size		= 32M
query_cache_type		= 1

server-id			= 1
#log-bin			= mysql-bin
#binlog_format			= mixed

#collation_server		= utf8_unicode_ci
#character_set_server		= utf8

innodb_file_per_table           = true
innodb_data_home_dir            = /ec/var/mysql/5.6/data
innodb_data_file_path           = ibdata1:100M:autoextend
innodb_log_group_home_dir       = /ec/var/mysql/5.6/data
innodb_buffer_pool_size         = 32M
innodb_additional_mem_pool_size = 20M
innodb_log_file_size            = 100M
innodb_log_buffer_size          = 8M


[mysqldump]
quick
max_allowed_packet		= 16M


[myisamchk]
key_buffer_size			= 128M
sort_buffer_size		= 128M
read_buffer			= 2M
write_buffer			= 2M


[mysqlhotcopy]
interactive-timeout
