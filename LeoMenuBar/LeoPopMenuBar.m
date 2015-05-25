//
//  LeoPopMenuBar.m
//  LeoMenuBar
//
//  Created by 张燎原 on 15/5/25.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import "LeoPopMenuBar.h"

@interface LeoPopMenuBar ()
@property (strong, nonatomic) UIView *containerView;
@end
@implementation LeoPopMenuBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)addButtonItemWithArr:(NSArray *)nameArr
{
    if (!nameArr || nameArr.count <= 0) {
        return;
    }
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    _containerView = containerView;
    CGFloat buttonHeight = self.frame.size.height / nameArr.count;
    for (int i = 0; i < nameArr.count; i++) {
        UIButton *popButton = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *name = [nameArr objectAtIndex:i];
        [popButton setTitle:name forState:UIControlStateNormal];
        [popButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [popButton setBackgroundColor:[UIColor blackColor]];
        [popButton addTarget:self action:@selector(didTappedItem:) forControlEvents:UIControlEventTouchUpInside];
        [popButton setFrame:CGRectMake(0, buttonHeight*i, self.frame.size.width, buttonHeight)];
        popButton.tag = i * 10;
        [containerView addSubview:popButton];
    }
    [self addSubview:containerView];
}

- (void)didTappedItem:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if(self.menuBarDelegate)
    {
        [self.menuBarDelegate didTappedButton:button AtTappBarIndex:self.coloumn];
    }
}

- (void)updatePopMenuBarState:(BOOL)isShowed
{
    if (isShowed) {
        if (_containerView) {
            [UIView animateWithDuration:0.3 animations:^{
                [_containerView setFrame:CGRectMake(0, 0, _containerView.frame.size.width, _containerView.frame.size.height)];
            } completion:^(BOOL finished){
                
            }];
        }
    }else{
        if (_containerView) {
            [UIView animateWithDuration:0.3 animations:^{
                [_containerView setFrame:CGRectMake(0, 0 + _containerView.frame.size.height, _containerView.frame.size.width, _containerView.frame.size.height)];
            } completion:^(BOOL finished){
                [self removeFromSuperview];
            }];
        }
    }
}

@end
