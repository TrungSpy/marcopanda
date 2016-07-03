//
//  PostController.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"

@interface PostController : UIViewController<UITextViewDelegate,UITextFieldDelegate,TitleViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    //投稿画像
    UIButton *img_Message;
    
    //性別
    UITextField *tf_name;
    
    //投稿文字
    UITextView *txt_Message;
    
    //投稿カテゴリー
    UITextField *tf_Category;
    NSInteger cur_category_index;
    
    //カテゴリー配列
    NSArray *arr_Categorys;
    
    //投稿コスト
    UITextField *tf_cost;
    //コスト配列
    NSArray *arr_costs;
    NSInteger cur_cost_index;
    
    //コンテンツ
    UIScrollView *sc_contents;
    
    //性別
    UITextField *tf_sex;
    //コスト配列
    NSArray *arr_sex;
    NSInteger cur_sex_index;
    
    //追加
    UIButton *btn_add;
    
    //アップデータ
    __block UIImage *uploadimage;
    
}

@property (nonatomic,assign)CLLocationCoordinate2D coordinate;
@property (nonatomic,strong)NSString* adress;
@property (nonatomic,assign)NSUInteger type;

@end
