//
//  ViewController.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "ViewController.h"
#import "SideMenu.h"
#import "PostListController.h"
#import "MapController.h"


@interface ViewController ()
{
    //画面ページビュー
    UIPageViewController *travelPageView;
    NSArray *conentControllers;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初期化マップ
    MapController *mapview=[[MapController alloc]init];
    PostListController *postsview=[[PostListController alloc]init];
    
    conentControllers=[[NSArray alloc]initWithObjects:mapview,postsview, nil];
    
    travelPageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    [self addChildViewController:travelPageView];
    travelPageView.navigationController.navigationBarHidden=YES;
    travelPageView.view.frame=self.view.bounds;
    travelPageView.view.backgroundColor=[UIColor clearColor];
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    
    [self.view addSubview:travelPageView.view];
    
    travelPageView.view.translatesAutoresizingMaskIntoConstraints=NO;
    
    travelPageView.delegate=self;
    travelPageView.dataSource=self;
    travelPageView.automaticallyAdjustsScrollViewInsets=NO;
    [travelPageView setViewControllers:@[[conentControllers objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
    }];

}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)complete
{
    if([[pageViewController.viewControllers objectAtIndex:0] isKindOfClass:[MapController class]])
    {
        //        [tabMenuView selectMenuindex:OneVideo];
    }
    else{
        //        [tabMenuView selectMenuindex:TwoVideo];
    }
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if([viewController isKindOfClass:[MapController class]])
    {
        return [conentControllers objectAtIndex:1];
    }else{
        return [conentControllers objectAtIndex:0];
    }
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if([viewController isKindOfClass:[MapController class]])
    {
        return [conentControllers objectAtIndex:1];
    }else{
        return [conentControllers objectAtIndex:0];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
