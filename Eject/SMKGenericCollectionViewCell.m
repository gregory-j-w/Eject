//
//  SMKGenericCollectionViewCell.m
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import "SMKGenericCollectionViewCell.h"

@implementation SMKGenericCollectionViewCell

@synthesize checkmark;

- (void)awakeFromNib {
    [super awakeFromNib];
    self.checkmark.hidden = YES;
}

- (void)toggleCheckmark {
    self.checkmark.hidden = !self.checkmark.hidden;
}

@end
