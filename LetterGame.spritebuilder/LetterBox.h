//
//  LetterBox.h
//  LetterGame
//
//  Created by Xiaofen Liu on 2/21/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface LetterBox : CCSprite
@property (nonatomic,assign)NSUInteger tag;

-(instancetype)initWithPosition:(CGPoint)position withTag:(NSUInteger)tag;
@end
