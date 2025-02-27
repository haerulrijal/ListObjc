//
//  ListCell.m
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import "ListCell.h"


@interface ListCell()
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ListCell

-(instancetype)bindModel:(Post*) post {
    [_idLabel setText:post.postId];
    [_titleLabel setText:post.title];
}

@end
