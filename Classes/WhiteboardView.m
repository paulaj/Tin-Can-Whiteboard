//
//  WhiteboardView.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WhiteboardView.h"
#import <math.h>
#import "Button.h"
#import "EraseAllButton.h"

@implementation WhiteboardView

@synthesize strokes;
@synthesize myColor;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        lastLocation =CGPointMake(0.0, 0.0);
		location =CGPointMake(0.0, 0.0);
		strokes = [[NSMutableArray array] retain];
		
		myColor= [UIColor blueColor];
		myDistance=0.0;
		mySize=0;
		activeStrokes =CFDictionaryCreateMutable(NULL,0,NULL,NULL);
		
		blueButton=[[[ColorButton alloc] initWithImage:[UIImage imageNamed:@"bullet_blue.png"] withFrame: CGRectMake(100, 50, 50, 50) withColor:[UIColor blueColor]] retain];
		greenButton=[[[ColorButton alloc] initWithImage:[UIImage imageNamed:@"bullet_green.png"] withFrame: CGRectMake(200, 50, 50, 50) withColor:[UIColor greenColor]] retain];
		orangeButton=[[[ColorButton alloc] initWithImage:[UIImage imageNamed:@"bullet_orange.png"] withFrame: CGRectMake(300, 50, 50, 50) withColor:[UIColor orangeColor]] retain];
		purpleButton=[[[ColorButton alloc] initWithImage:[UIImage imageNamed:@"bullet_purple.png"] withFrame: CGRectMake(400, 50, 50, 50) withColor:[UIColor purpleColor]] retain];
		redButton=[[[ColorButton alloc] initWithImage:[UIImage imageNamed:@"bullet_red.png"] withFrame: CGRectMake(500, 50, 50, 50) withColor:[UIColor redColor]] retain];
		whiteButton=[[[ColorButton alloc] initWithImage:[UIImage imageNamed:@"bullet_white.png"] withFrame: CGRectMake(600, 50, 50, 50) withColor:[UIColor whiteColor]] retain];
		yellowButton=[[[ColorButton alloc] initWithImage:[UIImage imageNamed:@"bullet_yellow.png"] withFrame: CGRectMake(0, 50, 50, 50) withColor:[UIColor yellowColor]] retain];
		

		button=[[[Button alloc] initWithImage:[UIImage imageNamed:@"page_white_paint.png"] withFrame: CGRectMake(725, 60, 30, 30)] retain];
		eraseButton=[[[EraseAllButton alloc] initWithImage:[UIImage imageNamed:@"arrow_refresh.png"] withFrame: CGRectMake(675, 60, 30, 30)] retain];
		
		[self addSubview:button];
		[self addSubview:eraseButton];
		[self addSubview:blueButton];
		[self addSubview:greenButton];
		[self addSubview:orangeButton];
		[self addSubview:purpleButton];
		[self addSubview:redButton];
		[self addSubview:whiteButton];
		[self addSubview:yellowButton];
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
				NSArray *storedPoints=[storedInfo objectAtIndex:2];
				
				if ([[storedInfo objectAtIndex:0]isEqual:[UIColor blackColor]]) {
					CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
					CGContextSetLineWidth(ctx, [[storedInfo objectAtIndex:1]floatValue] );
				}
				else{
					
					//NSLog(@"Color %@:", myColor);
					UIColor *currentStrokeColor =[storedInfo objectAtIndex:0];
					CGContextSetStrokeColorWithColor(ctx, currentStrokeColor.CGColor);
					//CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
					CGContextSetLineWidth(ctx, [[storedInfo objectAtIndex:1]floatValue]);
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

 
-(NSMutableArray *)makeNewStrokeWithColor:(UIColor *)color withWidth:(NSInteger *)width{
	NSMutableArray *newStroke = [[NSMutableArray alloc] initWithCapacity:3];
	
	[newStroke addObject: color];
	[newStroke addObject: [NSNumber numberWithInteger:width]];
	[newStroke addObject: [NSMutableArray array]];
	return newStroke;
}


-(void)eraseAll{
		[strokes removeAllObjects]; 
		[self setNeedsDisplay];
}
	
-(void)changeColorWithColor:(UIColor *)color{
	myColor = color; 
	NSLog(@" setting color to %@:", myColor);
	[self setNeedsDisplay];
}	
	
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"touches began");
	
	if ([[event allTouches] count] > 0) {
		if (button.isErasing==true ){
				lastLocation=[[[[event allTouches] allObjects] objectAtIndex:0] locationInView:self];
				mySize=20;
				NSMutableArray *newStroke = [self makeNewStrokeWithColor:[UIColor blackColor] withWidth:mySize];
			
				[[newStroke lastObject] addObject:[NSNumber numberWithFloat: lastLocation.x]];
				[[newStroke lastObject] addObject:[NSNumber numberWithFloat: lastLocation.y]];
				[strokes addObject: newStroke];
		}
		else{
			for (UITouch *touch in [event allTouches]) {
				
				mySize=3;
				lastLocation = [touch locationInView:self];
				//Make a new Stroke
				NSMutableArray *newStroke = [self makeNewStrokeWithColor:myColor withWidth:mySize];
		
				[[newStroke lastObject] addObject:[NSNumber numberWithFloat: lastLocation.x]];
				[[newStroke lastObject] addObject:[NSNumber numberWithFloat: lastLocation.y]];

				CFDictionarySetValue(activeStrokes, touch, newStroke);
				[strokes addObject: newStroke];
			}		

		}
	}	

}

	
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	//UITouch *touch = [[event allTouches] anyObject];
	//NSLog(@"Color %@:", myColor);
	
	if (button.isErasing){	
		location=[[[[event allTouches] allObjects] objectAtIndex:0] locationInView:self];
		//CGPoint point2=[[[[event allTouches] allObjects] objectAtIndex:1] locationInView:self];
		[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.x]];
		[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.y]];
	}
	else{
		
		for (int i =0; i < [[event allTouches] count]; i++) {
			
			UITouch *currentTouch = [[[event allTouches] allObjects] objectAtIndex:i];
			location = [currentTouch locationInView:self];
			
			//NSLog(@"index: %d at loc %f,%f with phase: %d", i, location.x, location.y, currentTouch.phase);

			NSMutableArray *stroke= (NSMutableArray *)CFDictionaryGetValue (activeStrokes, currentTouch);
			if (stroke == NULL) {
				//NSLog(@"found new finger, making new stroke");
				NSMutableArray *newStroke = [self makeNewStrokeWithColor:[UIColor blueColor] withWidth:3];
				[[newStroke lastObject] addObject:[NSNumber numberWithFloat: location.x]];
				[[newStroke lastObject] addObject:[NSNumber numberWithFloat: location.y]];
				
				CFDictionarySetValue(activeStrokes, currentTouch, newStroke);
				[strokes addObject: newStroke];
			}
			else if (![[event allTouches] containsObject:currentTouch]) {
				CFDictionaryRemoveValue (activeStrokes, currentTouch);
			}
			else{
				NSUInteger index= [strokes indexOfObject:stroke]; 
				//NSLog(@"existing stroke index: %d", index);
				[[stroke lastObject] addObject:[NSNumber numberWithFloat: location.x]];
				[[stroke lastObject] addObject:[NSNumber numberWithFloat: location.y]];	
				[strokes replaceObjectAtIndex:index withObject:stroke];
				CFDictionaryReplaceValue (activeStrokes, currentTouch, stroke); 
			}
		}
	  
	}	
	//NSLog(@"active strokes:%@",activeStrokes);
	[self setNeedsDisplay];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	//UITouch *touch = [[event allTouches] anyObject];
	
	if (button.isErasing==false){
	for (int i =0; i < [[event allTouches] count]; i++) {
		//NSLog(@"End");
		UITouch *currentTouch = [[[event allTouches] allObjects] objectAtIndex:i];
		location = [currentTouch locationInView:self];
		NSMutableArray *stroke= (NSMutableArray *)CFDictionaryGetValue (activeStrokes, currentTouch);
		NSUInteger index= [strokes indexOfObject:stroke]; 
		[[stroke lastObject] addObject:[NSNumber numberWithFloat: location.x]];
		[[stroke lastObject] addObject:[NSNumber numberWithFloat: location.y]];	
		[strokes replaceObjectAtIndex:index withObject:stroke];
		CFDictionaryRemoveValue (activeStrokes, currentTouch);		
	}
	}
	if(button.isErasing){
		location=[[[[event allTouches] allObjects] objectAtIndex:0] locationInView:self];

		[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.x]];
		[[[strokes lastObject] lastObject] addObject:[NSNumber numberWithFloat: location.y]];
	}
	[self setNeedsDisplay]; 
	

}




- (void)dealloc {
    [super dealloc];
	[strokes release];
}


@end
