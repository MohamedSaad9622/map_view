//
//  ViewController.m
//  map_view
//
//  Created by MAC on 31/05/2022.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *my_map_view;
- (IBAction)tap_action:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.my_map_view setDelegate:self];
    self.my_map_view.showsUserLocation = YES;
    _locationManager = [CLLocationManager new];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager setDistanceFilter:kCLHeadingFilterNone];
    _locationManager.delegate = self;
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];

    
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    printf("WillChangeAnimated\n");
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    printf("DidChangeAnimated\n");
}


- (IBAction)tap_action:(id)sender {
    [_locationManager stopUpdatingLocation];
    [_my_map_view removeAnnotations:_my_map_view.annotations];
    CGPoint touched_point = [sender locationInView:self.my_map_view];
    CLLocationCoordinate2D touched_location = [_my_map_view convertPoint:touched_point toCoordinateFromView:_my_map_view];
    my_annotation *myAnnotation = [my_annotation new];
    myAnnotation.coordinate = touched_location;
    myAnnotation.title = @"location Title";
    [_my_map_view addAnnotation:myAnnotation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    my_annotation *myAnnotation = [my_annotation new];
    myAnnotation.coordinate = manager.location.coordinate;
    [_my_map_view setCenterCoordinate:_my_map_view.userLocation.coordinate animated:YES];
    myAnnotation.title = @"my current location";
    [_my_map_view addAnnotation:myAnnotation];
}



@end
