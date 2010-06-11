//
//  SizeButton.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/10/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "SizeButton.h"



@class WhiteboardView;

@implementation SizeButton

@synthesize directionOfChange;



- (id)initWithImage:(UIImage *)image withFrame:(CGRect)frame withDirectionOfChange:(NSString *)directionOfChange{
    if ((self = [super initWithImage:image])) {
		self.directionOfChange=directionOfChange;
		self.frame = frame;
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
	[(WhiteboardView *)self.superview changeStrokeWidthWithDirection: directionOfChange];
	[self setNeedsDisplay];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
