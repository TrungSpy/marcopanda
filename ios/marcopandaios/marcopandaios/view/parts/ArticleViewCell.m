//
//  ArticleViewCell.m
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "ArticleViewCell.h"

@implementation ArticleViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor=[UIColor redColor];
        img_artice=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:img_artice];
        img_artice.translatesAutoresizingMaskIntoConstraints=NO;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:img_artice attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:img_artice attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0],
                               
                               [NSLayoutConstraint constraintWithItem:img_artice attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0],
                               [NSLayoutConstraint constraintWithItem:img_artice attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0],
                               
                               ]];
    }
    
    return self;
}

-(void)setUiimageInfo:(NSString *)img_name
{
    [img_artice setImage:[UIImage imageNamed:img_name]];
}

@end
