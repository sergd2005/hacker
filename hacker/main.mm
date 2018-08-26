//
//  main.m
//  hacker
//
//  Created by dankevyc on 8/26/18.
//  Copyright © 2018 Adobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iostream>
#import <vector>
using namespace std;
void minimumBribes(vector<int> q) {
    int ans = 0;
    for (int i = q.size() - 1; i >= 0; i--)
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        minimumBribes({1, 2, 5, 3, 7, 8, 6, 4});
    }
    return 0;
}
