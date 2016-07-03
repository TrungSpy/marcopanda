//
//  TitleView.h
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TitleViewDelegate;
@interface TitleView : UIView
{
    UILabel *lb_title;
    UIButton *btn_back;
}

@property (assign,nonatomic)id<TitleViewDelegate>delegate;

-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

@end

@protocol TitleViewDelegate <NSObject>

@required
-(void)backto;
@end

