#line 1 "Tweak.xm"

#include <substrate.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>
#import <QuartzCore/QuartzCore.h>
#import "mains.h"
#import "Pacman.h"

#include <logos/logos.h>
#include <substrate.h>
@class SBRootFolderView; 
static void (*_logos_orig$_ungrouped$SBRootFolderView$didAnimate)(SBRootFolderView*, SEL); static void _logos_method$_ungrouped$SBRootFolderView$didAnimate(SBRootFolderView*, SEL); 

#line 10 "Tweak.xm"
__attribute__((visibility("hidden")))

BOOL start = NO;
static void _logos_method$_ungrouped$SBRootFolderView$didAnimate(SBRootFolderView* self, SEL _cmd) {
  _logos_orig$_ungrouped$SBRootFolderView$didAnimate(self, _cmd);
  if(start) {
    return;
  }
  start = YES;
  mains * game = [[mains alloc] init];
  [game run];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBRootFolderView = objc_getClass("SBRootFolderView"); MSHookMessageEx(_logos_class$_ungrouped$SBRootFolderView, @selector(didAnimate), (IMP)&_logos_method$_ungrouped$SBRootFolderView$didAnimate, (IMP*)&_logos_orig$_ungrouped$SBRootFolderView$didAnimate);} }
#line 23 "Tweak.xm"
