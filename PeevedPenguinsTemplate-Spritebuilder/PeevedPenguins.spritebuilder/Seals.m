//
//  Seals.m
//  PeevedPenguins
//
//  Created by Xiaofen Liu on 1/27/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Seals.h"

@implementation Seals

- (id)init{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)didLoadFromCCB {
    self.physicsBody.collisionType = @"seal";
}

@end
