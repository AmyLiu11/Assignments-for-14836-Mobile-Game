//
//  Gameplay.m
//  LetterGame
//
//  Created by Xiaofen Liu on 2/21/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "LetterBox.h"


@interface Gameplay()
@property (nonatomic, strong) NSMutableArray * boxArray;

@end
@implementation Gameplay


- (void)onEnter
{
    [super onEnter];
    
    [self setupLetters];
    
    [self setupLetterBox];
    
//    self.userInteractionEnabled = TRUE;
}

- (void)didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
    self.boxArray = [NSMutableArray array];
}


- (void)setupLetters{
    NSMutableArray * tempArr = [NSMutableArray arrayWithObjects:@"a",@"p",@"p",@"l",@"e",nil];
    
    for (int i = 4 ; i >= 0; i--) {
        NSUInteger index = arc4random() % (i + 1);
        NSString * lette = [tempArr objectAtIndex:index];
        [tempArr exchangeObjectAtIndex:index withObjectAtIndex:i];
        LetterView * letter = [[LetterView alloc] initWithLetter:lette andPosition:ccp(50 + 100 * i, 100)];
        letter.dragDelegate = self;
        [self addChild:letter];
    }
}

- (void)setupLetterBox{
    
    for (int i = 0 ; i < 5 ; i++){
        LetterBox * box = [[LetterBox alloc] initWithPosition:ccp(50 + 100 * i, 200) withTag:1];
        [self addChild:box];
        [self.boxArray addObject:box];
    }
    
}


- (void)letterView:(LetterView *)letterView didDragToPoint:(CGPoint)point{
    LetterBox * targetView = nil;
    
    for (LetterBox* box in self.boxArray) {
        
        if (CGRectContainsPoint(box.boundingBox, point)) {
            targetView = box;
            break;
        }
    }
    
    if (targetView!=nil) {
        [self placeTile:letterView atTarget:targetView];
    }
}


-(void)placeTile:(LetterView*)tileView atTarget:(LetterBox*)targetView
{
//    targetView.isMatched = YES;
//    tileView.isMatched = YES;
    
    tileView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.35
                          delay:0.00
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         tileView.position = targetView.position;
//                         tileView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished){
                         targetView.visible = NO;
                     }];
}

@end
