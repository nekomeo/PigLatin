//
//  main.m
//  PigLatin
//
//  Created by Elle Ti on 2017-06-02.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+pigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *originalWord = @"Pineapple cake";
        NSLog(@"Original word: %@.\nPig Latinized: %@", originalWord, [originalWord stringByAppendingStringWithPigLatinToEachWord]);
    }
    return 0;
}
