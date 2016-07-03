//
//  ViewController.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"


@interface ViewController ()
{
    
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    HomeViewController *homeview=[[HomeViewController alloc]init];
    
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeview];
    homeNav.navigationBarHidden=YES;
    homeNav.interactivePopGestureRecognizer.delegate=self;
    [self addChildViewController:homeNav];
    [self.view addSubview:homeNav.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
