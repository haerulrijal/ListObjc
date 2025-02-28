//
//  DetailViewController.m
//  SimpleList
//
//  Created by Ulat Bulu on 27/02/25.
//

#import <UIKit//UIKit.h>
#import "DetailViewController.h"

#import <UIKit//UIKit.h>
#import "DetailViewController.h"

@interface DetailViewController()
@property Post *post;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation DetailViewController


- (instancetype)initWithModel: (Post*) post {
    self = [super initWithNibName:@"DetailViewController" bundle:nil];
    if (self) {
        self.post = post;
    }
    return self;
}

- (void)viewDidLoad {
    [_idLabel setText:self.post.postId];
    [_titleLabel setText:self.post.title];
}

@end
