//
//  objectFactory.h
//
//  Created by Jonathan Langens on 28/03/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//
//   Returns an array with all the objects for a certain level

#import <Foundation/Foundation.h>
#import "Object.h"

@interface objectFactory : NSObject

+(NSArray*) getObjectsForLevel:(NSString*)level;

@end
