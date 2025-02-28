//
//  ListCell.m
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import "ListCell.h"
#import "Post.h"

@interface ListCell()
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ListCell

-(void)bindModel:(Post *)post; {
    [_idLabel setText:post.postId];
    [_titleLabel setText:post.title];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self prepareForReuse];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

@end
