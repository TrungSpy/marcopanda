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
@synthesize cur_adress,cur_coordinate;


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
        self.cur_coordinate = kCLLocationCoordinate2DInvalid;// CLLocationCoordinate2DMake(35.634011, 139.716467);
    }
    return self;
}
@end
