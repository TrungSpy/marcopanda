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
@synthesize cllocationManager,googlemapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
//    cur_Coordinate=kCLLocationCoordinate2DInvalid;
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    // Do any additional setup after loading the view.
    
    //地図初期化
    [self createUserMap];
    
    //投稿初期化
    btn_send = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_send setImage:[UIImage imageNamed:@"btn_send"] forState:UIControlStateNormal];
    [btn_send addTarget:self action:@selector(sendArticle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_send];
    btn_send.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10],
                                [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0],
                                [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:80],
                                [NSLayoutConstraint constraintWithItem:btn_send attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:80]
                                ]];
    
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
    [self.view addSubview:googlemapView] ;
    googlemapView.translatesAutoresizingMaskIntoConstraints =NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:googlemapView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:googlemapView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                                [NSLayoutConstraint constraintWithItem:googlemapView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:googlemapView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
                                ]];
    
    
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
    
    if(googlemapView.myLocationEnabled)
    {
        //緯度・経度を出力
            NSLog(@"緯度=%f, 経度=%f",
                  [newLocation coordinate].latitude,
                  [newLocation coordinate].longitude);
        [googlemapView animateToLocation : [newLocation coordinate]];
        [self getAddressWithCoordinate:[newLocation coordinate] withblock:nil];
    }
    else{
    

//        googlemapView.myLocation
    [self getAddressWithCoordinate:[newLocation coordinate] withblock:nil];
    }
    
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
    //カスタマイズGMSMarkerを追加
    [self getAddressWithCoordinate:coordinate withblock:^(NSString *address) {
        [MarcoPandaData sharedDataSource].touch_coordinate=coordinate;
        [MarcoPandaData sharedDataSource].touch_adress=address;
        
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
        
        //投稿ロジック
        [self postArticle:[MarcoPandaData sharedDataSource].touch_coordinate withAdress:[MarcoPandaData sharedDataSource].touch_adress];
    }];
}

//タップしたら、中心が更新しない
- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture
{
    if(gesture)
    {
        mapView.myLocationEnabled=NO;
    }
}

//投稿
-(void)sendArticle
{
    //myLocationEnabled設定
    googlemapView.myLocationEnabled=YES;
    
    //現在位置に遷移、情報を取得
    [googlemapView animateToLocation:[MarcoPandaData sharedDataSource].cur_coordinate];
    
    //投稿ロジック
    [self postArticle:[MarcoPandaData sharedDataSource].cur_coordinate withAdress:[MarcoPandaData sharedDataSource].cur_adress];
    
}

-(void)postArticle:(CLLocationCoordinate2D)coordinate withAdress:(NSString *)adress
{
    NSLog(@"投稿！");
    PostController *postview = [[PostController alloc]init];
    [self.navigationController pushViewController:postview animated:YES];
}

- (BOOL)didTapMyLocationButtonForMapView:(GMSMapView *)mapView
{
    
    //myLocationEnabled設定
    mapView.myLocationEnabled=YES;
    //現在位置に遷移
    [mapView animateToLocation:[MarcoPandaData sharedDataSource].cur_coordinate];
    
    return NO;
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    
}

- (void)mapViewDidFinishTileRendering:(GMSMapView *)mapView
{
    CGPoint point = mapView.center;
    center_Coordinate = [mapView.projection coordinateForPoint:point];
    [self getAddressWithCoordinate:center_Coordinate withblock:^(NSString *address) {
        center_adress=address;
        NSLog(@"%@",center_adress);
    }];
}

//地図関連 end


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
