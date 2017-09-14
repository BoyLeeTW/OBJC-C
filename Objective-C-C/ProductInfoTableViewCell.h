//
//  ProductInfoTableViewCell.h
//  
//
//  Created by Ｍason Chang on 2017/9/14.
//
//

#import <UIKit/UIKit.h>

@interface ProductInfoTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *productNameLabel;

@property (nonatomic, strong) UILabel *productPriceLabel;

@property (nonatomic, strong) UIImageView *productImageView;

@property (nonatomic, strong) UIButton *addToCartButton;

@property (nonatomic, strong) UIView *commentLineBlackView;

@property (nonatomic, strong) UIView *commentLineWhiteView;

@property (nonatomic, strong) UILabel *commentLineLabel;


@end
