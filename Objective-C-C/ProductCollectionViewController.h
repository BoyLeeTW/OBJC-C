//
//  CollectionViewController.h
//  Objective-C-C
//
//  Created by Brad on 13/09/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductProvider.h"
#import "CommentsTableViewController.h"

@interface ProductCollectionViewController : UICollectionViewController <ProductManagerDelegate>

@property (strong, atomic, readwrite) ProductProvider *productProvider;
@property NSMutableArray *products;
@property NSMutableString *nextPage;

@end
