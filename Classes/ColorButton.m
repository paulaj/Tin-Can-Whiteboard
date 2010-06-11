//
//  ColorButton.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/9/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "ColorButton.h"
#import "WhiteboardView.h"

@class WhiteboardView;

@implementation ColorButton

@synthesize myNewColor;
//@synthesize frame;


- (id)initWithImage:(UIImage *)image withFrame:(CGRect)frame withColor: (UIColor *)color {
    if ((self = [super initWithImage:image])) {
        
		[self setNeedsDisplay];

		self.frame = frame;
		self.myNewColor = color;
		self.userInteractionEnabled=true;
		
    }
	return self;  
}


- (void)drawRect:(CGRect)rect {
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"touches began");
	
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	//NSLog(@"End");
	[(WhiteboardView *)self.superview notErasingAnymore];
	[(WhiteboardView *)self.superview changeColorWithColor:myNewColor];
	[(WhiteboardView *)self.superview changeButtonLocatorLocationWithFrame:self.frame];
	[self setNeedsDisplay];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
