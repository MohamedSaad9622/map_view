//
//  ViewController.h
//  map_view
//
//  Created by MAC on 31/05/2022.
//

#import <UIKit/UIKit.h>
#import <mapKit/mapKit.h>
#import "my_annotation.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property CLLocationManager *locationManager;


@end

