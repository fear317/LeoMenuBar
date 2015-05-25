//
//  LeoMenuBar.m
//  LeoMenuBar
//
//  Created by 张燎原 on 15/5/22.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import "LeoMenuBar.h"

@interface LeoMenuBar ()
{
    CGFloat _itemWidth;
    CGFloat _itemHight;
}
@property (strong, nonatomic) NSArray *controlButtonArr;
@property (strong, nonatomic) NSDictionary *popMenuBarDic;
@property (weak, nonatomic) LeoPopMenuBar *focusView;
@end

@implementation LeoMenuBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _itemWidth = 0;
        _itemHight = frame.size.height;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)addControlButtonArr:(NSArray *)controlArr  popButtonArr:(NSArray *)popArr target:(id<LeoMenuBarDelegate>)delegate
{
    if (!controlArr || controlArr.count <= 0) {
        return;
    }
    
    CGFloat itemWidth = self.frame.size.width / controlArr.count;
    _itemWidth = itemWidth;
    NSMutableArray *controlButtonArr = [[NSMutableArray alloc] initWithCapacity:controlArr.count];
    NSMutableDictionary *popBarDic = [[NSMutableDictionary alloc] initWithCapacity:controlArr.count];
    
    for (int i = 0; i < controlArr.count; i++) {
        NSString *controlName = [controlArr objectAtIndex:i];
        UIButton *controlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        controlButton.tag = i;
        [controlButton setFrame:CGRectMake(itemWidth*i, 0, itemWidth, self.frame.size.height)];
        [controlButton addTarget:self action:@selector(didTappedItem:) forControlEvents:UIControlEventTouchUpInside];
        [controlButton setTitle:controlName forState:UIControlStateNormal];
        [controlButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [controlButton setBackgroundColor:[UIColor blackColor]];
        [self addSubview:controlButton];
        [controlButtonArr addObject:controlButton];
        
        
        if (popArr.count > i) {
            NSArray *popNameArr = [popArr objectAtIndex:i];
            if (popNameArr.count > 0) {
                LeoPopMenuBar *popBar = [[LeoPopMenuBar alloc] initWithFrame:CGRectMake(_itemWidth * i, self.frame.origin.y - _itemHight * popNameArr.count, _itemWidth, _itemHight * popNameArr.count)];
                popBar.coloumn = i;
                [popBar addButtonItemWithArr:popNameArr];
                [popBar setClipsToBounds:YES];
                popBar.menuBarDelegate = delegate;
                [popBarDic setObject:popBar forKey:controlName];                
            }
        }
    }
    if (controlButtonArr.count > 0) {
        _controlButtonArr = controlButtonArr;
    }
    if (popBarDic.count > 0) {
        _popMenuBarDic = popBarDic;
    }
    
    _menuBarDelegate = delegate;
}

- (void)didTappedItem:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (self.menuBarDelegate) {
        [self.menuBarDelegate didTappedButton:button AtTappBarIndex:button.tag];
    }
    if (!_focusView || _focusView.coloumn != button.tag) {
        NSString *name = button.titleLabel.text;
        LeoPopMenuBar *popBar = [_popMenuBarDic objectForKey:name];
        if (popBar && self.superview) {
            LeoPopMenuBar *lastPopBar = _focusView;
            _focusView = popBar;
            [self.superview addSubview:popBar];
            [popBar updatePopMenuBarState:YES];
            if (lastPopBar != _focusView) {
                [lastPopBar updatePopMenuBarState:NO];
            }
        }else if(!popBar &&_focusView && _focusView.coloumn != button.tag) {
            LeoPopMenuBar *popBar = _focusView;
            _focusView = nil;
            if (popBar && self.superview) {
                [popBar updatePopMenuBarState:NO];
            }            
        }
    }else if(_focusView && _focusView.coloumn == button.tag) {
        LeoPopMenuBar *popBar = _focusView;
        _focusView = nil;
        if (popBar && self.superview) {
            [popBar updatePopMenuBarState:NO];
        }
    }
}

- (void)updateItemTitleColor:(UIColor *)color andMenuBarBackgroundColor:(UIColor *)bgColor
{
    if(color)
    {
        for (UIButton *button in _controlButtonArr) {
            [button setTitleColor:color forState:UIControlStateNormal];
        }
    }
    
    if (bgColor) {
        [self setBackgroundColor:bgColor];
    }
}

//- (void)setMenuBarDelegate:(id<LeoMenuBarDelegate>)menuBarDelegate
//{
//    if (!_menuBarDelegate || _menuBarDelegate != menuBarDelegate) {
//        _menuBarDelegate = menuBarDelegate;
//        for (NSString *key in [_popMenuBarDic allKeys]) {
//            LeoPopMenuBar *popMenuBar = [_popMenuBarDic objectForKey:key];
//            [popMenuBar setMenuBarDelegate:menuBarDelegate];
//        }
//    }
//}
@end
