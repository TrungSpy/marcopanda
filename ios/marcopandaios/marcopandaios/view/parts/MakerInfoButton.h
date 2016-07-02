//
//  MakerInfoButton.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakerInfoButton : UIButton
{
    UILabel *lb_Title;
}

-(id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withhosi:(NSInteger)count;

@end
