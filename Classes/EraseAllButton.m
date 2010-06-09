//
//  EraseAllButton.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/9/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "EraseAllButton.h"
#import "WhiteboardView.h"

@class WhiteboardView;



@implementation EraseAllButton
//@synthesize eraseAll;
@synthesize eraser;

- (id)init:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		self.backgroundColor =[UIColor whiteColor];
		[self setNeedsDisplay];
        self.eraser=false;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
	if (eraser==true) {
		CGContextSetRGBFillColor(ctx, 1.0, 1, 1, 1);
		CGContextFillRect(ctx, self.bounds);
		
	}
	if (eraser==false) {
		CGContextSetRGBFillColor(ctx, 0, 0, 1, .5);
		CGContextFillRect(ctx, self.bounds);
	}	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches began");
	eraser =true;
	[self setNeedsDisplay];
	
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	eraser =false;
	NSLog(@"End");
	[(WhiteboardView *)self.superview eraseAll];
	[self setNeedsDisplay];
	
	
}


- (void)dealloc {
    [super dealloc];
}


@end
