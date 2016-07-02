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

@interface MapController : UIViewController<CLLocationManagerDelegate>
{
    
}

//GPS関連モジュール
@property(nonatomic, strong) CLLocationManager *cllocationManager;

@end
