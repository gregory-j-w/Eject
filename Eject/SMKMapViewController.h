//
//  SMKMapViewController.h
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SMKMapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)cancelPressed:(id)sender;

@end
