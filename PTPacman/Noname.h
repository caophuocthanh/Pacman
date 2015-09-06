//
//  Noname.h
//  PTPacman
//
//  Created by Otatime on 9/5/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Noname : UIView{
    float X;
    float Y;

    NSTimer *timer;
    BOOL isRed;
    NSTimer *timer_eat;
    BOOL isEat;
    BOOL isChanged;
}
-(id)init;
-(void)startMove;
-(void)stopMove;

@end
