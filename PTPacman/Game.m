//
//  main.m
//  PTPacman
//
//  Created by Otatime on 9/5/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import "Game.h"
#import "Pacman.h"
#import "Noname.h"
@implementation Game
Pacman * pacman1;
Pacman * pacman2;
Noname * noname;
-(void)run {
    NSLog(@"Run game.");
    Pacman * pacman1 = [[Pacman alloc]init];
    [pacman1 startMove];
    Pacman * pacman2 = [[Pacman alloc]init];
    [pacman2 startMove];
    Noname * noname = [[Noname alloc]init];
    [noname startMove];
}

-(void)stop {
  [pacman1 stopMove];
  [pacman2 stopMove];
  [noname stopMove];
}

@end

