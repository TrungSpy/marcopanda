//
//  SearchView.m
//  marcopandaios
//
//  Created by kawa on 2016/07/03.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView
@synthesize delegate;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
         self.backgroundColor= color(252, 238, 235, 1);
        btn_menu = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_menu setImage:[UIImage imageNamed:@"ic_menu_gr"] forState:UIControlStateNormal];
        [btn_menu addTarget:self action:@selector(touchmenu) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_menu];
        btn_menu.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:btn_menu attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5],
                               [NSLayoutConstraint constraintWithItem:btn_menu attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:11],
                               [NSLayoutConstraint constraintWithItem:btn_menu attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:36],
                               [NSLayoutConstraint constraintWithItem:btn_menu attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:36],
                               
                               ]];
        
        searchBar = [[UISearchBar alloc]initWithFrame:CGRectZero];
        searchBar.placeholder=@"place search";
        searchBar.barTintColor = color(252, 238, 235, 1);
        [searchBar setBackgroundImage:[UIImage new]];
        searchBar.delegate=self;
        [self addSubview:searchBar];
        searchBar.translatesAutoresizingMaskIntoConstraints=NO;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:btn_menu attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                               [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:11],
                               [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:36],
                               
                               ]];
        
    }
    
    return self;
}

-(void)touchmenu
{
    [delegate sideMenuTouch];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)csearchBar
{
    [searchBar resignFirstResponder];
    [delegate searchWithAdress:searchBar.text];
}

@end
