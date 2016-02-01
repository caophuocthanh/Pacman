//
//  Pacman.m
//  PTPacman
//
//  Created by Otatime on 9/5/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import "Pacman.h"

@implementation Pacman

-(id)init {
    if (self=[super init]) {
        self.frame=CGRectMake(140, 265, 60, 64);
        self.backgroundColor = [self createBacgroundView:@"/USB/Pacman.png"];
        self.clipsToBounds=YES;
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 25;
        self.layer.shadowOffset = CGSizeMake(3, 3);
        self.userInteractionEnabled = YES;
        self.layer.zPosition = 100;
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handleSingleTap:)];
        singleFingerTap.delegate=self;
        [self addGestureRecognizer:singleFingerTap];
        
        UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
        [mainWindow addSubview:self];
        [self randomSpaceMove];
    }
    return self;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"handleSingleTap: %f:%f",location.x,location.y);
}


-(void)startMove {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(move) userInfo:nil repeats:YES];
}


-(void)stopMove {
    [timer invalidate];
}

-(UIColor*)createBacgroundView:(NSString*)imageName {
    UIImage *image = [UIImage imageWithContentsOfFile:imageName];
    UIColor *background = [[UIColor alloc] initWithPatternImage:image];
    return background;
}
-(id)createView {
    UIView* _view = [[UIView alloc] initWithFrame:CGRectMake(140, 365, 60, 67)];
    _view.clipsToBounds=YES;
    _view.layer.masksToBounds = NO;
    _view.layer.cornerRadius = 25;
    _view.layer.shadowOffset = CGSizeMake(3, 3);
    return _view;
    
}
-(void)randomSpaceMove {
    X = arc4random() % 11;
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
    [UIView animateWithDuration:0.3 animations:^{
        self.center = CGPointMake(self.center.x + X,self.center.y + Y);
    }];
    if(self.center.x <30 ) {
        X = 0 - X;
    }
    if(self.center.x > ([[UIScreen mainScreen] bounds].size.width - 30)) {
        X = 0 - X;
    }
    
    if(self.center.y < 30) {
        Y = 0 - Y;
    }
    if(self.center.y > [[UIScreen mainScreen] bounds].size.height + 45) {
        Y = 0 - Y;
        if(isRed){
            self.backgroundColor = [self createBacgroundView:@"/USB/Pacmany.png"];
            isRed = NO;
        } else {
            self.backgroundColor = [self createBacgroundView:@"/USB/Pacman.png"];
            isRed = YES;
        }
    }
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentTouch = [touch locationInView:(UIView*)self];
    self.center = currentTouch;
    NSLog(@"ABC:touchesMoved");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //UITouch *touch =  [touches anyObject];
    //CGPoint currentTouch = [touch locationInView:(UIView*)self];
    NSLog(@"ABC:touchesBegan");
}

@end
