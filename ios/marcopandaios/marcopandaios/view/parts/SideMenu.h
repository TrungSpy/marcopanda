//
//  SideMenu.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SideMenuDelegate;
@interface SideMenu : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
{
    //カテゴリー
    UICollectionView *collect_menus;
}
@property (assign,nonatomic)id<SideMenuDelegate>delegate;
@property (strong,nonatomic)UICollectionView *collect_menus;

+(void)showSidemenu:(id)delegateobj inView:(UIView *)view;
+(void)hiddenSidemenu;

@end


@protocol SideMenuDelegate <NSObject>

@required
//メニュー選択判断
-(void)menuTouch:(NSInteger)index;

@end
