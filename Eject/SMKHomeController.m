//
//  SMKHomeController.m
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import "SMKHomeController.h"

@interface SMKHomeController ()
@property (nonatomic, assign) BOOL firstTime;
@end

@implementation SMKHomeController

@synthesize firstTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    firstTime = YES;
    // Do any additional setup after loading the view.
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

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (firstTime) {
        firstTime = NO;
        [self showIntro];
    }
}

- (void) showIntro {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome to the Social Ejection Seat" message:@"First, we need to get some info to set this up, otherwise the app won't work properly" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Got It" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [self goToSettings];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)settingsPressed:(id)sender {
    [self goToSettings];
}

- (IBAction)infoPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Help" message:@"The Social Ejection Seat is here to give you a way to escape whatever situation you're in, and fast. Using advanced analytics, our system preemptively readies drivers and dispatches them to your location when we believe you may need it. Simply press the Eject button and a nearby driver will be by before you know it, to get you out of whatever situation." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) goToSettings {
    [self performSegueWithIdentifier:@"SetupSegue" sender:self];
}
@end
