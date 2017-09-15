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
    [self.tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"commentCell"];
    
    self.tableView.estimatedRowHeight = 300.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
   
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadProductData {
    
    
    
}


//- (UIImage)loadCommentUserPhotoWithUserId:(NSString*)userId {
//    
//    CommentUserProvider *commentUserProvider = CommentUserProvider.sharedInstance;
//    
//    [commentUserProvider getProductCommentWithUserId:userId withCompletionHandler:^(UIImage * _Nullable userPhoto, NSError * _Nullable error) {
//        
//        
//        
//        if(!error) {
//            
//            
//            return userPhoto;
//            
//        } else {
//            
//            
//            return [[UIImage alloc] init];
//            
//        }
//        
//        
//        
//    }];
//     
//     return [[UIImage alloc] init];
//    
//}


- (void)loadCommentsData {
    
    CommentProvider *commentProvider = CommentProvider.sharedInstance;
    [commentProvider getProductCommentWithProductId:@"aaa" withCompletionHandler:^(NSMutableArray<CommentModel *> * _Nullable comments, NSError * _Nullable error) {
       
        if (!error) {
            
            self.comments = comments;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.tableView.estimatedRowHeight = 40.0; // for example. Set your average height
                self.tableView.rowHeight = UITableViewAutomaticDimension;
                
                [self.tableView reloadData];
            });
            
           
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
            
//            return [self.comments count];
            return 10;

            
        default:
            break;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *productInfoCellIdentifier = @"productInfoCell";
    
    static NSString *commentCellIdentifier = @"commentCell";
    
    if (indexPath.section == 0) {
        
        commentsTableViewSection = productInfo;
        
        
    } else {
        
        commentsTableViewSection = comments;
        
    }
    
    
    switch (commentsTableViewSection) {
        case productInfo:
        {
        
            ProductInfoTableViewCell *cell = (ProductInfoTableViewCell*)[tableView dequeueReusableCellWithIdentifier: productInfoCellIdentifier forIndexPath:indexPath];
            
            if (cell == nil) {
                
                cell = [[ProductInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:productInfoCellIdentifier];
                
            }
            
            cell.productNameLabel.backgroundColor = [UIColor blueColor];
            
            
            cell.productPriceLabel.text = @"1000";
            
            return cell;
            
        }
        case comments:
        {
            CommentTableViewCell *cell = (CommentTableViewCell*)[tableView dequeueReusableCellWithIdentifier:commentCellIdentifier forIndexPath:indexPath];
            
            if (cell == nil) {
                
                cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentCellIdentifier];
                
            }
            

            
            dispatch_async(dispatch_get_global_queue(0,0), ^{
                
                NSString *path = [NSString stringWithFormat:@"%@%@%@%@", @"http://52.198.40.72/patissier", @"/users/", [[self.comments objectAtIndex:indexPath.row] userId], @"/picture.jpg"];
                
                NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: path]];
                if ( data != nil )
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // WARNING: is the cell still using the same data by this point??
                        cell.userPhotoImageView.image = [UIImage imageWithData:data];
                    });
                    
                }
            });
            
            

            
            cell.userNameLabel.text = [[self.comments objectAtIndex:indexPath.row] userName];
            
            cell.commentContentLabel.text = [[self.comments objectAtIndex:indexPath.row] userComment];
            
            return cell;
            
        }
        default:
            break;
    }

    
    
    return [[UITableViewCell alloc] init];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        return 152;
        
    } else {

        return UITableViewAutomaticDimension;
        
    }
    
    
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
