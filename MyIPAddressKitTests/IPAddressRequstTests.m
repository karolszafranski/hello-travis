//
//  IPAddressRequstTests.m
//  MyIPAddressKitTests
//
//  Created by Karol Szafrański on 18.11.17.
//  Copyright © 2017 dstrct.in. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IPAddressRequest.h"

@interface IPAddressRequstTests : XCTestCase

@property (strong, nonatomic) IPAddressRequest* ipAddressRequest;

@end

@implementation IPAddressRequstTests

- (void)setUp {
    [super setUp];

    self.ipAddressRequest = [IPAddressRequest new];
    self.ipAddressRequest.URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];

    self.ipAddressRequest = nil;
}

- (void)testReturnFalseWithoutURLSession {
    self.ipAddressRequest.URLSession = nil;
    XCTAssertFalse([self.ipAddressRequest requestWithCompletionHandler:nil]);
}

- (void)testReturnNonEmptyString {
    XCTestExpectation* expectation = [self expectationWithDescription:@"will execute completion handler"];

    [self.ipAddressRequest requestWithCompletionHandler:^(NSString * IPAddressString, NSError * error) {
        [expectation fulfill];
        XCTAssertTrue(IPAddressString.length > 0);
        XCTAssertNil(error);
    }];

    [self waitForExpectationsWithTimeout:5.0
                                 handler:nil];
}

@end
