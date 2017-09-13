//
//  ProductCollectionViewCell.h
//  Objective-C-C
//
//  Created by Brad on 13/09/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIView *productLowerBlockView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isFavoriteProductImageView;

@end
