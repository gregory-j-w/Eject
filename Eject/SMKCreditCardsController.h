//
//  SMKCreditCardsController.h
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CardIO.h>

@interface SMKCreditCardsController : UITableViewController <CardIOPaymentViewControllerDelegate>
- (IBAction)editPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end
