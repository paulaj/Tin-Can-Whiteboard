//
//  WhiteboardView.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EraserButton.h"
#import "EraseAllButton.h"
#import "ColorButton.h"
#import "SizeButton.h"

@class EraseAllButton;
@class ColorButton;
@class SizeButton;

@interface WhiteboardView : UIView {
	CGPoint startOfStroke;
	CGPoint location;
	NSMutableArray *strokes;
	
	UIColor *currentStrokeColor;
	NSInteger currentStrokeWidth;
	CFMutableDictionaryRef activeStrokes;
	
	CGRect frameOfButtonLocator;
	EraserButton *eraserButton;
	EraseAllButton *eraseAllButton;
	ColorButton *blueButton;
	ColorButton *greenButton;
	ColorButton *orangeButton;
	ColorButton *purpleButton;
	ColorButton *redButton;
	ColorButton *whiteButton;
	ColorButton *yellowButton;
	SizeButton *plusButton;
	SizeButton *minusButton;
	
}
- (void)eraseAll;
-(void)changeColorWithColor:(UIColor *)color;
-(void)notErasingAnymore;
-(void)changeStrokeWidthWithDirection:(NSString *) direction;
@property (nonatomic, retain) NSMutableArray *strokes;
@property (nonatomic, retain) UIColor *currentStrokeColor;


@end
