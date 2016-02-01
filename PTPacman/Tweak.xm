
#include <substrate.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Game.h"
#import "Pacman.h"

__attribute__((visibility("hidden")))
%hook SBRootFolderView
BOOL start = NO;
-(void)didAnimate {
  %orig;
  if(start) {
    return;
  }
  start = YES;
  Game * game = [[Game alloc] init];
  [game run];
}
%end
