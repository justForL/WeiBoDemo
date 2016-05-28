//
//  ModalItem.m
//  WeiBoDemo
//
//  Created by James on 16/5/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ModalItem.h"


@interface ModalItem ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ModalItem {
    UIImageView *_imageView;
    UILabel   *_label;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        _imageView = imageView;
        
        [self addSubview:imageView];
        //------------------------------------------------------------
        UILabel *label = [[UILabel alloc]init];
        label.text = @"";
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        _label = label;
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title imageNameStr:(NSString *)imageNameStr {
    if (self = [super init]) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageNameStr]];
        _imageView = imageView;
        //这两句不写不会走setter方法,导致点击后值为空
        self.image = imageView.image;
        self.title = title;
        
        [self addSubview:imageView];
        UILabel *label = [[UILabel alloc]init];
        label.text = title;
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        _label = label;
        self.userInteractionEnabled = YES;
    }
    return self;
}

+ (instancetype)creatItem {
    return [[self alloc] init];
}

+ (instancetype)creatItemWithTitle:(NSString *)title imageNameStr:(NSString *)imageNameStr {
    return  [[self alloc]initWithTitle:title imageNameStr:imageNameStr];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGRect rect = self.frame;
    _imageView.frame =CGRectMake(rect.size.width / 8, 0, 0, 0);
    [_imageView sizeToFit];
    _label.frame = CGRectMake(rect.size.width / 3, CGRectGetMaxY(_imageView.frame) + 5, 0, 0);
    [_label sizeToFit];

}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.label.text = title;
}

- (void)setImage:(UIImage *)image {
    _imageView.image = image;
}
@end
