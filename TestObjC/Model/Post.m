//
//  Post.m
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface Post()

    
@end

@implementation Post

-(instancetype)initWithId:(NSString *) itemId title:(NSString *)title {
    self = [super init];
    if(self) {
        self.title = title;
        self.postId = itemId;
    }
    return self;
}

@end
