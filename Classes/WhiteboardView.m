//
//  WhiteboardView.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WhiteboardView.h"


@implementation WhiteboardView
//@synthesize lastLocation;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        lastLocation =CGPointMake(0.0, 0.0);
		location =CGPointMake(0.0, 0.0);
		letsDraw = [[NSMutableArray array] retain];
		letsErase = [[NSMutableArray array] retain];
		myArray = [[NSMutableArray array] retain];
		isErasing=false;
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
		if ([letsDraw count] >0) { //under the condition that there is something in our Array
			CGContextSetRGBStrokeColor(ctx, 0, 0, 1.0, 1);
			CGContextSetLineWidth(ctx, 1);
			for (int c=0; c< [letsDraw count]; c++) {//as long as we don't go past the number of available objects
				NSArray *storedPoints=[ letsDraw objectAtIndex:c];//lets name the array at that index 
				
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
					NSLog(@"I'm about to draw");
					CGContextStrokePath(ctx);			 
				}
			}
		}
		if ([letsErase count] >0) { //under the condition that there is something in our Array
			CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
			CGContextSetLineWidth(ctx, 5);
			for (int c=0; c< [letsErase count]; c++) {//as long as we don't go past the number of available objects
				NSArray *storedEPoints=[ letsErase objectAtIndex:c];//lets name the array at that index 
				
				if ([storedEPoints count] >2) { //if we have at least one full x,y pair
					//store them as a float in a variable so we can use them
					float storedEX=[[storedEPoints objectAtIndex:0] floatValue];
					float storedEY=[[storedEPoints objectAtIndex:1] floatValue];
					CGContextBeginPath(ctx);//Lets start a path
					CGContextMoveToPoint(ctx, storedEX, storedEY);// and start where we first touched
					
					for (int i =2; i < [storedEPoints count]; i+=2) { // as long as there are xy pairs left in our array
						//store them as a float in a variable so we can use them
						storedEX=[[storedEPoints objectAtIndex:i] floatValue];
						storedEY=[[storedEPoints objectAtIndex:i+1] floatValue];
						CGContextAddLineToPoint (ctx, storedEX, storedEY);//lets create a line between them, then move to the end of that line		 
					}
					NSLog(@"I'm about to draw");
					CGContextStrokePath(ctx);			 
				}
			}
		}
	}




//Begins Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (isErasing){
		myArray=letsErase;
	}
	else {
		myArray=letsDraw;
	}
	
	UITouch *touch = [[event allTouches] anyObject];
	//Stores current location of touch in our instance variable lastLocation
	lastLocation = [touch locationInView:self];
	//Creates an Array and adds it into our initial Array letsDraw
	[myArray addObject:[[NSMutableArray alloc] initWithCapacity:4]]; 
	NSLog(@"%@", [myArray lastObject]);
	//Adds the CGPoint x,y coordininates into the array (must be done this way because CGPoints are not Objects
	[[myArray lastObject] addObject: [NSNumber numberWithFloat: lastLocation.x]];
	[[myArray lastObject] addObject: [NSNumber numberWithFloat: lastLocation.y]];
	
	NSLog(@"I got a touch");
	NSLog(@"touch pos= %f,%f,", lastLocation.x, lastLocation.y);
	
}
//Tracks moved touches
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
	//Stores every recorded movement CGPoint in the instance variable location
	location = [touch locationInView:self];
	//Adds the x,y coordinates of the CGPoint location
	[[myArray lastObject] addObject: [NSNumber numberWithFloat: location.x]];
	[[myArray lastObject] addObject: [NSNumber numberWithFloat: location.y]];
	[self setNeedsDisplay];//This displays what we've done so far, letting us draw as we go.
	NSLog(@"I'm moving");
	
}
//Ends touches
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
	//Stores touch in location
    location = [touch locationInView:self];
	//adds to array
	[[myArray lastObject] addObject:[NSNumber numberWithFloat: location.x]];
	[[myArray lastObject] addObject:[NSNumber numberWithFloat: location.y]];
	[self setNeedsDisplay];// and displays 
	NSLog(@"I've ended: %@", [myArray lastObject]);
	isErasing= !isErasing;

}




- (void)dealloc {
    [super dealloc];
	[letsDraw release];
	[letsErase release];
	[myArray release];
}


@end
