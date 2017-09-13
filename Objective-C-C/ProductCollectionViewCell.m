//
//  ProductCollectionViewCell.m
//  Objective-C-C
//
//  Created by Brad on 13/09/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

#import "ProductCollectionViewCell.h"

@implementation ProductCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // set up object in the cell

    [self setUpLowerBlockView];
    [self setUpIsFavoriteProductImageView];
    [self setUpProductImageView];

}

- (void) setUpLowerBlockView {

    self.productLowerBlockView.layer.borderWidth = 0.2;
    self.productLowerBlockView.layer.borderColor = [UIColor colorWithRed: 74.0 / 255.0 green: 74.0 / 255.0 blue: 74.0 / 255.0 alpha: 1.0].CGColor;

}

- (void) setUpIsFavoriteProductImageView {
    
    self.isFavoriteProductImageView.tintColor = [UIColor colorWithRed: 165.0 / 255.0 green: 170.0 / 255.0 blue: 178.0 / 255.0 alpha: 1.0];
    self.isFavoriteProductImageView.layer.borderColor = [UIColor colorWithRed: 165.0 / 255.0 green: 170.0 / 255.0 blue: 178.0 / 255.0 alpha: 1.0].CGColor;
    self.isFavoriteProductImageView.layer.borderWidth = 0.2;
    self.isFavoriteProductImageView.layer.cornerRadius = 4;

}

- (void) setUpProductImageView {

    self.productImageView.backgroundColor = [UIColor whiteColor];
    self.productImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.productImageView.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    self.productImageView.layer.shadowOpacity = 0.3;
    self.productImageView.layer.shadowRadius = 1.0;
    
}

@end
