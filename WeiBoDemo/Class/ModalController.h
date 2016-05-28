//
//  ModalController.h
//  WeiBoDemo
//
//  Created by James on 16/5/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalItem.h"
@class ModalController;

@protocol ModalControllerDelegate <NSObject>
/**
 *  modal出来的控制器回收协议
 *
 *  @param modalVc <#modalVc description#>
 */
- (void)dismissMyModalController:(ModalController *)modalVc;
/**
 *  item的点击协议
 *
 *  @param modalVc <#modalVc description#>
 *  @param item    <#item description#>
 */
- (void)modalController:(ModalController *)modalVc selectedItem:(ModalItem *)item;

@end

@interface ModalController : UIViewController
/**
 *  用于存放按钮的数组
 */
@property (nonatomic, strong) NSArray<ModalItem *> *iconArray;

@property (nonatomic, assign) id <ModalControllerDelegate> delegate;

@end
