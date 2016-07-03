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
{
    UIButton *btn_map;
    UIButton *btn_article;
    MenuType curType;
}
@property (nonatomic,assign)NSInteger curindex;
@property (nonatomic,assign)id<TabMenuViewDelegate> delegate;

-(void)selectMenuindex:(MenuType)menutype;

@end

@protocol TabMenuViewDelegate <NSObject>
@required
-(void)mapTouch;
-(void)articleTouch;

@end
