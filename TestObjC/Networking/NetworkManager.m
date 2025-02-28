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

- (void)sendPOSTRequestWithURL:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                     completion:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error;
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    if (!error) {
        request.HTTPBody = bodyData;
    }
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                 completionHandler:completion];
    [task resume];
}

@end

