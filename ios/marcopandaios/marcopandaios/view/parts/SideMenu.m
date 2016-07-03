//
//  SideMenu.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "SideMenu.h"
#import "MenuCell.h"
#import "MenuHeaderCell.h"
static SideMenu *sideMenu;

@implementation SideMenu
@synthesize collect_menus,delegate;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor=color(0,0,0,0.4);
        UICollectionViewFlowLayout * flowLayoutmenus = [[UICollectionViewFlowLayout alloc] init];
        [flowLayoutmenus setScrollDirection:UICollectionViewScrollDirectionVertical];
        [flowLayoutmenus setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [flowLayoutmenus setMinimumLineSpacing:0];
        [flowLayoutmenus setMinimumInteritemSpacing:0];
        
        [flowLayoutmenus setItemSize:CGSizeMake(frame.size.width*0.7, 80)];
        
        collect_menus=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width*0.85f,frame.size.height) collectionViewLayout:flowLayoutmenus];
        collect_menus.showsHorizontalScrollIndicator=NO;
        collect_menus.showsVerticalScrollIndicator=NO;
        collect_menus.backgroundColor=[UIColor whiteColor];
        [collect_menus registerClass:[MenuCell class] forCellWithReuseIdentifier:@"MenuCell"];
        [collect_menus registerClass:[MenuHeaderCell class] forCellWithReuseIdentifier:@"MenuHeaderCell"];
        
        collect_menus.dataSource=self;
        collect_menus.delegate=self;
        [self addSubview:collect_menus];
        
        collect_menus.translatesAutoresizingMaskIntoConstraints=NO;
        
            [self addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0],
                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:frame.size.width*0.7],
                                   ]];
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height=0;
    if(indexPath.item == 0)
    {
        height = 160;
    }
    else{
        height = 50;
    }
    
    return CGSizeMake(self.frame.size.width*0.7, height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *newCell;
    if(indexPath.item!=0)
    {
        newCell = [collectionView
               dequeueReusableCellWithReuseIdentifier:@"MenuCell"
               forIndexPath:indexPath];
    }
    else{
        newCell = [collectionView
                   dequeueReusableCellWithReuseIdentifier:@"MenuHeaderCell"
                   forIndexPath:indexPath];
    }
    
    switch (indexPath.item) {
        case 0:
            //header 関連設定
            break;
        case 1:
        {
            MenuCell *menucell=((MenuCell *)newCell);
            [menucell setMenuInfo:@"評価" withicon:@""];
            break;
        }
        case 2:
            {
            MenuCell *menucell=((MenuCell *)newCell);
            [menucell setMenuInfo:@"コスト" withicon:@""];
            break;
            }
        case 3:
            {
            MenuCell *menucell=((MenuCell *)newCell);
            [menucell setMenuInfo:@"数" withicon:@""];
            break;
            }
        case 4:
            {
            MenuCell *menucell=((MenuCell *)newCell);
            [menucell setMenuInfo:@"性別" withicon:@""];
            break;
            }
        case 5:
        {
            MenuCell *menucell=((MenuCell *)newCell);
            [menucell setMenuInfo:@"時間帯" withicon:@""];
            break;
        }
        case 6:
        {
            MenuCell *menucell=((MenuCell *)newCell);
            [menucell setMenuInfo:@"国" withicon:@""];
            break;
        }
            
        default:
            break;
    }
    return newCell;
}

//選択メニュー
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [delegate menuTouch:indexPath.item];
    
}

+(void)showSidemenu:(id)delegateobj inView:(UIView *)view
{
    if(sideMenu==nil)
    {
        sideMenu=[[SideMenu alloc]initWithFrame:view.bounds];
    }
    
    [sideMenu.collect_menus.layer removeAllAnimations];
    CATransition *transition= [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromLeft;
    [sideMenu.collect_menus.layer addAnimation:transition forKey:nil];
    
    sideMenu.autoresizesSubviews=YES;
    sideMenu.delegate=delegateobj;
    sideMenu.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [view addSubview:sideMenu];
}

+(void)hiddenSidemenu
{
    if(sideMenu)
    {
        [UIView animateWithDuration:0.3 animations:^{
            sideMenu.collect_menus.frame=CGRectMake(-sideMenu.collect_menus.frame.size.width, sideMenu.collect_menus.frame.origin.y, sideMenu.collect_menus.frame.size.width, sideMenu.collect_menus.frame.size.height);
        } completion:^(BOOL finished) {
            sideMenu.delegate=nil;
            [sideMenu removeFromSuperview];
            sideMenu=nil;
        }];
    }
    
}


@end
