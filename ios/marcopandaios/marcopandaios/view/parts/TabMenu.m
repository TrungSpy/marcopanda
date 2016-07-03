//
//  TabMenu.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "TabMenu.h"

@implementation TabMenu
@synthesize delegate,curindex;

-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = color(252, 238, 235, 1);
        btn_map=[UIButton buttonWithType:UIButtonTypeCustom];
        btn_map.frame=CGRectMake(0, 0, self.bounds.size.width/2, 42);
        btn_map.autoresizesSubviews=YES;
        btn_map.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth;
        [btn_map setTitleColor:color(0, 0, 0, 0.87) forState:UIControlStateSelected];
        [btn_map setTitleColor:color(0, 0, 0, 0.54) forState:UIControlStateNormal];
        [btn_map setTitle:@"地図" forState:UIControlStateNormal];
        [btn_map addTarget:self action:@selector(touchMap) forControlEvents:UIControlEventTouchUpInside];
        btn_map.backgroundColor=[UIColor clearColor];
        [self addSubview:btn_map];
        
        
        btn_article=[UIButton buttonWithType:UIButtonTypeCustom];
        btn_article.frame=CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, 42);
        btn_article.autoresizesSubviews=YES;
        btn_article.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth;
        [btn_article setTitleColor:color(0, 0, 0, 0.87) forState:UIControlStateSelected];
        [btn_article setTitleColor:color(0, 0, 0, 0.54) forState:UIControlStateNormal];
        [btn_article setTitle:@"記事" forState:UIControlStateNormal];
        btn_article.backgroundColor=[UIColor clearColor];
        [btn_article addTarget:self action:@selector(touchArticle) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_article];
        
        btn_map.selected=YES;
        curindex=0;
        
    }
    
    return self;
}

-(void)touchMap
{
    [self selectMenuindex:MapType];
    [delegate mapTouch];
    curindex=0;
}

-(void)touchArticle
{
    [self selectMenuindex:ArticleType];
    [delegate articleTouch];
    curindex=1;
}

-(void)selectMenuindex:(MenuType)menutype
{
    if(menutype==curType)
    {
        return;
    }
    curType=menutype;
    if(menutype==ArticleType)
    {
        curindex=1;
        btn_map.selected=NO;
        btn_article.selected=YES;
    }
    else{
        curindex=0;
        btn_map.selected=YES;
        btn_article.selected=NO;
    }
}


@end
