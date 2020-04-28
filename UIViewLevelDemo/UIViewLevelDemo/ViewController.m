//
//  ViewController.m
//  UIViewLevelDemo
//
//  Created by Liyun on 2020/4/28.
//  Copyright © 2020 Liyun. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Level.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
        
    
    UILabel *label1 = [self createLabel:1];
    UILabel *label2 = [self createLabel:2];
    UILabel *label3 = [self createLabel:3];
    UILabel *label4 = [self createLabel:4];
    UILabel *label5 = [self createLabel:5];
    UILabel *label6 = [self createLabel:6];
    UILabel *label7 = [self createLabel:7];
    UILabel *label8 = [self createLabel:8];
    UILabel *label9 = [self createLabel:9];
    UILabel *label10 = [self createLabel:10];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view addSubview:label7];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view addSubview:label6];
    });
    
    [self.view addSubview:label5];
    [self.view addSubview:label4];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label8];
    [self.view addSubview:label10];
    [self.view addSubview:label1];
    [self.view addSubview:label9];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UILabel *label0 = [self createLabel:12];
    label0.level = 12;
    [self.view addSubview:label0];
}

// 根据level 创建label
- (UILabel *)createLabel:(NSInteger )level{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(300-level*20, 100+10*level, 100, 200)];
    label.text = [NSString stringWithFormat:@"%ld",(long)level];
    label.font = [UIFont systemFontOfSize:18];
    label.backgroundColor = [self randomColor];
    label.textColor = [UIColor whiteColor];
    label.level = level;
    return label;
}

// 随机色
- (UIColor *)randomColor{
    NSInteger aRedValue = arc4random() % 255 ;
    NSInteger aGreenValue = arc4random() % 240 ;
    NSInteger aBlueValue = arc4random() % 255 ;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f
                                         green:aGreenValue / 255.0f
                                          blue:aBlueValue / 255.0f
                                         alpha:1.0f];
    return randColor;
}

@end
