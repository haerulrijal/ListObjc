//
//  NetworkManager.h
//  TestObjC
//
//  Created by Ulat Bulu on 28/02/25.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+ (instancetype)sharedManager;
- (void)sendGETRequestWithURL:(NSString *)urlString
                   completion:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completion;

@end
