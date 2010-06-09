//
//  EraseAllButton.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/9/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhiteboardView.h"



@interface EraseAllButton : UIImageView {
	bool eraser;
}
- (id)initWithImage:(UIImage *)image withFrame:(CGRect)frame;
@property (nonatomic, assign) bool eraser;

@end
