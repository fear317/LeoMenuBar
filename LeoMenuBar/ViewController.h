//
//  ViewController.h
//  LeoMenuBar
//
//  Created by 张燎原 on 15/5/22.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeoMenuBar.h"

@interface ViewController : UIViewController<LeoMenuBarDelegate>
- (void)didTappedButton:(UIButton *)button;
- (void)didTappedButton:(UIButton *)button AtTappBarIndex:(NSInteger)index;

@end

