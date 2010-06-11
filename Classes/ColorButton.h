//
//  ColorButton.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/9/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WhiteboardView;
@interface ColorButton : UIImageView {
	UIColor *myNewColor;
	//CGRect frame;
	
	
}
- (id)initWithImage:(UIImage *)image withFrame:(CGRect)frame withColor: (UIColor *)color;
@property (nonatomic, retain) UIColor *myNewColor;
//@property(nonatomic) CGRect frame;

@end
