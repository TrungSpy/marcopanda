//
//  MenuHeader.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "MenuHeaderCell.h"

@implementation MenuHeaderCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor=[UIColor yellowColor];
        img_icon=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        img_icon.autoresizesSubviews=YES;
        img_icon.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        img_icon.center=self.center;
        [img_icon setImage:[UIImage imageNamed:@"btn_send"]];
//        img_icon.backgroundColor=[UIColor redColor];
        [self addSubview:img_icon];
//        img_icon.translatesAutoresizingMaskIntoConstraints=NO;
        
//        [self addConstraints:@[
//                               [NSLayoutConstraint constraintWithItem:img_icon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
//                               [NSLayoutConstraint constraintWithItem:img_icon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
//                               [NSLayoutConstraint constraintWithItem:img_icon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:60],
//                               [NSLayoutConstraint constraintWithItem:img_icon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:60],
//                               
//                               ]];
        UIView *linelayer=[[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
        linelayer.backgroundColor=color(252, 238, 235, 1);
        [self addSubview:linelayer];
        
    }
    
    return self;
}

@end
