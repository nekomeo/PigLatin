//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Elle Ti on 2017-06-02.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "NSString+pigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization
{
    // Convert sentence to array of words
    NSMutableString *words = [self componentsSeparatedByCharactersInSet:@" "];
    NSMutableArray *pigLatined = [NSMutableArray array];
    
    // Pig latinize the word individually
    for (NSString *word in pigLatined)
    { // If a word starts with a consonant, move the beginning components to the end and add 'ay'
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
        NSRange range = [word rangeOfCharacterFromSet:characterSet options:[NSCaseInsensitiveSearch]];
        
        if (range.location == NSNotFound)
        { // If a word starts with a vowel, just add 'way' to the end
            NSString *pigged = [word stringByAppendingString:@"way"];
            [pigLatined addObject:pigged];
        }
        else
        {
            NSArray *consonants = [NSMutableArray array];
            
            for (int i = 0; i < word.length; i++)
            {
                NSString *currentLetter = [NSString stringWithFormat:@"%c", [word characterAtIndex:i]];
                
                NSRange range = [word rangeOfString:characterSet options:[NSCaseInsensitiveSearch]];
                
                if (range.location == NSNotFound)
                { // Vowels
                    // remove consonants from the beginning
                    NSString *removedConsonants = [word substringFromIndex:i];
                    
                    // add them to the end
                    NSString *consonantsString = [consonants componentsJoinedByString:@""];
                    NSString *addedToEnd = [removedConsonants stringByAppendingString:consonantsString];
                    
                    // add ay
                    NSString *pigged = [addedToEnd stringByAppendingString:@"ay"];
                    [pigLatined addObject:pigged];
                    break;
                }
                else
                {
                    // Consonants
                    [consonants arrayByAddingObject:currentLetter];
                }
                [pigLatined addObject:word];
            }
            [word componentsSeparatedByString:@" "];
            [NSString stringWithFormat:@"%c", [word characterAtIndex:range.location]];
            [pigLatined addObject:word];
        }
        
        // Reconnect all the words back into a sentence
        return [pigLatined componentsJoinedByString:@" "];
    }
}

@end
