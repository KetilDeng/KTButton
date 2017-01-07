//
//  KTButton.m
//  KTButton
//
//  Created by Ketil on 2017/1/7.
//  Copyright © 2017年 fumi. All rights reserved.
//

#import "KTButton.h"

/** KTButtonTypeForceRightToLeft、 KTButtonTypeForceTopToBottom 类型下title和image的间距 */
#define kTitleImagePadding 5.0
/** KTButtonTypeForceTopRightToBottomLeft、KTButtonTypeForceTopLeftToBottomRight 类型下title和image重合间距 */
#define kBadgePadding 10.0

@interface KTButton ()

@property (nonatomic, strong) UIFont *ktFont;
@property (nonatomic, assign) KTButtonType ktButtonType;

@end

@implementation KTButton

+ (instancetype)buttonWithButtonType:(KTButtonType)buttonType titleFont:(UIFont *)titleFont
{
	KTButton *button = [KTButton buttonWithType:UIButtonTypeCustom];
	button.titleLabel.font = titleFont;
	button.ktFont = titleFont;
	button.ktButtonType = buttonType;
	
	if (buttonType == KTButtonTypeForceTopLeftToBottomRight || buttonType == KTButtonTypeForceTopRightToBottomLeft)
	{
		[button bringSubviewToFront:button.imageView];
	}
	return button;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
	CGRect rect = CGRectZero;
	if (self.ktFont)
	{
		UIImage *image = [self imageForState:UIControlStateNormal];
		NSString *title = [self titleForState:UIControlStateNormal];
		CGSize titleSize = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.ktFont} context:nil].size;
		
		if (image&&title)
		{
			CGFloat imageX = 0;
			CGFloat imageY = 0;
			
			switch (self.ktButtonType) {
				case KTButtonTypeForceRightToLeft:
				{
					CGFloat contenW = image.size.width+titleSize.width+kTitleImagePadding;
					imageX = (contentRect.size.width-contenW)/2.0+titleSize.width+kTitleImagePadding;
					imageY = contentRect.size.height/2.0-image.size.height/2.0;
					break;
				}
				case KTButtonTypeForceTopToBottom:
				{
					CGFloat contenH = image.size.height+titleSize.height+kTitleImagePadding;
					imageX = (contentRect.size.width-image.size.width)/2.0;
					imageY = (contentRect.size.height - contenH)/2.0;
					break;
				}
				case KTButtonTypeForceTopRightToBottomLeft:
				{
					CGFloat contenW = image.size.width+titleSize.width-kBadgePadding;
					imageX = (contentRect.size.width-contenW)/2.0+titleSize.width-kBadgePadding;
					imageY = (contentRect.size.height-titleSize.height)/2.0+kBadgePadding-image.size.height;
					break;
				}
				case KTButtonTypeForceTopLeftToBottomRight:
				{
					CGFloat contenW = image.size.width+titleSize.width-kBadgePadding;
					imageX = (contentRect.size.width-contenW)/2.0;
					imageY = (contentRect.size.height-titleSize.height)/2.0+kBadgePadding-image.size.height;
					break;
				}
				default:
					break;
			}
			
			CGFloat imageW = image.size.width;
			CGFloat imageH = image.size.height;
			rect = CGRectMake(imageX, imageY, imageW, imageH);
		}
	}
	return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
	CGRect rect = CGRectZero;
	if (self.ktFont)
	{
		NSString *title = [self titleForState:UIControlStateNormal];
		UIImage *image = [self imageForState:UIControlStateNormal];
		CGSize titleSize = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.ktFont} context:nil].size;
		
		if (title)
		{
			CGFloat titleX = 0;
			CGFloat titleY = 0;
			CGFloat titleW = titleSize.width;
			
			switch (self.ktButtonType) {
				case KTButtonTypeForceRightToLeft:
				{
					CGFloat contenW = image?(image.size.width+titleSize.width+kTitleImagePadding):titleSize.width;
					titleX = (contentRect.size.width-contenW)/2.0;
					titleY = contentRect.size.height/2.0-titleSize.height/2.0;
					break;
				}
				case KTButtonTypeForceTopToBottom:
				{
					titleX = (contentRect.size.width - titleSize.width)/2.0;
					if (image)
					{
						CGFloat contenH = image.size.height+titleSize.height+kTitleImagePadding;
						titleY = (contentRect.size.height-contenH)/2.0+image.size.height+kTitleImagePadding;
					}
					else
					{
						titleY = contentRect.size.height-25;
					}
					break;
				}
				case KTButtonTypeForceTopRightToBottomLeft:
				{
					CGFloat contenW = image?(image.size.width+titleSize.width-kBadgePadding):titleSize.width;
					titleX = (contentRect.size.width-contenW)/2.0;
					titleY = contentRect.size.height/2.0-titleSize.height/2.0;
					break;
				}
				case KTButtonTypeForceTopLeftToBottomRight:
				{
					CGFloat contenW = image?(image.size.width+titleSize.width-kBadgePadding):titleSize.width;
					titleX = (contentRect.size.width-contenW)/2.0+(image?(image.size.width-kBadgePadding):0);
					titleY = contentRect.size.height/2.0-titleSize.height/2.0;
					break;
				}
				default:
					break;
			}
			
			CGFloat titleH = titleSize.height;
			rect = CGRectMake(titleX, titleY, titleW, titleH);
		}
	}
	return rect;
}

@end
