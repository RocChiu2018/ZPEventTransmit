//
//  ZPBaseView.m
//  事件的产生和传递
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPBaseView.h"

@implementation ZPBaseView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@-------touchesBegan", [self class]);
}

@end
