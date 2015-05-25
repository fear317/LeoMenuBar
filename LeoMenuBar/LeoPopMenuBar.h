//
//  LeoPopMenuBar.h
//  LeoMenuBar
//
//  Created by 张燎原 on 15/5/25.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  LeoMenuBarDelegate <NSObject>

- (void)didTappedButton:(UIButton *)button;
- (void)didTappedButton:(UIButton *)button AtTappBarIndex:(NSInteger)index;
@end

@interface LeoPopMenuBar : UIView
@property (assign) NSInteger coloumn;
@property (weak, nonatomic) id<LeoMenuBarDelegate> menuBarDelegate;

- (void)addButtonItemWithArr:(NSArray *)nameArr;
- (void)updatePopMenuBarState:(BOOL)isShowed;
@end
