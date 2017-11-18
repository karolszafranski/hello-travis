//
//  IPAddressRequest.m
//  MyIPAddressKit
//
//  Created by Karol Szafrański on 18.11.17.
//  Copyright © 2017 dstrct.in. All rights reserved.
//

#import "IPAddressRequest.h"

#define IP_ADDRESS_REQUEST_URL_STRING @"https://ifconfig.co/ip"

@interface IPAddressRequest()

@end

@implementation IPAddressRequest

- (BOOL)requestWithCompletionHandler:(void (^)(NSString*, NSError*))completionHandler {
    NSURLSessionDataTask* dataTask = [self.URLSession dataTaskWithURL:[NSURL URLWithString:IP_ADDRESS_REQUEST_URL_STRING]
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        if (error) {
                                                            completionHandler(nil, error);
                                                        }
                                                        else {
                                                            NSString* IPAddressString = [[NSString alloc] initWithData:data
                                                                                                              encoding:NSUTF8StringEncoding];
                                                            if (IPAddressString) {
                                                                completionHandler(IPAddressString, nil);
                                                            }
                                                            else {
                                                                completionHandler(nil, [NSError errorWithDomain:@"MyIPAddressKitErrorDomain"
                                                                                                           code:-1
                                                                                                       userInfo:@{NSLocalizedDescriptionKey: @"Returned data is not valid UTF8 string."}]);
                                                            }
                                                        }
                                                    }];
    [dataTask resume];
    return dataTask != nil;
}

@end

