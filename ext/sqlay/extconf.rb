require 'mkmf'
$CFLAGS = "-std=c99 -fPIC"
extension_name = "sqlay"

dir_config(extension_name)
dir_config("sqlite3")

find_header('sqlite3.h')
find_library('sqlite3', 'sqlite3_libversion_number')
have_func('sqlite3_open')

create_makefile(extension_name)
