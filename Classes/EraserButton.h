//
//  Button.h
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/8/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EraserButton : UIImageView {
	bool isErasing;
	

}
- (id)initWithImage:(UIImage *)image withFrame:(CGRect)frame;
@property (nonatomic, assign) bool isErasing;


@end
