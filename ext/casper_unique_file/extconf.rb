#
# Copyright (c) 2018 Cloudware S.A. All rights reserved.
#
# This file is part of casper-unique-file.
#
# casper-unique-file is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# casper-unique-file  is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with casper-unique-file.  If not, see <http://www.gnu.org/licenses/>.
#
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

