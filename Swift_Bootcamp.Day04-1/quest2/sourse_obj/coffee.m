//
//  coffee.m
//  quest2
//
//  Created by Юсуп Оздоев on 03.01.2024.
//

#import "coffee.h"

@implementation Coffee
- (id) initWithName: (NSString*) name cost: (NSNumber*) cost {
    if (self = [super init]) {
        self.name = name;
        self.cost = cost;
    }
    return self;
}
@end
