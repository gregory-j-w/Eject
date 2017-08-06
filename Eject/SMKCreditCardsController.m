//
//  SMKCreditCardsController.m
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import "SMKCreditCardsController.h"

@interface SMKCreditCardsController ()

@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation SMKCreditCardsController

@synthesize cards, editButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cards = [NSMutableArray arrayWithArray:@[@"Visa ending 1234", @"American Express ending 4325", @"Discover ending 6323"]];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundView = nil;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CardIOUtilities preloadCardIO];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cards.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < cards.count) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CardCell" forIndexPath:indexPath];
        cell.textLabel.text = [cards objectAtIndex:indexPath.row];
        return cell;
    } else {
        return[tableView dequeueReusableCellWithIdentifier:@"AddCardCell" forIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == cards.count) {
        [self addCard];
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row != cards.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cards removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView setEditing:NO animated:YES];
}

- (IBAction)editPressed:(id)sender {
    [self.tableView setEditing:![self.tableView isEditing] animated:YES];
}

- (void) addCard {
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    [self presentViewController:scanViewController animated:YES completion:nil];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    NSLog(@"User canceled payment info");
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
    int index = (int)info.redactedCardNumber.length - 4;
    [self.cards addObject:[NSString stringWithFormat:@"%@ ending %@", [CardIOCreditCardInfo displayStringForCardType:info.cardType usingLanguageOrLocale:nil], [info.redactedCardNumber substringFromIndex:(index >= 0 ? index : 0)]]];
    [self.tableView reloadData];
}

@end
