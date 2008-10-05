// stupid little app to force an update to be installed
// 
// put a OS dmg in /Users/frontrow/Updates and run this *as root*
//
// build with (must have AppleTV.framework somewhere reasonable):
// gcc -o osupdate osupdate.m -mmacosx-version-min=10.4 -framework Foundation -framework AppleTV -isysroot /Developer/SDKs/MacOSX10.4u.sdk -F/Developer/SDKs/MacOSX10.4u.sdk/System/Library/PrivateFrameworks

#import <Foundation/Foundation.h>

@interface ATVSettingsHelper
+(id)sharedInstance;
-(BOOL)performOSUpdate:(BOOL)fp8 EFIUpdate:(BOOL)fp12 IRUpdate:(BOOL)fp16 SIUpdate:(BOOL)fp20;
@end

int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [NSAutoreleasePool new];
  
  NSLog(@"Requesting update");
  
  BOOL result = [[ATVSettingsHelper sharedInstance] performOSUpdate:YES EFIUpdate:NO IRUpdate:NO SIUpdate:NO];
  
  NSLog(@"Update requested: %d", result);

  [pool release];
}