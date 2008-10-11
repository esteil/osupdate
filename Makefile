# Makefile
# osupdate
# 
# Copyright (c) 2008 Eric Steil III.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
CFLAGS=-mmacosx-version-min=10.4 -framework Foundation -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386

default: osupdate

clean:
	rm osupdate
		
osupdate: osupdate.m
	$(CC) $(CFLAGS) -o osupdate osupdate.m
#	gcc -o osupdate osupdate.m -mmacosx-version-min=10.4 -framework Foundation -framework AppleTV -isysroot /Developer/SDKs/MacOSX10.4u.sdk -F/Developer/SDKs/MacOSX10.4u.sdk/System/Library/PrivateFrameworks

.PHONY: clean
