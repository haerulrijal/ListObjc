//
//  ListViewModel.m
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//

#import "ListViewModel.h"
#import "NetworkManager.h"
#import "Post.h"

@interface ListViewModel()

@end


@implementation ListViewModel

-(void)dummy {
    NSMutableArray *dummy = [[NSMutableArray alloc] init];
    for (int i=0; i<3; i++) {
        Post *post = [[Post alloc] initWithId:@"1" title:@"Septy"];
        [dummy addObject:post];
    }
    
    self.posts = [dummy copy];
}

- (void)fetchDataWithCompletion:(void (^)(NSError *error))completion {
    [[NetworkManager sharedManager] sendGETRequestWithURL:@"https://jsonplaceholder.typicode.com/posts"
                                               completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(error);
            return;
        }
        
        NSError *jsonError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(jsonError);
            return;
        }
        
        NSMutableArray *modelsArray = [NSMutableArray array];
        for (NSDictionary *dict in jsonArray) {
            Post *post = [[Post alloc] initWithDictionary:dict];
            [modelsArray addObject:post];
        }
        
        self.posts = modelsArray;
        completion(nil);
    }];
}

@end
