//
//  MakerInfoButton.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "MakerInfoButton.h"

@implementation MakerInfoButton

-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withhosi:(NSInteger)count
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor=[UIColor whiteColor];
        lb_Title=[[UILabel alloc]initWithFrame:CGRectZero];
        lb_Title.backgroundColor=[UIColor clearColor];
        lb_Title.font=W6FONT(12);
        lb_Title.lineBreakMode = NSLineBreakByTruncatingTail;
        lb_Title.textColor=[UIColor blackColor];
        [self addSubview:lb_Title];
        lb_Title.translatesAutoresizingMaskIntoConstraints=NO;
        lb_Title.text=title;
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:lb_Title attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:3],
                               [NSLayoutConstraint constraintWithItem:lb_Title attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:0.6 constant:0.0],
                               [NSLayoutConstraint constraintWithItem:lb_Title attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0],
                               ]];
        for (int i = 0; i<5; i++) {
            
            UIImageView *img_hosi=[[UIImageView alloc]initWithFrame:CGRectZero];
            img_hosi.contentMode=UIViewContentModeScaleToFill;
            img_hosi.backgroundColor=[UIColor clearColor];
            img_hosi.tag=1000+i;
            [self addSubview:img_hosi];
            
            img_hosi.translatesAutoresizingMaskIntoConstraints=NO;
            
            [self addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem:img_hosi attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:3+15*i],
                                   
                                   [NSLayoutConstraint constraintWithItem:img_hosi attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0.0],
                                   [NSLayoutConstraint constraintWithItem:img_hosi attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:12],
                                   [NSLayoutConstraint constraintWithItem:img_hosi attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:12],
                                   ]];
            
            if(i<count)
            {
                [img_hosi setImage:[UIImage imageNamed:@"hosi_on"]];
            }
            else
            {
                [img_hosi setImage:[UIImage imageNamed:@"hosi_off"]]; 
            }
            
            if(i==4)
            {
                UIImageView *img_rigtht = [[UIImageView alloc]initWithFrame:CGRectZero];
                [img_rigtht setImage:[UIImage imageNamed:@"btn_arrow"]];
                img_rigtht.contentMode=UIViewContentModeScaleToFill;
                [self addSubview:img_rigtht];
                img_rigtht.translatesAutoresizingMaskIntoConstraints=NO;
                
                [self addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:img_rigtht attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:img_hosi attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                                       
                                       [NSLayoutConstraint constraintWithItem:img_rigtht attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:lb_Title attribute:NSLayoutAttributeRight multiplier:1 constant:0.0],
                                       [NSLayoutConstraint constraintWithItem:img_rigtht attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0.0],
                                       [NSLayoutConstraint constraintWithItem:img_rigtht attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0.0],
                                       [NSLayoutConstraint constraintWithItem:img_rigtht attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:20],
                                       
                                       ]];
                [self addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:lb_Title attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                                       [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:img_rigtht attribute:NSLayoutAttributeRight multiplier:1 constant:0.0],
                                       ]];
            }
            
        }
        
    }
    return self;
}



@end
