// osupdate.m
// osupdate
//
// Kick off an Apple TV update from files in /Users/frontrow/Updates.
// This must be run as root.
//
// Copyright (c) 2008 Eric Steil III.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import <Foundation/Foundation.h>
#import <stdio.h>

@interface ATVSettingsHelper
+(id)sharedInstance;
-(BOOL)performOSUpdate:(BOOL)fp8 EFIUpdate:(BOOL)fp12 IRUpdate:(BOOL)fp16 SIUpdate:(BOOL)fp20;
@end

@interface BRSettingsHelper
+(id)sharedInstance;
-(BOOL)performOSUpdate:(BOOL)fp8 EFIUpdate:(BOOL)fp12 IRUpdate:(BOOL)fp16 SIUpdate:(BOOL)fp20;
@end

int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [NSAutoreleasePool new];
  
  // load the appropriate framework
  // we don't link against either, since on 1.1+ it's AppleTV.framework and on 1.0 it's BackRow.framework
  
  // Try ATV11+ first
  NSBundle *appleTVFramework = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppleTV.framework"];
  if(appleTVFramework) {
    NSLog(@"Running on Apple TV 1.1+");
    [appleTVFramework load];
  } else {
    appleTVFramework = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/BackRow.framework"];
    if(appleTVFramework) {
      NSLog(@"Running on Apple TV 1.0");
      [appleTVFramework load];
    }
  }

  if(!appleTVFramework) {
    fprintf(stderr, "Unable to load Apple TV frameworks.\n");
    exit(1);
  }
  
  id settingsHelper = nil;
  Class cls = nil;
  if(cls = NSClassFromString(@"ATVSettingsHelper")) {
    settingsHelper = [cls sharedInstance];
  } else if(cls = NSClassFromString(@"BRSettingsHelper")) {
    settingsHelper = [cls sharedInstance];
  } else {
    fprintf(stderr, "Can't find ATVSettingsHelper or BRSettingsHelper class, aborting.\n");
    exit(2);
  }
  
  if(!settingsHelper) {
    fprintf(stderr, "Instance of settings helper class not found?!\n");
    exit(3);
  }
  
  // 1.1+
  // in 1.0 this is on BRSettingsHelper, same method, but 1.0 doesn't have AppleTV.framework
  NSLog(@"Requesting update");
  BOOL result = [settingsHelper performOSUpdate:YES EFIUpdate:YES IRUpdate:YES SIUpdate:YES];
  // this shouldn't actually run if there's an update to be performed.
  NSLog(@"Update requested: %d", result);

  [pool release];
}
