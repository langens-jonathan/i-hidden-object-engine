//
//  Level.m
//  hiddenObjectTest
//
//  Created by Jonathan Langens on 28/03/15.
//  Copyright (c) 2015 Jonathan Langens. All rights reserved.
//

#import "Level.h"
#import "HOLabel.h"

@implementation Level
@synthesize background = _background;

-(UIImageView*) getBackground
{
    if(!self.background)
    {
        self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
        self.background.frame = self.superview.bounds;;
        [self addSubview:self.background];
    }
    return self.background;
}

-(instancetype)initWithObjects:(NSArray *)objects
{
    self = [super init];
    self.objects = [[NSMutableArray alloc] initWithArray:objects];
    [self setup];
    return self;
}

-(void)awakeFromNib
{
    [self setup];
}

-(void)drawRect:(CGRect)rect
{
    [self setBackgroundImage];
}

-(void) setup
{
    self.objects = [[NSMutableArray alloc] initWithArray:[objectFactory getObjectsForLevel:@"test"]];
    [self setBackgroundImage];
    [self createLevel];
    [self selectObjects];
    [self drawObjects];
    [self drawButtons];
}

-(void) setBackgroundImage
{
    [self setBackgroundColor:[UIColor darkGrayColor]];
    [self getBackground].frame = self.superview.bounds;
}

-(void) createLevel
{
   // int counter = 0;
    for(id object in self.objects)
    {
        Object *o = (Object*)object;
        ObjectInstance *instance = nil;
        bool notSelected = true;
        while(notSelected)
        {
            int index = arc4random() % o.instances.count;
            notSelected = false;
            
            instance = [o.instances objectAtIndex:index];
        
            for(Object *o in self.objects)
            {
                if(o.selInstance)
                {
                    if([instance collidesWithRect:o.selInstance.rect])
                    {
                        notSelected = true;
                    }
                }
            }
        }
        
        if(instance)[o setSelectedInstance: instance];
    }
}

-(void) selectObjects
{
    int  countArray[self.objects.count];
    
    for(int i=0;i<self.objects.count;++i)countArray[i] = i;
    
    // randomizing
    for(int i=0;i < self.objects.count * 15; ++i)
    {
        int p1 = arc4random() % self.objects.count;
        int p2 = arc4random() % self.objects.count;
        int tmp = countArray[p1];
        countArray[p1] = countArray[p2];
        countArray[p2] = tmp;
    }
    
    // now selecting the top 5
    
    NSMutableArray *sel = [[NSMutableArray alloc] init];
    [sel addObject:[self.objects objectAtIndex:countArray[0]]];
    [sel addObject:[self.objects objectAtIndex:countArray[1]]];
    [sel addObject:[self.objects objectAtIndex:countArray[2]]];
    [sel addObject:[self.objects objectAtIndex:countArray[3]]];
    [sel addObject:[self.objects objectAtIndex:countArray[4]]];
    [sel addObject:[self.objects objectAtIndex:countArray[5]]];
    
    self.selection = sel;
}

-(void) drawButtons
{
    self.labels = [[NSMutableArray alloc] init];
    for(int i = 0;i < 6; ++i)
    {
        int xp = 100 + (120 * (i));
        int yp = 680;
        
        CGRect nrect = CGRectMake(xp, yp, 100, 50);
       // UILabel *b = [[UILabel alloc] initWithFrame:nrect];
        Object *object =  (Object*)[self.selection objectAtIndex:i];
        HOLabel *b = [[HOLabel alloc] initWithFrame:nrect andObject:object andLocale:@"NL"];
        //[b setText:object.name];
        [b setTextColor:[UIColor blackColor]];
        [self.labels addObject:b];
        [self addSubview:b];
    }
}

-(void) drawObjects
{
    for(id idview in self.objects)
    {
        Object *o = (Object*) idview;
        [self addSubview:o];
    }
}

-(BOOL) removeFromSelection:(Object*)object
{
    for(id l in self.labels)
    {
        if([((HOLabel*)l).trueName isEqualToString:object.name])
        {
            ((HOLabel*)l).text = @"";
            return TRUE;
        }
    }
    return FALSE;
}

-(void) clickedAtPosition:(CGPoint) point
{
    for(id obj in self.objects)
    {
        Object *object = (Object*)obj;
        if([self containsPoint:object.selInstance.rect Point:point])
        {
            // removing the object from the list
            if([self removeFromSelection:object])
            {
                [object removeFromSuperview];
                [self setNeedsDisplay];
                return;
            }
        }
    }
}


-(BOOL) containsPoint:(CGRect) rect Point: (CGPoint) point
{
    return ((rect.origin.x <= point.x) &&
            ((rect.origin.x + rect.size.width) >= point.x) &&
            (rect.origin.y <= point.y) &&
            ((rect.origin.y + rect.size.height) >= point.y));
}

@end
