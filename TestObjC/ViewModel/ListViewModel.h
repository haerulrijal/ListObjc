//
//  ListViewModel.h
//  TestObjC
//
//  Created by Ulat Bulu on 27/02/25.
//


#import <Foundation/Foundation.h>


@interface ListViewModel: NSObject

@property (strong, nonatomic) NSArray * posts;
-(void)dummy;

- (void)fetchDataWithCompletion:(void (^)(NSError *error))completion;

@end
