//
//  ViewController.m
//  KTButton
//
//  Created by Ketil on 2017/1/7.
//  Copyright © 2017年 fumi. All rights reserved.
//

#import "ViewController.h"

#import "KTButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	KTButton *forceRightToLeftButton = [KTButton buttonWithButtonType:KTButtonTypeForceRightToLeft titleFont:[UIFont systemFontOfSize:16.0]];
	forceRightToLeftButton.frame = CGRectMake(0, 0, 120, 50);
	forceRightToLeftButton.center = CGPointMake(self.view.center.x, self.view.center.y-200);
	[forceRightToLeftButton setTitle:@"图片在右" forState:UIControlStateNormal];
	[forceRightToLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	forceRightToLeftButton.backgroundColor = [UIColor grayColor];
	[forceRightToLeftButton setImage:[UIImage imageNamed:@"kt_smile"] forState:UIControlStateNormal];
	[self.view addSubview:forceRightToLeftButton];
		
	KTButton *forceTopRightToBottomLeftButton = [KTButton buttonWithButtonType:KTButtonTypeForceTopRightToBottomLeft titleFont:[UIFont systemFontOfSize:16.0]];
	forceTopRightToBottomLeftButton.frame = CGRectMake(forceRightToLeftButton.frame.origin.x, CGRectGetMaxY(forceRightToLeftButton.frame)+20, forceRightToLeftButton.frame.size.width, forceRightToLeftButton.frame.size.height);
	[forceTopRightToBottomLeftButton setTitle:@"图片在右上角" forState:UIControlStateNormal];
	[forceTopRightToBottomLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	forceTopRightToBottomLeftButton.backgroundColor = [UIColor grayColor];
	[forceTopRightToBottomLeftButton setImage:[UIImage imageNamed:@"kt_smile"] forState:UIControlStateNormal];
	[self.view addSubview:forceTopRightToBottomLeftButton];
	
	KTButton *forceTopLeftToBottomRightButton = [KTButton buttonWithButtonType:KTButtonTypeForceTopLeftToBottomRight titleFont:[UIFont systemFontOfSize:16.0]];
	forceTopLeftToBottomRightButton.frame = CGRectMake(forceTopRightToBottomLeftButton.frame.origin.x, CGRectGetMaxY(forceTopRightToBottomLeftButton.frame)+20, forceTopRightToBottomLeftButton.frame.size.width, forceTopRightToBottomLeftButton.frame.size.height);
	[forceTopLeftToBottomRightButton setTitle:@"图片在左上角" forState:UIControlStateNormal];
	[forceTopLeftToBottomRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	forceTopLeftToBottomRightButton.backgroundColor = [UIColor grayColor];
	[forceTopLeftToBottomRightButton setImage:[UIImage imageNamed:@"kt_smile"] forState:UIControlStateNormal];
	[self.view addSubview:forceTopLeftToBottomRightButton];

	KTButton *forceTopToBottomButton = [KTButton buttonWithButtonType:KTButtonTypeForceTopToBottom titleFont:[UIFont systemFontOfSize:16.0]];
	forceTopToBottomButton.frame = CGRectMake(forceTopLeftToBottomRightButton.frame.origin.x, CGRectGetMaxY(forceTopLeftToBottomRightButton.frame)+20, 80, 80);
	[forceTopToBottomButton setTitle:@"图片在上" forState:UIControlStateNormal];
	[forceTopToBottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	forceTopToBottomButton.backgroundColor = [UIColor grayColor];
	[forceTopToBottomButton setImage:[UIImage imageNamed:@"kt_alipay"] forState:UIControlStateNormal];
	[self.view addSubview:forceTopToBottomButton];

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
