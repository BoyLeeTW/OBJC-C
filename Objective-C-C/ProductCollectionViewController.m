//
//  CollectionViewController.m
//  Objective-C-C
//
//  Created by Brad on 13/09/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "ProductCollectionViewCell.h"
#import "ProductProvider.h"
#import "Product.h"

@interface ProductCollectionViewController ()

@property (strong, nonatomic) UICollectionViewFlowLayout *cellLayout;

@end

@implementation ProductCollectionViewController

int *selectedRow = 0;

static NSString * const reuseIdentifier = @"ProductCell";

@synthesize productProvider;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationBar];

    [self setUpCellLayout];

}

-(void) viewWillAppear:(BOOL)animated {
    
    productProvider = [[ProductProvider alloc] init];
    
    productProvider.delegate = self;
    
    productProvider.requestProduct;
}

- (void)setUpNavigationBar {

    //set up status bar to light content style
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;

    //set up navigation bar title
    self.navigationItem.title = @"Pâtissier";

    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                      NSFontAttributeName:[UIFont fontWithName:@"Georgia-bold" size: 18.0]
                                                                      }];

    [[self navigationController] navigationBar].layer.shadowColor = [UIColor blackColor].CGColor;

    [[self navigationController] navigationBar].layer.shadowOffset = CGSizeMake(0.0, 1.0);

    [[self navigationController] navigationBar].layer.shadowRadius = 2.0;

    [[self navigationController] navigationBar].layer.shadowOpacity = 1.0;

    [[self navigationController] navigationBar].layer.masksToBounds = NO;

    // set up navigation bar gradient
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    gradientLayer.frame = CGRectMake(self.navigationController.navigationBar.bounds.origin.x,
                                     self.navigationController.navigationBar.bounds.origin.y,
                                     self.navigationController.navigationBar.bounds.size.width,
                                     self.navigationController.navigationBar.bounds.size.height + 20);

    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[[UIColor colorWithRed: 3.0 / 255.0 green: 63.0 / 255.0 blue: 122.0 / 255.0 alpha: 1.0] CGColor ],
                            (id) [[UIColor colorWithRed: 4.0 /255.0 green: 107.0 / 255.0 blue: 149.0 / 255.0 alpha: 1.0] CGColor],
                            nil];

    gradientLayer.startPoint = CGPointMake(0.0, 0.5);

    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    // Render the gradient to UIImage
    UIGraphicsBeginImageContext(gradientLayer.frame.size);

    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage: gradientImage forBarMetrics: UIBarMetricsDefault];

}

-(void)setUpCellLayout {

    self.cellLayout = [[UICollectionViewFlowLayout alloc] init];

    self.cellLayout.sectionInset = UIEdgeInsetsMake(21.0, 20.0, 14.0, 20.0);

    self.cellLayout.itemSize = CGSizeMake(154.0, 160.0);

    self.cellLayout.minimumInteritemSpacing = 0;

    self.cellLayout.minimumLineSpacing = 21.5;


    self.collectionView.collectionViewLayout = self.cellLayout;

    self.collectionView.collectionViewLayout = self.cellLayout;

}

#pragma mark <ProductProviderDelegate>
-(void) didGetProducts:(NSArray *)fetchedProducts {
    
    _products = fetchedProducts;
    
    NSLog(@"Delegate requested products");
    
    _nextPage = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI1OTI1MWNiMTQ3ZDUzYjA4NWNhMDc2NTQiLCJsaW1pdCI6MTAsIm9mZnNldCI6MTAsInR5cGUiOiJwYWdlIiwidmVyc2lvbiI6IjEuMCJ9.tIGvrPtticeV7ssvpy5p0_jMOHjTNYqNfJaqdOUKiTs";
    
    [[self collectionView ] reloadData];
}

-(void) didGetNextPageProducts:(NSArray *)fetchedProducts {
    
    for (id nextPageProduct in fetchedProducts) {
        
        Product *product = [[Product alloc] init];
        
        [_products addObject:product];
    }
    
    _nextPage = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI1OTI1MWNiMTQ3ZDUzYjA4NWNhMDc2NTQiLCJsaW1pdCI6MTAsIm9mZnNldCI6MjAsInR5cGUiOiJwYWdlIiwidmVyc2lvbiI6IjEuMCJ9.Ba7YlBl-turKSvUOxl8heMhnZalwqllsKSbV2PjOViw";
    
    [[self collectionView] reloadData];
    
}
    
-(void) didFail:(NSError *)error {
    
    NSLog(@"%@", error);
}

-(void) collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == _products.count - 1 && _nextPage != @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI1OTI1MWNiMTQ3ZDUzYjA4NWNhMDc2NTQiLCJsaW1pdCI6MTAsIm9mZnNldCI6MjAsInR5cGUiOiJwYWdlIiwidmVyc2lvbiI6IjEuMCJ9.Ba7YlBl-turKSvUOxl8heMhnZalwqllsKSbV2PjOViw") {
        
        NSLog(@"Next Page func action!");
        
        productProvider = [[ProductProvider alloc] init];
        
        productProvider.delegate = self;
        
        productProvider.requestNextPage;
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _products.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath:indexPath];
    
    Product *productInCell = [_products objectAtIndex: indexPath.row];
    
    cell.productNameLabel.text = productInCell.name;
    
    NSNumber *productPrice = productInCell.price;
    
    NSString *priceToString = [productPrice stringValue];
    
    NSString *priceString = [NSString stringWithFormat:@"%@%@", @"$ ", priceToString];
    
    
    cell.productPriceLabel.text = priceString;
    

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *baseURL = @"http://52.198.40.72/patissier/products/";
        
        NSString *productID = productInCell.productId;
        
        NSString *productPreviewURL = [NSString stringWithFormat:@"%@%@%@", baseURL, productID, @"/preview.jpg"];
        
        NSURL *imageUrl = [NSURL URLWithString:productPreviewURL];
        
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        
        UIImage *productImage = [UIImage imageWithData:imageData];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [cell.productImageView setContentMode:UIViewContentModeScaleAspectFill];
            
            [cell.productImageView setImage:productImage];
        });
        
    });
    return cell;

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Product *productInCell = [_products objectAtIndex: indexPath.row];

    selectedRow = indexPath.row;
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

        CommentsTableViewController *destinationViewController = segue.destinationViewController;

        Product *productInCell = [_products objectAtIndex: selectedRow];

        destinationViewController.productName = productInCell.name;

        NSNumber *productPrice = productInCell.price;
        
        NSString *priceToString = [productPrice stringValue];
        
        destinationViewController.productPrice = priceToString;

        destinationViewController.productId = productInCell.productId;

}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

