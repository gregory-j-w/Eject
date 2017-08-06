//
//  SMKGenericCollectionViewCell.h
//  Eject
//
//  Created by Scott Kenealy on 8/5/17.
//  Copyright © 2017 Scott Kenealy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMKGenericCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *checkmark;

- (void) toggleCheckmark;

@end
