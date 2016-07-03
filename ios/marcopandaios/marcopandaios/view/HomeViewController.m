//
//  HomeViewController.m
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "HomeViewController.h"
#import "SideMenu.h"
#import "PostListController.h"
#import "MapController.h"

@interface HomeViewController ()<SideMenuDelegate,SearchViewDelegate,TabMenuViewDelegate>
{
    //画面ページビュー
    UIPageViewController *travelPageView;
    NSArray *conentControllers;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setHidden:YES];
    //検索枠
    seachview = [[SearchView alloc]initWithFrame:CGRectZero];
    seachview.delegate=self;
    [self.view addSubview:seachview];
    seachview.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:seachview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:seachview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                [NSLayoutConstraint constraintWithItem:seachview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:seachview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:64]
                                ]];
    
    //タブメニュー
    
    tabmenu = [[TabMenu alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    tabmenu.delegate=self;
    [self.view addSubview:tabmenu];
    tabmenu.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:tabmenu attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:seachview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:tabmenu attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                [NSLayoutConstraint constraintWithItem:tabmenu attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:tabmenu attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:44]
                                ]];
    
    
    
    //初期化マップ
    MapController *mapview=[[MapController alloc]init];
    PostListController *postsview=[[PostListController alloc]init];
    
    conentControllers=[[NSArray alloc]initWithObjects:mapview,postsview, nil];
    
    travelPageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    [self addChildViewController:travelPageView];
    travelPageView.navigationController.navigationBarHidden=YES;
    travelPageView.view.frame=self.view.bounds;
    travelPageView.view.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:travelPageView.view];
    
    travelPageView.view.translatesAutoresizingMaskIntoConstraints=NO;
    
    travelPageView.delegate=self;
    travelPageView.dataSource=self;
    travelPageView.automaticallyAdjustsScrollViewInsets=NO;
    [travelPageView setViewControllers:@[[conentControllers objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
    }];
    
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:travelPageView.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tabmenu attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:travelPageView.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                [NSLayoutConstraint constraintWithItem:travelPageView.view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:travelPageView.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
                                ]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapTouch
{
    [tabmenu selectMenuindex:MapType];
    [travelPageView setViewControllers:@[[conentControllers objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
    }];
}
-(void)articleTouch
{
    [tabmenu selectMenuindex:ArticleType];
    [travelPageView setViewControllers:@[[conentControllers objectAtIndex:1]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
    }];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)complete
{
    if([[pageViewController.viewControllers objectAtIndex:0] isKindOfClass:[MapController class]])
    {
        [tabmenu selectMenuindex:MapType];
    }
    else{
        [tabmenu selectMenuindex:ArticleType];
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

-(void)searchWithAdress:(NSString *)adress
{
    
}

-(void)sideMenuTouch
{
    [SideMenu showSidemenu:self inView:self.view];
}

-(void)menuTouch:(NSInteger)index
{
    [SideMenu hiddenSidemenu];
}


@end
