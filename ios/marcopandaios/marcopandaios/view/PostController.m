//
//  PostController.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "PostController.h"


@implementation PostController
@synthesize coordinate,adress,type;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    self.view.backgroundColor=[UIColor whiteColor];
    TitleView  *titleview = [[TitleView alloc]initWithFrame:CGRectZero withTitle:self.type==0?@"追加":@"詳細"];
    titleview.delegate=self;
    [self.view addSubview:titleview];
    titleview.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:titleview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:titleview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                [NSLayoutConstraint constraintWithItem:titleview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:titleview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:64]
                                ]];
    
    sc_contents=[[UIScrollView alloc]initWithFrame:CGRectZero];
    sc_contents.backgroundColor=color(252, 238, 235, 1);
    [self.view addSubview:sc_contents];
    sc_contents.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:sc_contents attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:sc_contents attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                [NSLayoutConstraint constraintWithItem:sc_contents attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:sc_contents attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
                                ]];
    
    
    img_Message=[[UIButton alloc]initWithFrame:CGRectZero];
    img_Message.layer.masksToBounds=YES;
    img_Message.layer.cornerRadius=5;
    img_Message.contentMode = UIViewContentModeScaleAspectFit;
    img_Message.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [img_Message setImage:[UIImage imageNamed:@"tmppic"] forState:UIControlStateNormal];
    [img_Message addTarget:self action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    img_Message.backgroundColor=[UIColor clearColor];
    [sc_contents addSubview:img_Message];
    img_Message.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:img_Message attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:sc_contents attribute:NSLayoutAttributeTop multiplier:1.0 constant:30],
                                [NSLayoutConstraint constraintWithItem:img_Message attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30],
                                [NSLayoutConstraint constraintWithItem:img_Message attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30],
                                [NSLayoutConstraint constraintWithItem:img_Message attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:img_Message attribute:NSLayoutAttributeWidth multiplier:1 constant:0]
                                ]];
    
    tf_name = [[UITextField alloc]initWithFrame:CGRectZero];
    tf_name.placeholder=@"お名前を入力してください";
    tf_name.font=W3FONT(15);
    tf_name.layer.masksToBounds=YES;
    tf_name.layer.cornerRadius=5;
    tf_name.delegate = self;
    [sc_contents addSubview:tf_name];
    tf_name.translatesAutoresizingMaskIntoConstraints=NO;
    tf_name.backgroundColor=[UIColor whiteColor];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:tf_name attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:img_Message attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
                                [NSLayoutConstraint constraintWithItem:tf_name attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30],
                                [NSLayoutConstraint constraintWithItem:tf_name attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30],
                                [NSLayoutConstraint constraintWithItem:tf_name attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:30]
                                ]];

    
    txt_Message=[[UITextView alloc]initWithFrame:CGRectZero];
    txt_Message.text=@"投稿内容を入力してください";
    txt_Message.layer.masksToBounds=YES;
    txt_Message.layer.cornerRadius=5;
    [sc_contents addSubview:txt_Message];
    txt_Message.delegate=self;
    txt_Message.translatesAutoresizingMaskIntoConstraints=NO;
    txt_Message.backgroundColor=[UIColor whiteColor];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:txt_Message attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tf_name attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
                                [NSLayoutConstraint constraintWithItem:txt_Message attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30],
                                [NSLayoutConstraint constraintWithItem:txt_Message attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30],
                                [NSLayoutConstraint constraintWithItem:txt_Message attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:100]
                                ]];
    
    
    arr_Categorys = @[@"温泉",@"レストラン",@"ホテル",@"観光スポット",@"交通",@"ショッピング",@"イベント",@"公共施設",@"アミューズメント",@"病院",@"その他"];
    tf_Category = [[UITextField alloc]initWithFrame:CGRectZero];
    tf_Category.userInteractionEnabled=NO;
    
    cur_category_index =(NSInteger)arc4random()%11+1;
    tf_Category.text=[arr_Categorys objectAtIndex:cur_category_index-1];
    
    tf_Category.font=W3FONT(15);
    tf_Category.layer.masksToBounds=YES;
    tf_Category.layer.cornerRadius=5;
    [sc_contents addSubview:tf_Category];
    tf_Category.translatesAutoresizingMaskIntoConstraints=NO;
    tf_Category.backgroundColor=[UIColor whiteColor];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:tf_Category attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:txt_Message attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
                                [NSLayoutConstraint constraintWithItem:tf_Category attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30],
                                [NSLayoutConstraint constraintWithItem:tf_Category attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30],
                                [NSLayoutConstraint constraintWithItem:tf_Category attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:30]
                                ]];
    
    arr_costs = @[@"¥0",@"¥1〜¥1,000",@"¥1,001〜¥2,000",@"¥2,001〜¥5,000",@"¥5,001〜¥10,000",@"¥10,001〜"];
    tf_cost = [[UITextField alloc]initWithFrame:CGRectZero];
    tf_cost.userInteractionEnabled=NO;
    tf_cost.layer.masksToBounds=YES;
    tf_cost.layer.cornerRadius=5;
    
    cur_cost_index =(NSInteger)arc4random()%6+1;
    tf_cost.text = [arr_costs objectAtIndex:cur_cost_index-1];
    tf_cost.font=W3FONT(15);
    [sc_contents addSubview:tf_cost];
    tf_cost.translatesAutoresizingMaskIntoConstraints=NO;
    tf_cost.backgroundColor=[UIColor whiteColor];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:tf_cost attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tf_Category attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
                                [NSLayoutConstraint constraintWithItem:tf_cost attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30],
                                [NSLayoutConstraint constraintWithItem:tf_cost attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30],
                                [NSLayoutConstraint constraintWithItem:tf_cost attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:30]
                                ]];
    
    arr_sex = @[@"男性",@"女性",@"不明"];
    tf_sex = [[UITextField alloc]initWithFrame:CGRectZero];
    
    cur_sex_index =(NSInteger)arc4random()%3+1;
    tf_sex.text = [arr_sex objectAtIndex:cur_sex_index-1];
    
    tf_sex.font=W3FONT(15);
    tf_sex.userInteractionEnabled=NO;
    tf_sex.layer.masksToBounds=YES;
    tf_sex.layer.cornerRadius=5;
    [sc_contents addSubview:tf_sex];
    tf_sex.translatesAutoresizingMaskIntoConstraints=NO;
    tf_sex.backgroundColor=[UIColor whiteColor];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:tf_sex attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tf_cost attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
                                [NSLayoutConstraint constraintWithItem:tf_sex attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30],
                                [NSLayoutConstraint constraintWithItem:tf_sex attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30],
                                [NSLayoutConstraint constraintWithItem:tf_sex attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:30]
                                ]];

    if(type==0)
    {
    btn_add=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn_add setTitle:@"追加" forState:UIControlStateNormal];
    [btn_add addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
    btn_add.layer.masksToBounds=YES;
    btn_add.layer.cornerRadius=5;
    [sc_contents addSubview:btn_add];
    
    btn_add.backgroundColor=[UIColor blueColor];
    btn_add.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:btn_add attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tf_sex attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
                                [NSLayoutConstraint constraintWithItem:btn_add attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0],
                                [NSLayoutConstraint constraintWithItem:btn_add attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:btn_add attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:50]
                                ]];
    }
    sc_contents.contentSize=CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width-30+40*4+120+240);
    
}

