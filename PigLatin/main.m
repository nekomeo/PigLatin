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
        
        NSString *originalWord = @"pig latin too cheers stupid always are";
        NSLog(@"%@", [originalWord stringByAppendingStringWithPigLatinToEachWord]);
        
    }
    return 0;
}
