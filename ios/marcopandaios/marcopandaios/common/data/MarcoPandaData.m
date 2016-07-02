//
//  MarcoPandaData.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//


#import "MarcoPandaData.h"

static MarcoPandaData *datas;

@implementation MarcoPandaData
@synthesize cur_adress,cur_coordinate,touch_adress,touch_coordinate,ciimage;


//共有データモジュールを初期化
+(MarcoPandaData *)sharedDataSource
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        datas = [[MarcoPandaData alloc] init];
    });
    return datas;
}

//初期化
-(id)init
{
    self = [super init];
    if(self)
    {
        self.cur_adress=@"";
        self.cur_coordinate = kCLLocationCoordinate2DInvalid;
        self.touch_adress=@"";
        self.touch_coordinate = kCLLocationCoordinate2DInvalid;
        self.ciimage=[[CIImage alloc]initWithCGImage:[UIImage imageNamed:@"mapMarker"].CGImage];
    }
    return self;
}
@end
