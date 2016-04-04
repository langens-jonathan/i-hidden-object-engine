//
//  HOLabel.m
//  hiddenObjectTest
//
//  Created by Jonathan Langens on 02/04/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//

#import "HOLabel.h"

@implementation HOLabel

-(instancetype)initWithFrame:(CGRect)frame andObject:(Object*) object andLocale:(NSString*) locale
{
    self = [super initWithFrame:frame];
    [self setLocale:locale];
    [self setObject:object];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame andObject:(Object*) object
{
    self = [super initWithFrame:frame];
    [self setLocale:@"EN"];
    [self setObject:object];
    return self;
}

-(void)setObject:(Object *)object
{
    _object = object;
    self.text = [object getNameForLocale:self.locale];
}

-(NSString*)trueName
{
    return self.object.name;
}

@end
