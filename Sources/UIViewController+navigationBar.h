//
//  UIViewController+Helps.h
//  NaviDemo
//
//  Created by 沈红榜 on 2018/7/17.
//  Copyright © 2018年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (navigationBar)

/**
 是否隐藏导航栏，默认为 false，不隐藏
 需在所要设置的 ViewController 中重写该方法
 
 @return bool
 */
- (BOOL)bHideNavBar;

/**
 导航栏的透明度
 */
@property (nonatomic, assign) CGFloat hb_navigationBarAlpha;

/**
 是否可以点击左上角的返回按钮 pop 到上一页
 用于 hook 系统按钮

 @return 是否可返回
 */
- (BOOL)canPopOnBackItem;


@end
