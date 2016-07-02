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
    
}

@end


@implementation MapController
@synthesize cllocationManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    cur_Coordinate=kCLLocationCoordinate2DInvalid;
    // Do any additional setup after loading the view.
    [self createUserMap];
    
}

//地図関連 start
-(void)createUserMap
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                            longitude:151.2086
                                                                 zoom:18];
    
    googlemapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    googlemapView.myLocationEnabled = YES;
    googlemapView.mapType = kGMSTypeTerrain;
    googlemapView.settings.myLocationButton = YES;
    googlemapView.delegate = self;
    googlemapView.frame=self.view.bounds;
    [self.view addSubview:googlemapView] ;
    
    self.cllocationManager = [[CLLocationManager alloc] init];
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
    
    if(!CLLocationCoordinate2DIsValid(cur_Coordinate))
    {
        [googlemapView animateToLocation : [newLocation coordinate]];
    }
    
    //緯度・経度を出力
    NSLog(@"緯度=%f, 経度=%f",
          [newLocation coordinate].latitude,
          [newLocation coordinate].longitude);
    cur_Coordinate =  [newLocation coordinate];
    [self getAddressWithCoordinate:[newLocation coordinate] withblock:nil];
}

//GPS情報更新失敗
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"GPS情報更新失敗");
}

//google APIで座標の地名を取得する
-(void)getAddressWithCoordinate:(CLLocationCoordinate2D)coordinate withblock:(void (^)(NSString* address))block
{
    GMSGeocoder *geocoder = [GMSGeocoder geocoder];
    [geocoder reverseGeocodeCoordinate:coordinate completionHandler:^(GMSReverseGeocodeResponse * geocodeResponse, NSError * error) {
        
        //現在位置の座標を保存
        if(!block)
        {
            [MarcoPandaData sharedDataSource].cur_coordinate = coordinate;
        }
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
            if(block)
            {
                block(tmp_address);
            }
            else
            {
                [MarcoPandaData sharedDataSource].cur_adress = tmp_address;
            }
        }
        else{
            
            if(block)
            {
                block(@"");
            }
            else
            {
                [MarcoPandaData sharedDataSource].cur_adress = @"";
            }
        }
    }];
}

//ロングプレス時、マップの座標を取得
-(void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate
{
//    //カスタマイズGMSMarkerを追加
//    [self getAddressWithCoordinate:coordinate withblock:^(NSString *address) {
//        [MarcoPandaData sharedDataSource].touch_coordinate=coordinate;
//        [MarcoPandaData sharedDataSource].touch_adress=address;
//        
//        GMSMarker * gmsmarker = [[GMSMarker alloc]init];
//        gmsmarker.position=[MarcoPandaData sharedDataSource].touch_coordinate;
//        MarcoPandaMarker *iconmarker=[[MarcoPandaMarker alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*3/4, 90) withTitle:[MarcoPandaData sharedDataSource].touch_adress withCategory:1 withMarkerid:@"1111"];
//        
//        [iconmarker setIconHotFactor:CIcolor(255, 0, 0, 1.0) withCategory:1];
//        
//        
//        gmsmarker.iconView = iconmarker;
//        gmsmarker.appearAnimation = kGMSMarkerAnimationPop;
//        gmsmarker.map = mapView;
//        
//        
//    }];
    //TODO 編集画面
}

- (BOOL)didTapMyLocationButtonForMapView:(GMSMapView *)mapView
{
    [mapView animateToLocation : cur_Coordinate];
    return NO;
}

- (void)mapViewDidFinishTileRendering:(GMSMapView *)mapView
{
    CGPoint point = mapView.center;
    center_Coordinate = [mapView.projection coordinateForPoint:point];
}

//地図関連 end


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
