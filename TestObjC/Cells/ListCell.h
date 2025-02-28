//
//  ListCell.h
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import <UIKit/UIKit.h>
@class Post;

@interface ListCell: UITableViewCell

-(void)bindModel:(Post *)post;

@end
