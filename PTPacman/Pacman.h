//
//  Pacman.h
//  PTPacman
//
//  Created by Otatime on 9/5/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Pacman : UIView<UIGestureRecognizerDelegate>{
    float X;
    float Y;

    NSTimer *timer;
    BOOL isRed;
}
-(id)init;
-(void)startMove;
-(void)stopMove;

@end
