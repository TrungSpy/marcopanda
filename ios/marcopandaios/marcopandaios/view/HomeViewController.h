//
//  HomeViewController.h
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchView.h"
#import "TabMenu.h"

@interface HomeViewController : UIViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    SearchView *seachview;
    TabMenu *tabmenu;
}


@end
