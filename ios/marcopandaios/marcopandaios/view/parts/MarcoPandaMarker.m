//
//  MarcoPandaMarker.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "MarcoPandaMarker.h"

@implementation MarcoPandaMarker

-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withCategory:(NSInteger)type withMarkerid:(NSString *)markerid
{
    self = [super initWithFrame:frame];
    if(self)
    {
//        self.backgroundColor=[UIColor redColor];
        cur_hot=0.0;
        cur_markerid = markerid;
        img_fukidashi=[[UIImageView alloc]initWithFrame:CGRectZero];
        [img_fukidashi setImage:[UIImage imageNamed:@"mapMarker"]];
        [self addSubview:img_fukidashi];
        img_fukidashi.translatesAutoresizingMaskIntoConstraints=NO;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:img_fukidashi attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:img_fukidashi attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
                               [NSLayoutConstraint constraintWithItem:img_fukidashi attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:24],
                               [NSLayoutConstraint constraintWithItem:img_fukidashi attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:33.5]
                               ]];
//        img_fukidashi.backgroundColor=[UIColor blackColor];
        
        
        
        view_content=[[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:view_content];
        
        view_content.translatesAutoresizingMaskIntoConstraints=NO;
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:view_content attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:view_content attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
                               [NSLayoutConstraint constraintWithItem:view_content attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:img_fukidashi attribute:NSLayoutAttributeTop multiplier:1 constant:-8],
                               ]];
        
        btn_send=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn_send setImage:[UIImage imageNamed:@"btn_post"] forState:UIControlStateNormal];
        btn_send.backgroundColor=[UIColor clearColor];
        [self addSubview:btn_send];
        btn_send.translatesAutoresizingMaskIntoConstraints=NO;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view_content attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0],
                               [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:btn_send attribute:NSLayoutAttributeHeight multiplier:1 constant:0],
                               [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                               ]];
        
        btn_info=[[MakerInfoButton alloc]initWithFrame:CGRectZero withTitle:title withhosi:3];
        [self addSubview:btn_info];
        btn_info.translatesAutoresizingMaskIntoConstraints=NO;
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:btn_info attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:btn_send attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:btn_info attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view_content attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0],
                               [NSLayoutConstraint constraintWithItem:btn_info attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:btn_info attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                               ]];
        
        
        
    }
    return self;
}

-(void)setIconHotFactor:(CGFloat)hotfactor
{
    
}

@end
