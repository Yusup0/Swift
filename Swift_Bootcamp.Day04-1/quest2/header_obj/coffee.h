//
//  coffee.h
//  quest2
//
//  Created by Юсуп Оздоев on 03.01.2024.
//
#import <Foundation/Foundation.h>

#ifndef coffee_h
#define coffee_h

@interface Coffee : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *cost;
- (id) initWithName: (NSString*) name cost: (NSNumber*) cost;
@end

#endif /* coffee_h */
