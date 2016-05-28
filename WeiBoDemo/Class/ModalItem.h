//
//  ModalItem.h
//  WeiBoDemo
//
//  Created by James on 16/5/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalItem : UIView
/**
 *  按钮要显示的图片
 */
@property (nonatomic, strong) UIImage *image;
/**
 *  按钮要显示的文字
 */
@property (nonatomic,copy)NSString *title;
/**
 *  按钮的初始化方法
 *
 *  @return self
 */
+ (instancetype)creatItem;
/**
 *  按钮的初始化方法
 *
 *  @param title        title
 *  @param imageNameStr imageNameStr
 *
 *  @return self
 */
+ (instancetype)creatItemWithTitle:(NSString *)title imageNameStr:(NSString *)imageNameStr;
@end
