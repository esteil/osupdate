default: osupdate
	
osupdate: osupdate.m
	gcc -o osupdate osupdate.m -mmacosx-version-min=10.4 -framework Foundation -framework AppleTV -isysroot /Developer/SDKs/MacOSX10.4u.sdk -F/Developer/SDKs/MacOSX10.4u.sdk/System/Library/PrivateFrameworks