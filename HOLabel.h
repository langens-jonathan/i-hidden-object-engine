//
//  HOLabel.h
//
//  Created by Jonathan Langens on 02/04/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"

@interface HOLabel : UILabel

@property (strong, nonatomic) NSString *locale;
@property (strong, nonatomic) Object *object;
@property (strong, nonatomic) NSString *trueName;

-(instancetype)initWithFrame:(CGRect)frame andObject:(Object*) object andLocale:(NSString*) locale;
-(instancetype)initWithFrame:(CGRect)frame andObject:(Object*) object;


@end
