CFLAGS=-mmacosx-version-min=10.4 -framework Foundation -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386

default: osupdate

clean:
	rm osupdate
		
osupdate: osupdate.m
	$(CC) $(CFLAGS) -o osupdate osupdate.m
#	gcc -o osupdate osupdate.m -mmacosx-version-min=10.4 -framework Foundation -framework AppleTV -isysroot /Developer/SDKs/MacOSX10.4u.sdk -F/Developer/SDKs/MacOSX10.4u.sdk/System/Library/PrivateFrameworks

.PHONY: clean