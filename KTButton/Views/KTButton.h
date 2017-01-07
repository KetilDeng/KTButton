//
//  KTButton.h
//  KTButton
//
//  Created by Ketil on 2017/1/7.
//  Copyright © 2017年 fumi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KTButtonType) {
	KTButtonTypeForceRightToLeft = 0,
	KTButtonTypeForceTopToBottom,
	KTButtonTypeForceTopRightToBottomLeft,
	KTButtonTypeForceTopLeftToBottomRight
};

@interface KTButton : UIButton

+ (instancetype)buttonWithButtonType:(KTButtonType)buttonType titleFont:(UIFont *)titleFont;

@end
