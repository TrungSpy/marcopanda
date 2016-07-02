//
//  SideMenu.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "SideMenu.h"
#import "MenuCell.h"
#import "MenuHeader.h"

@implementation SideMenu
@synthesize collect_menus,delegate;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
//        self.backgroundColor=color(0,0,0,0.4);
//        UICollectionViewFlowLayout * flowLayoutmenus = [[UICollectionViewFlowLayout alloc] init];
//        [flowLayoutmenus setScrollDirection:UICollectionViewScrollDirectionVertical];
//        [flowLayoutmenus setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
//        [flowLayoutmenus setMinimumLineSpacing:0];
//        [flowLayoutmenus setMinimumInteritemSpacing:0];
//        
//        if(isPad)
//        {
//            [flowLayoutmenus setItemSize:CGSizeMake(SHAREDATA.devicewidth*0.42f, 80)];
//            [flowLayoutmenus setHeaderReferenceSize:CGSizeMake(SHAREDATA.devicewidth*0.42f, 170)];
//        }
//        else
//        {
//            [flowLayoutmenus setItemSize:CGSizeMake(SHAREDATA.devicewidth*0.80f, 80)];
//            [flowLayoutmenus setHeaderReferenceSize:CGSizeMake(SHAREDATA.devicewidth*0.80f, 170)];
//        }
//        
//        collect_menus=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width*0.85f,frame.size.height) collectionViewLayout:flowLayoutmenus];
//        collect_menus.showsHorizontalScrollIndicator=NO;
//        collect_menus.showsVerticalScrollIndicator=NO;
//        collect_menus.backgroundColor=[UIColor whiteColor];
//        [collect_menus registerClass:[CasioMenuCell class] forCellWithReuseIdentifier:@"CasioMenuCell"];
//        [collect_menus registerClass:[CasioMenuHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CasioMenuHeader"];
//        
//        collect_menus.dataSource=self;
//        collect_menus.delegate=self;
//        [self addSubview:collect_menus];
//        
//        collect_menus.translatesAutoresizingMaskIntoConstraints=NO;
//        if(isPad)
//        {
//            [self addConstraints:@[
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0],
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:SHAREDATA.devicewidth*0.42f],
//                                   ]];
//        }
//        else{
//            [self addConstraints:@[
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0],
//                                   [NSLayoutConstraint constraintWithItem:collect_menus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:SHAREDATA.devicewidth*0.80f],
//                                   ]];
//        }
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                  withReuseIdentifier:@"MenuHeader"
                                                         forIndexPath:indexPath];
        
    }
    return view;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *newCell;
    newCell = [collectionView
               dequeueReusableCellWithReuseIdentifier:@"MenuCell"
               forIndexPath:indexPath];
    MenuCell *menucell=((MenuCell *)newCell);
    switch (indexPath.item) {
        case 0:
            [menucell setMenuInfo:@"評価" withicon:@""];
            break;
        case 1:
            [menucell setMenuInfo:@"コスト" withicon:@""];
            break;
        case 2:
            [menucell setMenuInfo:@"数" withicon:@""];
            break;
        case 3:
            [menucell setMenuInfo:@"性別" withicon:@""];
            break;
        case 4:
            [menucell setMenuInfo:@"時間帯" withicon:@""];
            break;
        case 5:
            [menucell setMenuInfo:@"国" withicon:@""];
            break;
            
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

@end
