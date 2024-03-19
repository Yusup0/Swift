//
//  barista.h
//  quest1
//
//  Created by Юсуп Оздоев on 03.01.2024.
//

#import <Foundation/Foundation.h>
#import "coffee.h"

#ifndef barista_h
#define barista_h

@interface Barista : NSObject
@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSNumber *experience;
- (void)brew:(Coffee *)coffee;
@end

#endif /* barista_h */
