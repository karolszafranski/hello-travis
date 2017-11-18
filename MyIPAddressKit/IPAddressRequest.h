//
//  IPAddressRequest.h
//  MyIPAddressKit
//
//  Created by Karol Szafrański on 18.11.17.
//  Copyright © 2017 dstrct.in. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPAddressRequest : NSObject

@property (strong, nonatomic) NSURLSession* URLSession;

- (BOOL)requestWithCompletionHandler:(void (^)(NSString*, NSError*))completionHandler;

@end
