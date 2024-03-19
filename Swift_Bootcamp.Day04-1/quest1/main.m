//
//  main.m
//  quest1
//
//  Created by Юсуп Оздоев on 03.01.2024.
//

#import <Foundation/Foundation.h>
#import "coffee.h"
#import "barista.h"

int main(int argc, const char * argv[]) {
    Coffee *cappuccino = [[Coffee alloc] initWithName:@"Cappuccino" cost:@2];
    Coffee *americano = [[Coffee alloc] initWithName:@"Americano" cost:@1.5];
    Coffee *latte = [[Coffee alloc] initWithName:@"Latte" cost:@2.3];
    
    NSArray *array = @[cappuccino, americano, latte];
    for (int i = 1; i <= array.count; ++i) {
        Coffee *coffee = array[i - 1];
        NSLog(@"%d. %@ %@$", i, coffee.name, coffee.cost);
    }
    int number = 0;
    while (true) {
        scanf("%d", &number);
        if (0 < number && number < array.count + 1) {
            break;
        } else {
            NSLog(@"Try again!");
        }
    }
    Barista *barista = [[Barista alloc] init];
    [barista brew:array[number - 1]];
    return 0;
}
