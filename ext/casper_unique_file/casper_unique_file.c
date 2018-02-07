/*
 * Copyright (c) 2018 Cloudware S.A. All rights reserved.
 *
 * This file is part of casper-unique-file.
 *
 * casper-unique-file is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * casper-unique-file  is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with casper-unique-file.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <ruby.h>
#include <ruby/intern.h>
#include <ruby/encoding.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

/**
 * @brief Creates a uniquely named file inside the specified folder. The created file is empty
 *
 * @param a_self Object handle, ignored
 * @param a_folder Folder where the file will be created
 *
 * @return Absolute file path   
 */
VALUE _casper_unique_filename (VALUE a_self, VALUE a_folder)
{
  const char* template = "XXXXXX";  /* file template */
  char        fname[PATH_MAX];      /* path to be created */
  char        fpath[PATH_MAX];      /* full file path */
  int         fd;                   /* file descriptor */
  char*       folder;							  /* base folder where we'll create the file */
  VALUE       rv;                   /* Return value to ruby */

	if ( NIL_P(a_folder) || TYPE(a_folder) != T_STRING ) {
		rb_raise(rb_eArgError, "expecting a string as a_folder argument");
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
