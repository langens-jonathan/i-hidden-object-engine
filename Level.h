//
//  Level.h
//
//  Created by Jonathan Langens on 28/03/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//
//   Represents a level full of clickable objects that are bound to a label. When the object
//   is clicked the label dissappears.
//
//   TODO: Make this actually modular...
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "objectFactory.h"

@interface Level : UIView

@property (nonatomic, strong) NSMutableArray *objects;
@property (nonatomic, strong) NSArray *selection;
@property (nonatomic, strong) NSMutableArray *labels;
@property (strong, nonatomic) UIImageView* background;

-(instancetype) initWithObjects:(NSArray*) objects;
-(void) clickedAtPosition:(CGPoint) point;

@end
