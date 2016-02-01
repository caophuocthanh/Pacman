//
//  Noname.m
//  PTPacman
//
//  Created by Otatime on 9/5/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import "Noname.h"

@implementation Noname

-(id) init {
    if (self = [super init]) {
        self.frame = CGRectMake(40, 65, 64, 64);
        self.backgroundColor = [self createBacgroundView:@"/USB/unnamed.png"];
        self.clipsToBounds = YES;
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 25;
        self.layer.shadowOffset = CGSizeMake(3, 3);
        self.userInteractionEnabled = YES;
        UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
        self.layer.zPosition = 100;
        [mainWindow addSubview:self];
        [self randomSpaceMove];
    }
    return self;
}

-(void)startMove {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(move) userInfo:nil repeats:YES];
    timer_eat = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(eat) userInfo:nil repeats:YES];
}


-(void)eat {
    if(isEat) {
        self.backgroundColor = [self createBacgroundView:@"/USB/unnameds.png"];
        isEat = NO;
    } else {
        if (isChanged) {
            self.backgroundColor = [self createBacgroundView:@"/USB/unnamed.png"];
        } else {
            self.backgroundColor = [self createBacgroundView:@"/USB/unnamed1.png"];
        }
        isEat = YES;
    }
}

-(void)stopMove {
    [timer invalidate];
}

-(UIColor*)createBacgroundView:(NSString*)imageName {
    UIImage *image = [UIImage imageWithContentsOfFile:imageName];
    UIColor *background = [[UIColor alloc] initWithPatternImage:image];
    return background;
}

-(void)randomSpaceMove {
    X = arc4random()%11;
    X = X - 5;
    if(X == 0) {
        X = 1;
    }
    
    Y = arc4random() % 11;
    Y = Y - 5;
    if(Y == 0) {
        Y = 1;
    }
}

-(void)move {
    [UIView animateWithDuration:0.5 animations:^{
        self.center =CGPointMake(self.center.x + X,self.center.y + Y);
    }];
    if(self.center.x < 30) {
        X = 0 - X;
        isChanged = YES;
        self.backgroundColor = [self createBacgroundView:@"/USB/unnamed.png"];
    }
    if(self.center.x > ([[UIScreen mainScreen] bounds].size.width - 30)) {
        X = 0 - X;
        isChanged = NO;
        self.backgroundColor = [self createBacgroundView:@"/USB/unnamed1.png"];
    }
    
    if(self.center.y < 30) {
        Y = 0 - Y;
    }
    if(self.center.y > ([[UIScreen mainScreen] bounds].size.height + 45)) {
        Y = 0 - Y;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesMoved");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesEnded");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesCancelled");
}


@end
