
//
//  Operation.m
//  counterOC
//
//  Created by 王云晨 on 2017/7/24.
//  Copyright © 2017年 王云晨. All rights reserved.
//

#import "Operation.h"

@implementation Operation

- (NSString *)operation:(Operation *)operation {
    NSString *result = @"";
    
    if ([operation.operatory isEqualToString:@"+"]) {
        result =[NSString stringWithFormat:@"%f",[operation.number1 doubleValue] +[operation.number2 doubleValue]];
    } else if ([operation.operatory isEqualToString:@"-"]) {
        result =[NSString stringWithFormat:@"%f",[operation.number2 doubleValue] - [operation.number1 doubleValue]];
    } else if ([operation.operatory isEqualToString:@"×"]) {
        result = [NSString stringWithFormat:@"%f",[operation.number2 doubleValue] * [operation.number1 doubleValue]];
    } else if ([operation.operatory isEqualToString:@"÷"]) {
        result = [NSString stringWithFormat:@"%f",[operation.number2 doubleValue] / [operation.number1 doubleValue]];
    }
    return result;
}

- (instancetype)initWithnumber1:(NSString *)number1 andNumber2:(NSString *)number2 andOperatory:(NSString *)operatory {
    self = [super init];
    if (self) {
        self.number1 = number1;
        self.number2 = number2;
        self.operatory = operatory;
    }
    return self;
    
}


@end
