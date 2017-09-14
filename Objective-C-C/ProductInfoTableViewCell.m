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
        
        [self addSubview: self.productNameLabel];
        [self addSubview:self.productPriceLabel];
        [self addSubview:self.productImageView];
        [self addSubview:self.addToCartButton];
        [self addSubview:self.commentLineLabel];
        [self addSubview:self.commentLineBlackView];
        [self addSubview:self.commentLineWhiteView];
        
        
        
        
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
    
    
    self.productImageView.backgroundColor = [UIColor blueColor];
    
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
    
    self.addToCartButton.backgroundColor = [UIColor blueColor];
    
    
    [self.productPriceLabel.bottomAnchor constraintEqualToAnchor:self.productImageView.bottomAnchor constant:0.0].active = YES;
    
    [self.productPriceLabel.leadingAnchor constraintEqualToAnchor:self.productImageView.trailingAnchor constant:self.contentView.bounds.size.width * 10 / 375].active = YES;
    
    [self.productPriceLabel.trailingAnchor constraintEqualToAnchor:self.addToCartButton.leadingAnchor constant:- self.contentView.bounds.size.width * 30 / 375].active = YES;
    
    
    [self.productPriceLabel.heightAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 15 /375].active = YES;
    
    self.productPriceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    
    
    
    
    
    
    
    
}






@end
