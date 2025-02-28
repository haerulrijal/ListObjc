//
//  DetailViewController.h
//  SimpleList
//
//  Created by Ulat Bulu on 27/02/25.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface DetailViewController : UIViewController
- (instancetype)initWithModel: (Post *) model;
@end

