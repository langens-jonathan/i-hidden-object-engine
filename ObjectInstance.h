//
//  ObjectInstance.h
//
//  Created by Jonathan Langens on 28/03/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//
//   This represents a particular instance of an object. Of all instances
//   only one will be chosen for this level. It knows its image, how big it is and
//   where it needs to be placed.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ObjectInstance : NSObject

@property (nonatomic, nonatomic) CGRect rect;
@property (strong, nonatomic) NSString *imageName;

-(BOOL) collidesWithRect:(CGRect) otherRect;
-(instancetype) initWithRect:(CGRect) rect andImageName:(NSString*) name;

@end
