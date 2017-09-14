//
//  CollectionViewController.m
//  Objective-C-C
//
//  Created by Brad on 13/09/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "ProductCollectionViewCell.h"

@interface ProductCollectionViewController ()

@property (strong, nonatomic) UICollectionViewFlowLayout *cellLayout;

@end

@implementation ProductCollectionViewController

static NSString * const reuseIdentifier = @"ProductCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationBar];

    [self setUpCellLayout];

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

- (void)setUpCellLayout {

    self.cellLayout = [[UICollectionViewFlowLayout alloc] init];

    self.cellLayout.sectionInset = UIEdgeInsetsMake(21.0, 20.0, 14.0, 20.0);

    self.cellLayout.itemSize = CGSizeMake(154.0, 160.0);

    self.cellLayout.minimumInteritemSpacing = 0;

    self.cellLayout.minimumLineSpacing = 21.5;

    self.collectionView.collectionViewLayout = self.cellLayout;

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

    return 10;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath:indexPath];

//    UIGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(touchIsFavoriteButton:)];
//    
//    [cell.isFavoriteProductButton addGestureRecognizer:singleTap];

    return cell;

}

//- (void)touchIsFavoriteButton: (UIButton *)sender {
//
//    if (sender.tintColor == UIColor.redColor) {
//        
//        sender.tintColor = [UIColor colorWithRed: 165.0 / 255.0
//                                           green: 170.0 / 255.0
//                                            blue: 178.0 / 255.0
//                                           alpha: 1.0];
//
//    } else {
//
//        sender.tintColor = [UIColor redColor];
//
//    }
//
//}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

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
