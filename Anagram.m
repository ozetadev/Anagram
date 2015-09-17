//
//  Anagram.m
//  tests
//
//  Created by Philip Bernstein on 9/17/15.
//  Copyright © 2015 Philip Bernstein. All rights reserved.
//

#import "Anagram.h"

@implementation Anagram

+(NSArray *)checkForAnagrams:(NSArray *)words {
    
    NSMutableArray *sets = [[NSMutableArray alloc] init];
    
    for (NSString *word in words) { // splits words into maps of letters (NSSet, easily comparible)
        
        NSMutableSet *set = [[NSMutableSet alloc] init];
        for (int i = 0; i < word.length; i++) {
            [set addObject:[word substringWithRange:NSMakeRange(i, 1)]];
        }
        
        [sets addObject:set];
    }

    NSMutableArray *anagrams = [[NSMutableArray alloc] init];
    
    for (NSSet *set in sets) { // iterates through sets to find matching pairs
        for (NSSet *comparison in sets) {
            if (set != comparison) {
                if ([set isEqualToSet:comparison]) { // matching pair found
                    [anagrams addObject:[words objectAtIndex:[sets indexOfObject:set]]]; // added to returned array
                }
            }
        }
    }
    
    return anagrams;
}
@end
