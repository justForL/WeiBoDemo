//
//  ModalController.m
//  WeiBoDemo
//
//  Created by James on 16/5/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ModalController.h"


@interface ModalController ()

@end

@implementation ModalController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    [self setUpView];
    
    [self setUpGesture];
    
    
}

- (void)itemClick:(UITapGestureRecognizer *)recognizer {

    if ([self.delegate respondsToSelector:@selector(modalController:selectedItem:)]) {
        [self.delegate modalController:self selectedItem:(ModalItem *)recognizer.view];
    }
    
    [self backViewDidClick];
}

#pragma mark - 设置当前view并加载按钮
- (void)setUpView {
    //毛玻璃
    UIBlurEffect *blurEffect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc]initWithEffect:blurEffect];
    [visualEffectView setFrame:self.view.bounds];
    [self.view addSubview:visualEffectView];
    
    NSInteger col = 4; //3列
    CGFloat fatherW = 100;
    CGFloat fatherH = 100;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - col * fatherW) / (col + 1);
    
    //暂时写死
    for (NSInteger i  = 0; i < self.iconArray.count; ++i) {
        NSInteger rowNum = i / col ;//行号
        NSInteger colNum = i % col ;//列号
        CGFloat fatherX = margin + (margin + fatherW) * colNum;
        CGFloat fatherY = 100 + (50 + fatherH) * rowNum;
//        
//        UIView *fatherView = [[UIView alloc]initWithFrame:CGRectMake(fatherX, [UIScreen mainScreen].bounds.size.height + 30, fatherW, fatherH)];
//        
//        CGRect rect = fatherView.frame;
//        
//        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"addMatters"]];
//        imageView.frame =CGRectMake(rect.size.width / 8, 0, 0, 0);
//        [imageView sizeToFit];
//        
//        [fatherView addSubview:imageView];
//        //------------------------------------------------------------
//        UILabel *label = [[UILabel alloc]init];
//        label.text = @"点击";
//        [label sizeToFit];
//        label.textColor = [UIColor blackColor];
//        label.frame = CGRectMake(rect.size.width / 3, CGRectGetMaxY(imageView.frame) + 5, 0, 0);
//        [label sizeToFit];
//        [fatherView addSubview:label];
//        
////        fatherView.backgroundColor = [UIColor redColor];
//        [self.view addSubview:fatherView];
        ModalItem *item = self.iconArray[i];
        
        item.frame =CGRectMake(fatherX, [UIScreen mainScreen].bounds.size.height + 30, fatherW, fatherH);
        
        item.tag = i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemClick:)];
        [item addGestureRecognizer:tap];
        
        [self.view addSubview:item];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [ UIView animateWithDuration:1 delay:0.1 * i usingSpringWithDamping:0.98 initialSpringVelocity:15.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                item.frame = CGRectMake(fatherX, fatherY, fatherW, fatherH);
            } completion:nil];
        });
        
        
    }
}
#pragma mark - 按钮下落动画
- (void)canclAnimation {
    for (UIView *view in self.view.subviews) {
        CGRect viewFrame = view.frame;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [ UIView animateWithDuration:1 delay:0.1 * view.tag usingSpringWithDamping:0.98 initialSpringVelocity:15.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                view.frame = CGRectMake(viewFrame.origin.x, [UIScreen mainScreen].bounds.size.height + 30, viewFrame.size.width, viewFrame.size.height);
                
            } completion:nil];
        });
    }
}

#pragma mark - view的点击手势
- (void)setUpGesture {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backViewDidClick)];
    
    [self.view addGestureRecognizer:tap];
}

#pragma mark - view的tap事件
- (void)backViewDidClick {
    
    [self canclAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(dismissMyModalController:)]) {
            [self.delegate dismissMyModalController:self];
        }

    });
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
