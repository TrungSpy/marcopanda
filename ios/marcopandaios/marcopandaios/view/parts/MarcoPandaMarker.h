//
//  MarcoPandaMarker.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MakerInfoButton.h"

@interface MarcoPandaMarker : UIView
{
    
    UIView *view_content;
    UIButton *btn_send;
    MakerInfoButton *btn_info;
    
    UIImageView * img_category;
    UIImageView * img_fukidashi;
    
    CGFloat cur_hot;
    NSString *cur_markerid;
    
    CIImage *cur_markericon;
}



-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withCategory:(NSInteger)type withMarkerid:(NSString *)markerid withhosi:(NSInteger)count;

-(void)setIconHotFactor:(CIColor *)factor_color withCategory:(NSInteger)type;
-(void)setInfoViewHidden:(BOOL)hidden;

@end
