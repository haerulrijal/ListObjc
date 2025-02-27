//
//  ListCell.h
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface ListCell: UITableViewCell

-(instancetype)bindModel:(Post *) post;

@end
