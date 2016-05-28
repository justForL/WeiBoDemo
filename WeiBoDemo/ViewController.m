//
//  ViewController.m
//  WeiBoDemo
//
//  Created by James on 16/5/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "ModalController.h"

@interface ViewController ()<ModalControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor  = [UIColor colorWithPatternImage:[UIImage imageNamed:@"123"]];
}

- (IBAction)btnClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
    
    ModalController *modalVC = [[ModalController alloc]init];
    modalVC.delegate = self;
    //1.第一种
//    ModalItem *item = [ModalItem creatItem];
//    item.image = [UIImage imageNamed:@"addMatters"];
//    item.title = @"啊啊";
//    
//    ModalItem *item1 = [ModalItem creatItem];
//    item1.image = [UIImage imageNamed:@"addSchedule"];
//    item1.title = @"版本";
//    
//    ModalItem *item2 = [ModalItem creatItem];
//    item2.image = [UIImage imageNamed:@"searchContacts"];
//    item2.title = @"存储";
//    
//    ModalItem *item3 = [ModalItem creatItem];
//    item3.image = [UIImage imageNamed:@"setupChat"];
//    item3.title = @"迭代";
//    
//    ModalItem *item4 = [ModalItem creatItem];
//    item4.image = [UIImage imageNamed:@"setupChat"];
//    item4.title = @"恩恩";
    
    
    //2.第二种
    ModalItem *item = [ModalItem creatItemWithTitle:@"啊啊" imageNameStr:@"addMatters"];
    ModalItem *item1 = [ModalItem creatItemWithTitle:@"版本" imageNameStr:@"addSchedule"];
    ModalItem *item2 = [ModalItem creatItemWithTitle:@"存储" imageNameStr:@"setupChat"];
    ModalItem *item3 = [ModalItem creatItemWithTitle:@"迭代" imageNameStr:@"addMatters"];
    ModalItem *item4 = [ModalItem creatItemWithTitle:@"恩恩" imageNameStr:@"searchContacts"];
    
    modalVC.iconArray = @[item,item1,item2,item3,item4];
    
    modalVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    modalVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:modalVC animated:YES completion:nil];
    
}

#pragma mark - ModalControllerDelegate
- (void)modalController:(ModalController *)modalVc selectedItem:(ModalItem *)item {
    NSLog(@"%@",item.title);
}

- (void)dismissMyModalController:(ModalController *)modalVc {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%s",__func__);
}
@end
