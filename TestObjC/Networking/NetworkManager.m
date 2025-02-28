//
//  NetworkManager.m
//  TestObjC
//
//  Created by Ulat Bulu on 28/02/25.
//
#import "NetworkManager.h"

@interface NetworkManager()

@end

@implementation NetworkManager

+ (instancetype)sharedManager {
    static NetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)sendGETRequestWithURL:(NSString *)urlString
                   completion:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                             completionHandler:completion];
    [task resume];
}

@end


