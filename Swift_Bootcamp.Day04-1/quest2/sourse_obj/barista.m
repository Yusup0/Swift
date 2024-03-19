//
//  barista.m
//  quest2
//
//  Created by Юсуп Оздоев on 03.01.2024.
//

#import "barista.h"

@implementation Barista
- (void)brew:(Coffee *)coffee {
    NSLog(@"\nProccesing brewing coffee...");
    NSLog(@"Your %@ is ready!", coffee.name);
}
@end
