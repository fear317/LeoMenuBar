//
//  ViewController.m
//  LeoMenuBar
//
//  Created by 张燎原 on 15/5/22.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LeoMenuBar *menuBar = [[LeoMenuBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 30, self.view.frame.size.width, 30)];
    [menuBar setBackgroundColor:[UIColor yellowColor]];
//    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:[[NSArray alloc] initWithObjects:@"pop1", nil], @"button1",[[NSArray alloc] initWithObjects:@"pop2",nil], @"button2",[[NSArray alloc] initWithObjects:@"pop3",nil], @"button3",[[NSArray alloc] initWithObjects:@"pop4",nil], @"button4",[[NSArray alloc] initWithObjects:@"pop5",nil], @"button5", nil];
    NSArray *controlNameArr = [[NSArray alloc] initWithObjects:@"button1",@"button2",@"button3",@"button4",@"button5", nil];
    NSArray *popNameArr = [[NSArray alloc] initWithObjects:[[NSArray alloc] initWithObjects:@"pop1", @"pop2", @"pop3", @"pop4", nil],
    [[NSArray alloc] initWithObjects:@"pop11", @"pop2", @"pop3", @"pop4", nil],
    [[NSArray alloc] initWithObjects: nil],
    [[NSArray alloc] initWithObjects:@"pop1111", @"pop2", @"pop3", @"pop4", nil],
    [[NSArray alloc] initWithObjects:nil], nil];
    [menuBar addControlButtonArr:controlNameArr popButtonArr:popNameArr target:self];
    [self.view addSubview:menuBar];
    menuBar.menuBarDelegate = self;
    
//    NSLog(@"%s",_cmd);
    [menuBar updateItemTitleColor:[UIColor redColor] andMenuBarBackgroundColor:[UIColor blackColor]];
    
    LeoMenuBar *menuBarWithPopBar = [[LeoMenuBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 30)];
    [menuBarWithPopBar setBackgroundColor:[UIColor blackColor]];
    controlNameArr = [[NSArray alloc] initWithObjects:@"button1",@"button2",@"button3",@"button4",@"button5", nil];
    popNameArr = [[NSArray alloc] initWithObjects:[[NSArray alloc] initWithObjects:@"pop1", @"pop2", @"pop3", @"pop4", nil],
                           [[NSArray alloc] initWithObjects:@"pop11", @"pop2", @"pop3", @"pop4", nil],
                           [[NSArray alloc] initWithObjects: nil],
                           [[NSArray alloc] initWithObjects:@"pop1111", @"pop2", @"pop3", @"pop4", nil],
                           [[NSArray alloc] initWithObjects:nil], nil];
    [menuBarWithPopBar addControlButtonArr:controlNameArr popButtonArr:popNameArr target:self];

    [self.view addSubview:menuBarWithPopBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)didTappedButton:(UIButton *)button
//{
//    NSLog(@"didTappedButtonWithName:%@", button.titleLabel.text);
//}

- (void)didTappedButton:(UIButton *)button AtTappBarIndex:(NSInteger)index
{
    NSLog(@" button with name:%@ for coloumn at %d", button.titleLabel.text, (int)index);
}

@end
