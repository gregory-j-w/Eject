//
//  SMKSetupViewController.m
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import "SMKSetupViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface SMKSetupViewController ()
@property (nonatomic, strong) CLLocationManager *man;
@end

@implementation SMKSetupViewController

@synthesize man;

- (void)viewDidLoad {
    [super viewDidLoad];
    man = [[CLLocationManager alloc] init];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [man requestAlwaysAuthorization];
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

- (IBAction)completePressed:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
