//
//  DetailViewController.m
//  SimpleList
//
//  Created by Ulat Bulu on 27/02/25.
//

#import <UIKit//UIKit.h>
#import "DetailViewController.h"

@interface DetailViewController()
@property ListCellModel *model;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation DetailViewController


- (instancetype)initWithModel: (ListCellModel*) model {
    self = [super initWithNibName:@"DetailViewController" bundle:nil];
    if (self) {
        self.model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [_idLabel setText:self.model.itemId];
    [_titleLabel setText:self.model.title];
}

@end
