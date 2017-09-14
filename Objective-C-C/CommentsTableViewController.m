//
//  CommentsTableViewController.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/14.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "CommentsTableViewController.h"
#import <Foundation/Foundation.h>
@interface CommentsTableViewController ()

@end

@implementation CommentsTableViewController

@synthesize productId = _productId;

@synthesize comments = _comments;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCommentsData];
    
    [self.tableView registerClass:[ProductInfoTableViewCell class] forCellReuseIdentifier:@"productInfoCell"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadProductData {
    
    
    
}



- (void)loadCommentsData {
    
    CommentProvider *commentProvider = CommentProvider.sharedInstance;
    [commentProvider getProductCommentWithProductId:@"aaa" withCompletionHandler:^(NSMutableArray<CommentModel *> * _Nullable comments, NSError * _Nullable error) {
       
        if (!error) {
            
            self.comments = comments;
            [self.tableView reloadData];
        }
        
        
    }];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        
        commentsTableViewSection = productInfo;
        
        
    } else {
        
        commentsTableViewSection = comments;
        
    }
    
    switch (commentsTableViewSection) {
        case productInfo:
           
            return 1;

            
        case comments:
            
            return [self.comments count];

            
        default:
            break;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *productInfoCellIdentifier = @"productInfoCell";
    
    
    if (indexPath.section == 0) {
        
        commentsTableViewSection = productInfo;
        
        
    } else {
        
        commentsTableViewSection = comments;
        
    }
    
    
    switch (commentsTableViewSection) {
        case productInfo:
        {
        
            ProductInfoTableViewCell *cell = (ProductInfoTableViewCell*)[tableView dequeueReusableCellWithIdentifier: @"productInfoCell" forIndexPath:indexPath];
            
            if (cell == nil) {
                
                cell = [[ProductInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:productInfoCellIdentifier];
                
            }
            
            cell.productNameLabel.backgroundColor = [UIColor blueColor];
            
            
            cell.productPriceLabel.text = @"1000";
            
            return cell;
            
        }
        case comments:
            
            
            
            
            
            
            
        default:
            break;
    }

    
    
    return [[UITableViewCell alloc] init];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
