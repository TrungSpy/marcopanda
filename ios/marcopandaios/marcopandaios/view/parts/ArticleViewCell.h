//
//  ArticleViewCell.h
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewCell : UICollectionViewCell
{
    UIImageView *img_artice;
    UILabel *lb_tilte;
}

-(void)setUiimageInfo:(NSString *)img_name;

@end
