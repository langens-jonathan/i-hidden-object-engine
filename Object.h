//
//  Object.h
//
//  Created by Jonathan Langens on 28/03/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//
//  Object represents an object
//   it contains instances of the object and has support for more than one language.
//   TODO: I should still refactor the locale thing, for now it is only support
//   through hardcoded strings (it should be done with an array) and it only supports
//   dutch as a second locale, this should be more..
//

#import <UIKit/UIKit.h>
#import "ObjectInstance.h"

@interface Object : UIView

@property (strong, nonatomic) NSMutableArray* instances;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* nameNL;
@property (strong, nonatomic) ObjectInstance* selInstance;

-(instancetype) initWithName:(NSString*) name;
-(void)setSelectedInstance:(ObjectInstance*)instance;
-(NSString*)getNameForLocale:(NSString*)locale;

@end
