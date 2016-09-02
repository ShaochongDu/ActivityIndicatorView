//
//  ViewController.m
//  ActivityIndicatorView
//
//  Created by Shaochong Du on 16/9/2.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "ViewController.h"
#import "MyActiveView.h"
#import "ActiveView1.h"
#import "ActiveView2.h"
#import "ActiveView3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    MyActiveView *activityView = [[MyActiveView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-25, 50, 50, 50)];
    [self.view addSubview:activityView];
    
    ActiveView1 *activityView1 = [[ActiveView1 alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-25, 150, 70, 50)];
    [self.view addSubview:activityView1];
    
    ActiveView2 *activityView2 = [[ActiveView2 alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-25, 250, 70, 50)];
    [self.view addSubview:activityView2];
    
    ActiveView3 *activityView3 = [[ActiveView3 alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-25, 350, 50, 50)];
    [self.view addSubview:activityView3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
