//
//  MarcoPandaData.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MarcoPandaData : NSObject
{
    
}

//現在位置
@property (nonatomic,strong)NSString *cur_adress;

//現在経緯度
@property (nonatomic,assign)CLLocationCoordinate2D cur_coordinate;

//現在位置
@property (nonatomic,strong)NSString *touch_adress;

//現在経緯度
@property (nonatomic,assign)CLLocationCoordinate2D touch_coordinate;

//構成用Image
@property (nonatomic,strong)CIImage* ciimage;

//共有データモジュールを初期化
+(MarcoPandaData *)sharedDataSource;
@end
