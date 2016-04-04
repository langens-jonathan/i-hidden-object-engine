//
//  Object.m
//  hiddenObjectTest
//
//  Created by Jonathan Langens on 28/03/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//

#import "Object.h"

@implementation Object

-(instancetype) initWithName:(NSString*)name
{
    self = [super init];
    self.name = name;
    self.instances = [[NSMutableArray alloc] init];
    self.selInstance = nil;
    self.nameNL = nil;
    self.contentMode = UIViewContentModeRedraw;
    self.opaque = NO;
    return self;
}

-(NSString*)getNameForLocale:(NSString *)locale
{
    if([locale isEqualToString:@"NL"])return self.nameNL;
    
    return self.name;
}

-(NSString*)nameNL
{
    if(!_nameNL)
        return self.name;
    return _nameNL;
}

-(void)setSelectedInstance:(ObjectInstance*)instance
{
    if(![self.instances containsObject:instance])
        return;
    
    self.selInstance = instance;
    
    CGRect rect = CGRectMake(0, 0, instance.rect.size.width, instance.rect.size.height);
    
    self.frame = instance.rect;
    
    UIImageView *backgroundView =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:instance.imageName]];
    
    
    backgroundView.frame = rect;
    [self addSubview:backgroundView];
    
    [self setNeedsDisplay];
}

@end
