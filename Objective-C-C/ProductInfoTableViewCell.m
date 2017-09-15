//
//  ProductInfoTableViewCell.m
//  
//
//  Created by Ｍason Chang on 2017/9/14.
//
//

#import "ProductInfoTableViewCell.h"

@implementation ProductInfoTableViewCell

@synthesize productNameLabel = _productNameLabel;

@synthesize productImageView = _productImageView;

@synthesize productPriceLabel = _productPriceLabel;

@synthesize addToCartButton = _addToCartButton;

@synthesize commentLineLabel = _commentLineLabel;

@synthesize commentLineBlackView = _commentLineBlackView;

@synthesize commentLineWhiteView = _commentLineWhiteView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        
        self.productNameLabel = [[UILabel alloc] init];
        self.productImageView = [[UIImageView alloc] init];
        self.productPriceLabel = [[UILabel alloc] init];
        self.addToCartButton = [[UIButton alloc] init];
        self.commentLineLabel = [[UILabel alloc] init];
        self.commentLineWhiteView = [[UIView alloc] init];
        self.commentLineBlackView = [[UIView alloc] init];
        
        [self.contentView addSubview: self.productNameLabel];
        [self.contentView addSubview:self.productPriceLabel];
        [self.contentView addSubview:self.productImageView];
        [self.contentView addSubview:self.addToCartButton];
        
        [self.contentView addSubview:self.commentLineBlackView];
        [self.contentView addSubview:self.commentLineWhiteView];
        [self.contentView addSubview:self.commentLineLabel];
        
    }
    
    
    return self;
    
}

- (void) layoutSubviews {
   [super layoutSubviews];
    
    [self.productImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:self.contentView.bounds.size.width * 20 / 375].active = YES;
    
    [self.productImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:self.contentView.bounds.size.width * 20 / 375].active = YES;
    
    [self.productImageView.widthAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 80 /375].active = YES;
    
    [self.productImageView.heightAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 68 /375].active = YES;
    
    self.productImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.productImageView.backgroundColor = [UIColor whiteColor];
    
    [self.productNameLabel.topAnchor constraintEqualToAnchor:self.productImageView.topAnchor constant:0.0].active = YES;
    
    [self.productNameLabel.leadingAnchor constraintEqualToAnchor:self.productImageView.trailingAnchor constant:self.contentView.bounds.size.width * 10 / 375].active = YES;
    
    [self.productNameLabel.heightAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 16 / 375].active = YES;
    
    [self.productNameLabel.widthAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 245 / 375].active = YES;
    
    self.productNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.addToCartButton.bottomAnchor constraintEqualToAnchor:self.productImageView.bottomAnchor constant:0].active = YES;
    
    [self.addToCartButton.leadingAnchor constraintEqualToAnchor:self.productImageView.trailingAnchor constant: self.contentView.bounds.size.width * 142 / 375].active = YES;
    
    [self.addToCartButton.widthAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 113 / 375].active = YES;
    
    [self.addToCartButton.heightAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 30 / 375].active = YES;
    
    self.addToCartButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.addToCartButton.backgroundColor = [UIColor colorWithRed:4/255.0 green:107/255.0 blue:149/255.0 alpha:1.0];
    
    [self.addToCartButton setTitle:@"Add to Cart" forState:UIControlStateNormal];
    
    [self.addToCartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [self.productPriceLabel.bottomAnchor constraintEqualToAnchor:self.productImageView.bottomAnchor constant:0.0].active = YES;
    
    [self.productPriceLabel.leadingAnchor constraintEqualToAnchor:self.productImageView.trailingAnchor constant:self.contentView.bounds.size.width * 10 / 375].active = YES;
    
    [self.productPriceLabel.trailingAnchor constraintEqualToAnchor:self.addToCartButton.leadingAnchor constant:- self.contentView.bounds.size.width * 30 / 375].active = YES;
    
    
    [self.productPriceLabel.heightAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 15 /375].active = YES;
    
    self.productPriceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.commentLineBlackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-4].active = YES;
    
    [self.commentLineBlackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20].active = YES;
    
    [self.commentLineBlackView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20].active = YES;
    
    [self.commentLineBlackView.heightAnchor constraintEqualToConstant:2.5].active = YES;
    
    self.commentLineBlackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.commentLineBlackView.backgroundColor = [UIColor blackColor];
    
    
    [self.commentLineWhiteView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-4.5].active = YES;
    
    [self.commentLineWhiteView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20].active = YES;
    
    [self.commentLineWhiteView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20].active = YES;
    
    [self.commentLineWhiteView.heightAnchor constraintEqualToConstant:1.5].active = YES;
    
    self.commentLineWhiteView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.commentLineWhiteView.backgroundColor = [UIColor whiteColor];
    
    
    [self.commentLineLabel.leadingAnchor constraintEqualToAnchor:self.commentLineBlackView.leadingAnchor constant:45].active = YES;
    
    [self.commentLineLabel.bottomAnchor constraintEqualToAnchor:self.commentLineBlackView.bottomAnchor constant:0].active = YES;
    
    [self.commentLineLabel.widthAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 93 / 375].active = YES;
    
    [self.commentLineLabel.heightAnchor constraintEqualToConstant:19].active = YES;
    
    self.commentLineLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.commentLineLabel.text = @"Comments";
    
    self.commentLineLabel.textColor = [UIColor blackColor];
    
    self.commentLineLabel.textAlignment = NSTextAlignmentCenter;
    
    self.commentLineLabel.backgroundColor = [UIColor whiteColor];
    

}






@end
