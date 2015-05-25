//
//  LeoMenuBar.h
//  LeoMenuBar
//
//  Created by 张燎原 on 15/5/22.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeoPopMenuBar.h"

@interface LeoMenuBar : UIScrollView

@property (weak, nonatomic) id<LeoMenuBarDelegate> menuBarDelegate;

//- (void)addButtonItemWithArr:(NSArray *)nameArr target:(id<LeoMenuBarDelegate>)delegate;
//- (void)addButtonItemWithDic:(NSDictionary *)nameDic target:(id<LeoMenuBarDelegate>)delegate;
- (void)addControlButtonArr:(NSArray *)controlArr  popButtonArr:(NSArray *)popArr target:(id<LeoMenuBarDelegate>)delegate;

- (void)updateItemTitleColor:(UIColor *)color andMenuBarBackgroundColor:(UIColor *)bgColor;
@end
