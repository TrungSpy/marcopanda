//
//  PostListController.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "PostListController.h"
#import "ArticleViewCell.h"

@interface PostListController ()

@end

@implementation PostListController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=color(252, 238, 235, 1);
    
    UICollectionViewFlowLayout * flowLayoutone_artice = [[UICollectionViewFlowLayout alloc] init];
    [flowLayoutone_artice setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayoutone_artice setItemSize:CGSizeMake(self.view.bounds.size.width/2-2, self.view.bounds.size.width/2-2)];
    [flowLayoutone_artice setSectionInset:UIEdgeInsetsMake(1, 1, 1, 1)];
    [flowLayoutone_artice setMinimumLineSpacing:1];
    [flowLayoutone_artice setMinimumInteritemSpacing:0];
    
    
    collect_Article=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:flowLayoutone_artice];
    collect_Article.backgroundColor=[UIColor clearColor];
    [collect_Article registerClass:[ArticleViewCell class] forCellWithReuseIdentifier:@"ArticleViewCell"];
    
    
    collect_Article.dataSource=self;
    collect_Article.delegate=self;
    [self.view addSubview:collect_Article];
    
    collect_Article.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:collect_Article attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:collect_Article attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:collect_Article attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:collect_Article attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                                ]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return [arr_artices count];
    return 20;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UICollectionViewCell *newCell;
        newCell = [collectionView
                   dequeueReusableCellWithReuseIdentifier:@"ArticleViewCell"
                   forIndexPath:indexPath];
    switch (indexPath.item%6) {
        case 0:
            [((ArticleViewCell *)newCell)setUiimageInfo:@"post01"];
            break;
        case 1:
            [((ArticleViewCell *)newCell)setUiimageInfo:@"post02"];
            break;
        case 2:
            [((ArticleViewCell *)newCell)setUiimageInfo:@"post03"];
            break;
        case 3:
            [((ArticleViewCell *)newCell)setUiimageInfo:@"post04"];
            break;
        case 4:
            [((ArticleViewCell *)newCell)setUiimageInfo:@"post05"];
            break;
        case 5:
            [((ArticleViewCell *)newCell)setUiimageInfo:@"post06"];
            break;
            
        default:
            break;
    }
   
    
    return newCell;
    
}


@end
