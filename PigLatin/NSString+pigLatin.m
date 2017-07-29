//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Elle Ti on 2017-06-02.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "NSString+pigLatin.h"

@interface NSString()

@property (nonatomic) NSMutableArray *arrayOfLetters;
@property (nonatomic) NSString *word;
@property (nonatomic) NSString *pigLatin;

- (NSMutableArray *)arrayOfLettersInWord:(NSString *)word;

@end

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization
{
    return [self stringByAppendingString:@"ay"];
}

- (NSString *)stringByAppendingStringWithPigLatinToEachWord
{
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSMutableArray *appendWords = [NSMutableArray array];
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    
    // Pig latin the word individually
    for (NSString *word in words)
    {
        int indexNumber = 1;
        
        if (![vowelSet characterIsMember:[word characterAtIndex:1]])
        {
            indexNumber = 2;
        }
        NSString *firstChar = [[word substringToIndex:indexNumber] stringByAppendingString:@"ay"];
        NSString *restOfWord = [word substringFromIndex:indexNumber];
        
        [appendWords addObject:[restOfWord stringByAppendingString:firstChar]];
        
    }
    return [appendWords componentsJoinedByString:@" "];
}

@end
