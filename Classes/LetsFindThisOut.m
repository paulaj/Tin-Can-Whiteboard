//
//  LetsFindThisOut.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/4/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "LetsFindThisOut.h"
@implementation LetsFindThisOut


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	 if ([touches count] > 0) { 
		 NSLog(@"Touches :%d ",[touches count]);
	 }
	 if ([[event allTouches] count] > 0) {  
		 NSLog(@" All Events :%d",[[event allTouches] count]);
	 }
}	
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	if ([touches count] > 0) { 
		NSLog(@" (moving)Touches : %d",[touches count]);}
	if ([[event allTouches] count] > 0) {  
		NSLog(@"(moving)All Events :%d",[[event allTouches] count]);}
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	if ([touches count] > 0) { 
		NSLog(@" (end)Touches :%d",[touches count]);}
	if ([[event allTouches] count] > 0) {  
		NSLog(@" (end)All Events :%d",[[event allTouches] count]);}
}


















- (void)dealloc {
    [super dealloc];
}


@end
