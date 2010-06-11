//
//  SizeButton.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/10/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhiteboardView.h"
@class WhiteboardView;

@interface SizeButton : UIImageView {
	NSString *directionOfChange;
	
	
}
- (id)initWithImage:(UIImage *)image withFrame:(CGRect)frame withDirectionOfChange:(NSString *)direction;
@property (nonatomic, retain) NSString *directionOfChange ;


@end
