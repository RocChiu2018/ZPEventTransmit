//
//  ViewController.m
//  事件的产生和传递
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 触摸事件传递的过程：发生触摸事件以后，系统会将该事件加入到一个由UIApplication管理的事件队列中，然后UIApplication会从事件队列中取出最前面的事件，并将此事件分发下去以便处理。通常先发送事件给应用程序的主窗口(keyWindow)，keyWindow会在视图层次结构中找到一个最合适的视图控件来处理这个触摸事件，找到合适的视图控件以后，就会调用这个视图控件的相关的触摸方法(touchesBegan… touchesMoved… touchedEnded…)来具体处理这个触摸事件。
 
 触摸事件传递的顺序：触摸事件会从父控件传递到子控件。以本Demo为例：
 1、用户点击了绿色的View：UIApplication -> UIWindow -> 白色View -> 绿色View；
 2、用户点击了蓝色的View：UIApplication -> UIWindow -> 白色View -> 橙色View -> 蓝色View；
 3、用户点击了黄色的View：UIApplication -> UIWindow -> 白色View -> 橙色View -> 蓝色View -> 黄色View。
 
 如果父控件不能接受触摸事件的话则他上面的子控件也不能接受触摸事件；
 UIView不接受触摸事件的三种情况：
 1、禁止用户进行交互：userInteractionEnabled = NO；
 2、隐藏：hidden = YES；
 3、透明：alpha = 0.0 ~ 0.01（如果透明度小于0.01的话则说明该控件已经是完全透明的了）；
 在storyboard文件中如果把蓝色视图的userInteractionEnabled设为NO的话，则它上面的子视图（黄色视图）也不能接受触摸事件了，在程序运行以后用户点击黄色视图，系统就不会自动调用黄色视图的touchesBegan withEvent: 方法了。上述过程的原理为：当用户点击屏幕后此触摸事件会按照如下的顺序进行传递UIApplication -> UIWindow -> 白色View -> 橙色View，后面就会再传递给蓝色View，但是因为蓝色View不能接受点击事件，所以此点击事件的传递就此打住，不会再传给后面的黄色View了，此点击事件只能交给橙色View来处理了，所以系统会自动调用橙色View的touchesBegan withEvent: 方法；
 如果把蓝色视图隐藏或者设置蓝色视图的透明度为0.01，则此蓝色视图就看不见了，并且它上面的子视图（黄色视图）也看不见了，看不见的视图不会处理点击事件，所以点击事件只能交给底层的橙色视图来处理，所以系统会自动调用橙色视图的touchesBegan withEvent: 方法；
 UIImageView的userInteractionEnabled默认就是NO，因此UIImageView以及它的子控件默认是不能接受触摸事件的，如果想要让他们能接受触摸事件的话就要设置它的userInteractionEnabled为YES。
 */
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.imageView addSubview:addButton];  //此时点击添加按钮，UIImageView控件默认不能接受点击事件，但是UIImageView的父控件ZPWhiteView能接受点击事件，根据点击事件传递的原理，该点击事件由白色视图来处理。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