-(void)backto
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [sc_contents setContentOffset:CGPointMake(0, sc_contents.contentSize.height - sc_contents.bounds.size.height) animated:YES];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
     [sc_contents setContentOffset:CGPointMake(0, sc_contents.contentSize.height - sc_contents.bounds.size.height) animated:YES];
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [txt_Message resignFirstResponder];
    [tf_name resignFirstResponder];
}

-(void)takePicture
{
    UIImagePickerController *photoview=[[UIImagePickerController alloc]init];
    photoview.delegate = self;
    photoview.allowsEditing=YES;
    photoview.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:photoview animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker  didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    uploadimage = [info objectForKey:UIImagePickerControllerEditedImage];
    [self dismissViewControllerAnimated:YES completion:^{
        [img_Message setImage:uploadimage forState:UIControlStateNormal];
    }];
    
}

-(void)sendMessage
{
    NSString *userid=[[NSUserDefaults standardUserDefaults]objectForKey:@"user_id"];
    if(uploadimage)
    {
        [AFNetHelper uploadPath:@"/article/fileupload.json" withMethod:AF_IMAGE withParms:nil withFormdata:@{@"image":UIImagePNGRepresentation(uploadimage)} withBlock:^(id result, NSError *error) {
//            NSLog(@"re%@",[result description]);
            if(error == nil)
            {
                NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
                [AFNetHelper requestPath:@"/article/post.json" withMethod:AFPOST withParms:@{@"longitude":@(coordinate.longitude),@"latitude":@(coordinate.latitude),@"location_name":adress,@"user_uuid":userid,@"nickname":tf_name.text,@"category_id":@(cur_category_index),@"cost_id":@(cur_cost_index),@"sex":@(cur_sex_index),@"article_text":txt_Message.text,@"text_language_code":language,@"multimedia_id":@[result[@"files"][0][@"multimedia_id"]]} withBlock:^(id result, NSError *error) {
//                    NSLog(@"re%@",[result description]);
                    [self.navigationController popViewControllerAnimated:YES];
                }];
                
            }
        }];
    }
    else{
        NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
        [AFNetHelper requestPath:@"/article/post.json" withMethod:AFPOST withParms:@{@"longitude":@(coordinate.longitude),@"latitude":@(coordinate.latitude),@"location_name":adress,@"user_uuid":userid,@"nickname":tf_name.text,@"category_id":@(cur_category_index),@"cost_id":@(cur_cost_index),@"sex":@(cur_sex_index),@"article_text":txt_Message.text,@"text_language_code":language} withBlock:^(id resulaat, NSError *error) {
//            NSLog(@"re%@",[result description]);
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
        
    }
    
}
@end
