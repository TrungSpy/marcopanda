//
//  MenuCell.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor=[UIColor clearColor];
        lb_title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width-32*2, frame.size.height)];
        lb_title.font=W3FONT(15);
        lb_title.textColor=color(0, 0, 0, 0.87 );
        lb_title.textAlignment=NSTextAlignmentLeft;
        [self addSubview:lb_title];
        lb_title.translatesAutoresizingMaskIntoConstraints=NO;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-32],
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
                               [NSLayoutConstraint constraintWithItem:lb_title attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:32]
                               ]];
        UIView *linelayer=[[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
        linelayer.backgroundColor=color(252, 238, 235, 1);
        [self addSubview:linelayer];
    }
    return self;
}

-(void)setMenuInfo:(NSString *)title withicon:(NSString *)icon
{
    lb_title.text=title;
}
@end
