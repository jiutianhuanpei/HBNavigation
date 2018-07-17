//
//  UIViewController+Helps.m
//  NaviDemo
//
//  Created by 沈红榜 on 2018/7/17.
//  Copyright © 2018年 沈红榜. All rights reserved.
//

#import "UIViewController+navigationBar.h"
#import <objc/runtime.h>


@implementation UIViewController (navigationBar)


- (BOOL)bHideNavBar {
    
    return false;
}

#pragma mark - 导航栏透明度
- (void)setHb_navigationBarAlpha:(CGFloat)hb_navigationBarAlpha {
    objc_setAssociatedObject(self, @selector(hb_navigationBarAlpha), @(hb_navigationBarAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.navigationController.navigationBar.subviews.firstObject.alpha = hb_navigationBarAlpha;
}

- (CGFloat)hb_navigationBarAlpha {
    
    CGFloat alpha = [objc_getAssociatedObject(self, @selector(hb_navigationBarAlpha)) floatValue];
    
    return alpha;
}

- (BOOL)canPopOnBackItem {
    return true;
}

@end
