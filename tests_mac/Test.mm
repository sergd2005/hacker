//
//  Test.m
//  hacker
//
//  Created by dankevyc on 8/26/18.
//  Copyright © 2018 Adobe. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <iostream>
#import <vector>
#import <XCTest/XCTest.h>

@interface Solution:NSObject
+ (void) minimumBribes:(NSArray *)q;
@end

@implementation Solution

// Complete the minimumBribes function below.
+ (void) minimumBribes:(NSArray *)q
{
    // NSLog(@"q=%@",q);
    NSMutableArray<NSNumber *> *originalArr = [NSMutableArray new];
    for (NSUInteger i = 0; i < q.count; i++)
    {
        [originalArr addObject:@(i + 1)];
    }
    NSUInteger n = 0;
    for (NSUInteger i = 0; i < q.count; i++)
    {
        NSUInteger numberInInputQueue = ((NSNumber *)q[i]).unsignedIntegerValue;
        NSUInteger numberInOriginalQueue = ((NSNumber *)originalArr[i]).unsignedIntegerValue;
        if (numberInInputQueue == numberInOriginalQueue) continue;
        NSUInteger j = i;
        NSInteger diff = j - i;
        while (numberInInputQueue != numberInOriginalQueue && j < originalArr.count && diff <= 3)
        {
            numberInOriginalQueue = ((NSNumber *)originalArr[j]).unsignedIntegerValue;
            j++;
            diff = j - i;
            // NSLog(@"i=%i;j=%i", i, j);
        }
        j--;
        // NSLog(@"i=%i;j=%i", i, j);
        diff = j - i;
        // NSLog(@"diff=%i", diff);
        if (diff > 2)
        {
            printf("Too chaotic\n");
            return;
        }
        NSNumber *tmp = originalArr[j];
        for (NSUInteger k = j; k > i; k--)
            originalArr[k] = originalArr[k - 1];
        originalArr[i] = tmp;
        // NSLog(@"originalArr=%@", originalArr);
        n += diff;
    }
    printf("%lu\n", n);
}

@end

using namespace std;
void minimumBribes(vector<int> q) {
    int ans = 0;
    for (long i = q.size() - 1; i >= 0; i--)
    {
        NSInteger q_i = q[i];
        if (q_i - (i + 1) > 2) {
            cout << "Too chaotic" << endl;
            return;
        }
        for (int j = max(0, (int)q_i - 2); j < i; j++)
        {
            NSInteger q_j = q[j];
            if (q_j > q_i) ans++;
        }
        
    }
    cout << ans << endl;
}

@interface Test : XCTestCase

@end

@implementation Test

- (void)test_1 {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        minimumBribes({1, 2, 5, 3, 7, 8, 6, 4});
    }];
}

- (void)test_2 {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [Solution minimumBribes:@[@(1), @(2), @(5), @(3), @(7), @(8), @(6), @(4)]];
    }];
}


@end
