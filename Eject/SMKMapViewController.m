//
//  SMKMapViewController.m
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import "SMKMapViewController.h"

@interface SMKMapViewController ()
@property (nonatomic, strong) MKPointAnnotation *driver;
@end

@implementation SMKMapViewController

@synthesize mapView, driver;

- (void)viewDidLoad {
    [super viewDidLoad];
    mapView.delegate = self;
    [mapView setShowsUserLocation:YES];
    [mapView setShowsTraffic:YES];
    // Do any additional setup after loading the view.
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(41.2437, -96.0148);
    [mapView setCamera:[MKMapCamera cameraLookingAtCenterCoordinate:coord fromEyeCoordinate:coord eyeAltitude:3000]];
    [self addDriver];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)addDriver {
    if (!driver) {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:CLLocationCoordinate2DMake(41.2437, -96.0148)];
        [annotation setTitle:@"Ejector is En Route"]; //You can set the subtitle too
        [self.mapView addAnnotation:annotation];
        driver = annotation;
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if (annotation == driver) {
        MKAnnotationView *view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"driver"];
        [view setImage:[UIImage imageNamed:@"car"]];
        [view setCanShowCallout:YES];
        return view;
    } else {
        MKAnnotationView *view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"me"];
        [view setImage:[UIImage imageNamed:@"warning"]];
        [view setCanShowCallout:YES];
        return view;
    }
}

- (IBAction)cancelPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure?" message:@"Do you want to call off the car? You will still be charged the original fare, minus a $25 partial refund" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"NO - I still want a car" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"YES - Call off the car" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){[self dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
