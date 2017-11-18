//
//  MockedNSURLSession.m
//  MyIPAddressKitTests
//
//  Created by Karol Szafrański on 18.11.17.
//  Copyright © 2017 dstrct.in. All rights reserved.
//

#import "MockedNSURLSession.h"

@interface MockedNSURLSession()
@property (strong, nonatomic) NSURL* usedURL;
@property (strong, nonatomic) NSData* dataToReturn;
@property (strong, nonatomic) NSURLResponse* responseToReturn;
@property (strong, nonatomic) NSError* errorToReturn;
@end

@implementation MockedNSURLSession

- (NSURLSessionDataTask *)dataTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    self.usedURL = url;
    completionHandler(self.dataToReturn, self.responseToReturn, self.errorToReturn);
    return [[NSURLSessionDataTask alloc] init];
}

@end
