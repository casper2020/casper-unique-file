require 'mkmf'

# have_func returns false if a C function cannot be found.  Sometimes this
# will be OK (the function changed names between versions) and sometimes it is
# not so you need to exit without creating the Makefile.

abort 'missing mkstemp()'  unless have_func 'mkstemp'
abort 'missing snprintf()' unless have_func 'snprintf'
abort 'missing fcntl()'    unless have_func 'fcntl'

$defs.push('-O2 -g')

$objs = %w[
            casper_unique_file.o
          ]

extension_name = 'casper_unique_file'

# Now we create the Makefile that will install the extension as
# lib/casper_unique_file/casper_unique_file.so.

create_makefile('casper_unique_file/casper_unique_file')

