//
//  Post.h
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import <Foundation/Foundation.h>

@interface Post: NSObject

@property (strong) NSString *postId;
@property (strong) NSString *title;


-(instancetype)initWithId:(NSString *) itemId title:(NSString *)title;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end
