//
//  ObjectInstance.m
//  hiddenObjectTest
//
//  Created by Jonathan Langens on 28/03/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//

#import "ObjectInstance.h"

@implementation ObjectInstance


-(BOOL) collidesWithRect:(CGRect) otherRect
{
    bool xbounded = false;
    if(self.rect.origin.x > otherRect.origin.x &&
        self.rect.origin.x < (otherRect.origin.x + otherRect.size.width))
    {
        xbounded = true;
    }
        
    if(((self.rect.origin.x + self.rect.size.width) > otherRect.origin.x) &&
        (self.rect.origin.x + self.rect.size.width) < (otherRect.size.width + otherRect.origin.x))
    {
        xbounded = true;
    }
       
    bool ybounded = false;
    if(self.rect.origin.y > otherRect.origin.y &&
           self.rect.origin.y < (otherRect.origin.y + otherRect.size.height))
    {
        ybounded = true;
    }
    if(((self.rect.origin.y + self.rect.size.height) > otherRect.origin.y) &&
           (self.rect.origin.y + self.rect.size.height) < (otherRect.size.height + otherRect.origin.y))
    {
        ybounded = true;
    }
       
       return xbounded && ybounded;
}

-(instancetype) initWithRect:(CGRect) rect andImageName:(NSString*) name
{
    self = [super init];
    self.rect = rect;
    self.imageName = name;
    return self;
}

@end
