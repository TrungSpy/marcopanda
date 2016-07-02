//
//  MenuCell.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UICollectionViewCell
{
    //アイコン
    UIImageView *img_icon;
    //タイトル
    UILabel *lb_title;
}

-(void)setMenuInfo:(NSString *)title withicon:(NSString *)icon;
@end
