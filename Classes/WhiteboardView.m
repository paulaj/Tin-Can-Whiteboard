//
//  WhiteboardView.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//strokes

#import "WhiteboardView.h"
#import <math.h>

@implementation WhiteboardView
//@synthesize lastLocation;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        lastLocation =CGPointMake(0.0, 0.0);
		location =CGPointMake(0.0, 0.0);
		strokes = [[NSMutableArray array] retain];
		isErasing=true;
		myColor= [UIColor blueColor];
		myDistance=0.0;
		
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	//if we have a context
	if(ctx != nil) {
        
		CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
		CGContextFillRect(ctx, CGRectMake(0, 0, 768, 1024));
		
		}
		if ([strokes count] >0) { //under the condition that there is something in our Array
			
			for (int c=0; c< [strokes count]; c++) {//as long as we don't go past the number of available objects
				NSArray *storedInfo=[strokes objectAtIndex:c];//lets name the array at that index 
				NSArray *storedPoints=[storedInfo objectAtIndex:1];
				if ([[storedInfo objectAtIndex:0] isEqual:[UIColor blueColor]]) {
					CGContextSetRGBStrokeColor(ctx, 0, 0, 1.0, 1);
					CGContextSetLineWidth(ctx, 1);
				}
				if ([[storedInfo objectAtIndex:0]isEqual:[UIColor blackColor]]) {
					CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
					CGContextSetLineWidth(ctx, 20);
				}
				if ([storedPoints count] >2) { //if we have at least one full x,y pair
					//store them as a float in a variable so we can use them
					float storedX=[[storedPoints objectAtIndex:0] floatValue];
					float storedY=[[storedPoints objectAtIndex:1] floatValue];
					CGContextBeginPath(ctx);//Lets start a path
					CGContextMoveToPoint(ctx, storedX, storedY);// and start where we first touched
					
					for (int i =2; i < [storedPoints count]; i+=2) { // as long as there are xy pairs left in our array
						//store them as a float in a variable so we can use them
						storedX=[[storedPoints objectAtIndex:i] floatValue];
						storedY=[[storedPoints objectAtIndex:i+1] floatValue];
						CGContextAddLineToPoint (ctx, storedX, storedY);//lets create a line between them, then move to the end of that line		 
					}
					CGContextStrokePath(ctx);			 
				}
			}
		}
	}




//Begins Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	//Stores current location of touch in our instance variable lastLocation
	
	//if ([touches count] > 0) {
//        for (UITouch *touch in touches) {
//            CGPoint *point = (CGPoint *)CFDictionaryGetValue(touchBeginPoints, touch);
//            if (point == NULL) {
//                point = (CGPoint *)malloc(sizeof(CGPoint));
//                CFDictionarySetValue(touchBeginPoints, touch, point);
//            }
//            lastlocation = [touch locationInView:view.superview];
//        }	
	
	lastLocation = [touch locationInView:self];
	
	
	
	if ([[event allTouches] count]==2){
		CGPoint point1=[[[[event allTouches] allObjects] objectAtIndex:0] locationInView:self];
		CGPoint point2=[[[[event allTouches] allObjects] objectAtIndex:1] locationInView:self];
		myDistance = sqrt(pow(((point2.x) - (point1.x)), 2) + pow(((point2.y) - (point1.y)), 2));
		if (myDistance<=200){				
			isErasing=true;
			lastLocation= CGPointMake((((point2.x) + (point1.x))/2.0), (((point2.y) + (point1.y))/2.0));
		}
		else{
			isErasing=false;
		}
	}
	else{
		isErasing=false;
	}
	if (isErasing){
		myColor=[UIColor blackColor];
		
	}
	else {
		myColor=[UIColor blueColor];
	}
	
	//Creates an Array and adds it into our initial Array, then adds a color to it
	[strokes addObject:[[NSMutableArray alloc] initWithCapacity:4]];
	[[strokes lastObject] addObject: myColor];
	[[strokes lastObject] addObject: [NSMutableArray array]];
	//stores x,y coordinates 
	[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: lastLocation.x]];
	[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: lastLocation.y]];
	
//	NSLog(@"I got a touch");
//	NSLog(@"touch pos= %f,%f,", lastLocation.x, lastLocation.y);
	
}
//Tracks moved touches
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
	//Stores every recorded movement CGPoint in the instance variable location
	location = [touch locationInView:self];
	if (isErasing){	
		CGPoint point1=[[[[event allTouches] allObjects] objectAtIndex:0] locationInView:self];
		CGPoint point2=[[[[event allTouches] allObjects] objectAtIndex:1] locationInView:self];
		location= CGPointMake((((point2.x) + (point1.x))/2.0), (((point2.y) + (point1.y))/2.0));
	}
	//Adds the x,y coordinates of the CGPoint location
	[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.x]];
	[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.y]];
	[self setNeedsDisplay];//This displays what we've done so far, letting us draw as we go.
	NSLog(@"I'm moving");
	
}
//Ends touches
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
	//Stores touch in location
    location = [touch locationInView:self];
	//adds to array
	[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.x]];
	[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.y]];
	[self setNeedsDisplay];// and displays 
	//isErasing= !isErasing;

}




- (void)dealloc {
    [super dealloc];
	[strokes release];
}


@end
