//
//  WhiteboardView.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
#import "EraseAllButton.h"
#import "ColorButton.h"

@class EraseAllButton;
@class ColorButton;

@interface WhiteboardView : UIView {
	CGPoint lastLocation;
	CGPoint location;
	NSMutableArray *strokes;
	
	UIColor *myColor;
	CGFloat myDistance;
	NSInteger mySize;
	CFMutableDictionaryRef activeStrokes;
	Button *button;
	EraseAllButton *eraseButton;
	ColorButton *blueButton;
	ColorButton *greenButton;
	ColorButton *orangeButton;
	ColorButton *purpleButton;
	ColorButton *redButton;
	ColorButton *whiteButton;
	ColorButton *yellowButton;
	
}
- (void)eraseAll;
-(void)changeColorWithColor:(UIColor *)color;

@property (nonatomic, retain) NSMutableArray *strokes;
@property (nonatomic, retain) UIColor *myColor;


@end
