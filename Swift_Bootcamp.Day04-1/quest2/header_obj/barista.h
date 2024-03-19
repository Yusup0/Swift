//
//  barista.h
//  quest2
//
//  Created by Юсуп Оздоев on 03.01.2024.
//

#import <Foundation/Foundation.h>
#import "coffee.h"

#ifndef barista_h
#define barista_h

@protocol IBarista
- (void)brew:(Coffee *)coffee;
@end

@interface Barista : NSObject <IBarista>
@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSNumber *experience;
- (void)brew:(Coffee *)coffee;
@end

#endif /* barista_h */
