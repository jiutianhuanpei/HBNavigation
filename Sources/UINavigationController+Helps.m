//
//  UIViewController+navigationBar.m
//  NaviDemo
//
//  Created by 沈红榜 on 2018/7/17.
//  Copyright © 2018年 沈红榜. All rights reserved.
//

#import "UIViewController+navigationBar.h"
#import <objc/runtime.h>
#import "UIViewController+navigationBar.h"

@interface UINavigationController (NaviBar)<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation UINavigationController (Helps)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL oriSel = @selector(viewDidLoad);
        SEL hbSel = @selector(hb_viewDidLoad);
        
        Class class = self.class;
        
        Method oriMethod = class_getInstanceMethod(class, oriSel);
        Method hbMethod = class_getInstanceMethod(class, hbSel);
        
        BOOL ret = class_addMethod(class, oriSel, method_getImplementation(hbMethod), method_getTypeEncoding(hbMethod));
        
        if (ret) {
            class_replaceMethod(class, hbSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        } else {
            method_exchangeImplementations(oriMethod, hbMethod);
        }
    });
}

- (void)hb_viewDidLoad {
    [self hb_viewDidLoad];
    self.delegate = self;
    
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

//防止在 rootVC 里滑动边缘后app卡死
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count > 1) {
        return true;
    }
    return false;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    BOOL hideBar = viewController.bHideNavBar;
    
    [self setNavigationBarHidden:hideBar animated:true];
}

//UINavigationBarDelegate 不可设置delegate 为self， 否则会崩溃
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    UIViewController *topVC = self.topViewController;
    
    if (topVC.canPopOnBackItem) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:true];
        });
        return true;
    }
    return false;
}

@end
