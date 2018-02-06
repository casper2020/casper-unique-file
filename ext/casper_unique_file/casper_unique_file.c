
#include <ruby.h>
#include <ruby/intern.h>
#include <ruby/encoding.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

// http://clalance.blogspot.pt/2011/01/writing-ruby-extensions-in-c-part-10.html

VALUE _casper_unique_filename (VALUE a_self, VALUE a_folder)
{
  const char* template = "XXXXXX";  /* file template */
  char        fname[PATH_MAX];      /* path to be created */
  char        fpath[PATH_MAX];      /* full file path */
  int         fd;                   /* file descriptor */
  char*       folder;							  /* base folder where we'll create the file */
  VALUE       rv;                   /* Return value to ruby */

	fprintf(stderr, "Type is %d\n", TYPE(a_folder));
	if ( NIL_P(a_folder) || TYPE(a_folder) != T_STRING ) {
		rb_raise(rb_eArgError, "expecting a string as a_expression argument");
	}
	folder = StringValueCStr(a_folder);

  /* concats argument path with file template */
  snprintf(fname, sizeof(fname) - 1, "%s/%s", folder, template);

  /* create file */
  fd = mkstemp(fname);

  /* get file full name */
  if (fcntl(fd, F_GETPATH, fpath) != -1) {
    close(fd);
    rv = rb_enc_str_new_cstr(fpath, rb_enc_find("UTF-8"));
    /* exit with success */
    return rv;
  
  } else {
    close(fd);
    /* exit with error */
    return Qnil;
  }
}

/**
 * @brief This defines the C functions as extensions.
 *
 * @note The name of the Init_ function is important.  What follows Init_ must match
 * the file name (including case) so ruby knows what method to call to define
 * the extensions.
 */
void Init_casper_unique_file ()
{
  VALUE rb_mCasper  = rb_const_get(rb_cObject, rb_intern("Casper"));
  VALUE rb_mUnique  = rb_const_get(rb_mCasper, rb_intern("Unique"));
  VALUE rb_mFile    = rb_const_get(rb_mUnique, rb_intern("File"));
  rb_define_module_function(rb_mFile, "create", _casper_unique_filename, 1);
}
