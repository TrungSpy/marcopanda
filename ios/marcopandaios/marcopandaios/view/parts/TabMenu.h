//
//  TabMenu.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum  MenuType
{
    MapType,
    ArticleType
    
} MenuType;

@protocol TabMenuViewDelegate;
@interface TabMenu : UIView

@end
