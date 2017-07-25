//
//  ViewController.m
//  counterOC
//
//  Created by 王云晨 on 2017/7/21.
//  Copyright © 2017年 王云晨. All rights reserved.
//

#import "ViewController.h"
#import "Operation.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showNumber;
@property (nonatomic, copy)NSMutableArray* temporaryNumber;
@property (nonatomic, copy)NSString *temporaryString;
@property (nonatomic, copy)NSString* (^temporaryOperatory)(NSString *,NSString *);
@property BOOL isReconfirmInput;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isReconfirmInput = YES;
    _temporaryNumber = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)inputNumber:(UIButton *)sender {
    NSString *number = sender.titleLabel.text;
    if (!self.isReconfirmInput) {
        self.showNumber.text = [NSString stringWithFormat:@"%@%@",self.showNumber.text,number];
    } else {
        self.showNumber.text = number;
        _isReconfirmInput = NO;
    }
}

//计算
- (IBAction)resultNumber:(id)sender {
    [self saveNumber:nil];
    if (self.temporaryOperatory && self.temporaryNumber.count > 1) {
        self.showNumber.text = self.temporaryOperatory([self objectFormArrayLastObject:self.temporaryNumber],[self objectFormArrayLastObject:self.temporaryNumber]);
        self.temporaryOperatory = nil;
    }
}

- (IBAction)saveNumber:(UIButton *)sender {
    self.isReconfirmInput = YES;
    [self.temporaryNumber addObject:self.showNumber.text];
}

- (IBAction)operation:(UIButton *)sender {
    //输入数字之后才能计算
    if (!self.isReconfirmInput) {
        [self resultNumber:nil];
    }

    __weak typeof(self) weakSelf = self;
    self.temporaryOperatory = ^NSString *(NSString *number1,NSString *number2) {
        Operation *operationModel = [[Operation alloc] initWithnumber1:number1 andNumber2:number2 andOperatory:sender.titleLabel.text];
         [weakSelf.temporaryNumber addObject:[operationModel operation:operationModel]];
        return [operationModel operation:operationModel];
        };
}

- (NSString *)objectFormArrayLastObject:(NSMutableArray *)array {
    NSString *temporaryNumber = [array lastObject];
    [array removeLastObject];
    return temporaryNumber;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
