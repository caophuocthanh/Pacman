//
//  main.m
//  PTPacman
//
//  Created by Otatime on 9/5/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import "mains.h"
#import "Pacman.h"
#import "Noname.h"
@implementation mains
-(void) run {
    NSLog(@"Run game.");
    Pacman * pacman1 = [[Pacman alloc]init];
    [pacman1 startMove];
    Pacman * pacman2 = [[Pacman alloc]init];
    [pacman2 startMove];
    Noname * noname = [[Noname alloc]init];
    [noname startMove];
}
@end

