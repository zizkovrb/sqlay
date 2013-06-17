#include <stdio.h>
#include <sqlite3.h>
//#include <stdlib.h>
#include <ruby.h>

VALUE Sqlay = Qnil;

VALUE method_sqlay_execute(VALUE self, VALUE filename, VALUE query) {
  int retval;

  sqlite3 *handle;
  sqlite3_stmt *stmt;

  retval = sqlite3_open(StringValuePtr(filename), &handle);

  if(retval) {
    return Qfalse;
  }

  char * query2;
  query2 = StringValuePtr(query); //"SELECT date('now') AS date;";//StringValue(query);

  retval = sqlite3_prepare_v2(handle, query2, -1, &stmt, 0);

  if(retval) {
    return Qfalse;
  }

  int cols = sqlite3_column_count(stmt);

  VALUE result = rb_ary_new2((long)cols);

  while(1) {
    retval = sqlite3_step(stmt);

    if(retval == SQLITE_ROW) {
      VALUE row = rb_hash_new();
      for(int col=0; col<cols; col++) {
        const char *value  = sqlite3_column_text(stmt, col);
        const char *column = sqlite3_column_name(stmt, col);

        rb_hash_aset(row, rb_str_new2(column), rb_str_new2(value));
      }
      rb_ary_push(result, row);
      printf("\n");
    } else if (retval == SQLITE_DONE) {
      break;
    }
  }

  sqlite3_close(handle);

  return result;
}

void Init_sqlay() {
  Sqlay = rb_define_module("Sqlay");
  rb_define_singleton_method(Sqlay, "execute", method_sqlay_execute, 2);
}


