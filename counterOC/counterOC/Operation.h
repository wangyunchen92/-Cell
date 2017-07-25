//
//  Operation.h
//  counterOC
//
//  Created by 王云晨 on 2017/7/24.
//  Copyright © 2017年 王云晨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Operation : NSObject

@property (nonatomic, copy)NSString *number1;
@property (nonatomic, copy)NSString *number2;
@property (nonatomic, copy)NSString *operatory;
- (instancetype)initWithnumber1:(NSString *)number1 andNumber2:(NSString *)number2 andOperatory:(NSString *)operatory;
- (NSString *)operation:(Operation *)operation;
@end
