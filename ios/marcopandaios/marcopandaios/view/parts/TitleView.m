//
//  TitleView.m
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView
@synthesize delegate;

-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title
{
    self  = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor= color(252, 238, 235, 1);
        btn_back=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn_back setImage:[UIImage imageNamed:@"ic_back_gr"] forState:UIControlStateNormal];
        [btn_back addTarget:self action:@selector(touchback) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_back];
        btn_back.translatesAutoresizingMaskIntoConstraints=NO;
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:btn_back attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5],
                               [NSLayoutConstraint constraintWithItem:btn_back attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:20],
                               [NSLayoutConstraint constraintWithItem:btn_back attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20],
                               [NSLayoutConstraint constraintWithItem:btn_back attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:44],
                               ]];

        
        lb_title=[[UILabel alloc]initWithFrame:CGRectZero];
        lb_title.text=title;
        [self addSubview:lb_title];
        lb_title.font = W6FONT(15);
        lb_title.textAlignment = NSTextAlignmentCenter;
        lb_title.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:btn_back attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20],
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:44],
                               ]];
        
            }
    
    return self;
}

-(void)touchback
{
    [delegate backto];
}

@end
