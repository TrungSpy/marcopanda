//
//  MapController.m
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import "MapController.h"
@interface MapController ()
{
    GMSMapView *mapView;
}

@end


@implementation MapController
@synthesize cllocationManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    // Do any additional setup after loading the view.
    [self createUserMap];
    
}

//地図関連 start
-(void)createUserMap
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                            longitude:151.2086
                                                                 zoom:18];
    
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    mapView.mapType = kGMSTypeTerrain;
    mapView.settings.myLocationButton = YES;
    mapView.frame=self.view.bounds;
    [self.view addSubview:mapView] ;
    
    self.cllocationManager= [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        self.cllocationManager.delegate = self;
        self.cllocationManager.distanceFilter = kCLDistanceFilterNone;
        self.cllocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 測位開始
        [cllocationManager startUpdatingLocation];
    } else {
        NSLog(@"Location services not available.");
    }
 
}

// 位置情報更新時
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    [mapView animateToLocation : [newLocation coordinate]];
    
    //緯度・経度を出力
    NSLog(@"緯度=%f, 経度=%f",
          [newLocation coordinate].latitude,
          [newLocation coordinate].longitude);
    [self getAddressWithCoordinate:[newLocation coordinate]];
}

//GPS情報更新失敗
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"GPS情報更新失敗");
}

//google APIで座標の地名を取得する
-(void)getAddressWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    GMSGeocoder *geocoder = [GMSGeocoder geocoder];
    [geocoder reverseGeocodeCoordinate:coordinate completionHandler:^(GMSReverseGeocodeResponse * geocodeResponse, NSError * error) {
        
        //現在位置の座標を保存
        [MarcoPandaData sharedDataSource].cur_coordinate = coordinate;
        if([[geocodeResponse results] count]>0)
        {
            GMSAddress * address = [geocodeResponse firstResult];
            NSArray<NSString *> *arr_address=(NSArray *)address.lines;
            
             NSString *tmp_address = @"";
            
            for (NSString *str_address in arr_address) {
                if(![str_address isEqualToString:@""])
                {
                    tmp_address = str_address;
                    break;
                }
            }
            //一番目地名を保存
            [MarcoPandaData sharedDataSource].cur_adress = tmp_address;
        }
        else{
           [MarcoPandaData sharedDataSource].cur_adress = @"";
        }
    }];
}

//図関連 end


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
