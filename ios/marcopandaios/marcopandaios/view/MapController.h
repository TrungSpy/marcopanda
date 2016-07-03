//
//  MapController.h
//  marcopandaios
//
//  Created by kawa on 2016/07/02.
//  Copyright © 2016年 magicfor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GMSGeocoder.h>
#import "MarcoPandaMarker.h"
#import "PostController.h"

@interface MapController : UIViewController<CLLocationManagerDelegate,GMSMapViewDelegate>
{
    GMSMapView *googlemapView;
//    CLLocationCoordinate2D cur_Coordinate;
    CLLocationCoordinate2D center_Coordinate;
    __block NSString *center_adress;
    
    UIButton *btn_send;
}

//GPS関連モジュール
@property(nonatomic, strong) CLLocationManager *cllocationManager;

//google　地図
@property(nonatomic, strong) GMSMapView *googlemapView;

@end
