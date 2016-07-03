//
//  SearchView.h
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewDelegate;
@interface SearchView : UIView<UISearchBarDelegate>
{
    UIButton *btn_menu;
    UISearchBar *searchBar;
}

@property (assign,nonatomic)id<SearchViewDelegate>delegate;
@end

@protocol SearchViewDelegate <NSObject>

@required
-(void)sideMenuTouch;
-(void)searchWithAdress:(NSString *)adress;

@end
