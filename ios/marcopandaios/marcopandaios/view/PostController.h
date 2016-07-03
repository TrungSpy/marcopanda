//
//  PostController.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"

@interface PostController : UIViewController<UITextViewDelegate,UITextFieldDelegate,TitleViewDelegate>
{
    //投稿画像
    UIButton *img_Message;
    
    //性別
    UITextField *tf_name;
    
    //投稿文字
    UITextView *txt_Message;
    
    //投稿カテゴリー
    UITextField *tf_Category;
    
    //カテゴリー配列
    NSArray *arr_Categorys;
    
    //投稿コスト
    UITextField *tf_cost;
    //コスト配列
    NSArray *arr_costs;
    
    //コンテンツ
    UIScrollView *sc_contents;
    
    //性別
    UITextField *tf_sex;
    //コスト配列
    NSArray *arr_sex;
    
    //追加
    UIButton *btn_add;
    
}

@property (nonatomic,assign)CLLocationCoordinate2D coordinate;
@property (nonatomic,strong)NSString* adress;
@property (nonatomic,assign)NSUInteger type;

@end
