
#include <substrate.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>
#import <QuartzCore/QuartzCore.h>
#import "mains.h"
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
  mains * game = [[mains alloc] init];
  [game run];
}
%end
