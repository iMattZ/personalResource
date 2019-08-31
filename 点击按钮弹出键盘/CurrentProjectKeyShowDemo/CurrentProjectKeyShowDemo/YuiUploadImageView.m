//
//  YuiUploadImageView.m
//  CurrentProjectKeyShowDemo
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "YuiUploadImageView.h"
#import <Masonry.h>
@implementation YuiUploadImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.currentImageView];
        [self addSubview:self.deleBtn];
        
        [self.currentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
        [self.deleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(12, 12));
            make.centerX.mas_equalTo(self.currentImageView.mas_right);
            make.centerY.mas_equalTo(self.currentImageView.mas_top);
        }];
        
    }
    return self;
}

- (UIImageView *)currentImageView {
    if (_currentImageView == nil) {
        _currentImageView = [[UIImageView alloc]init];
        _currentImageView.backgroundColor = [UIColor orangeColor];
        
    }
    return _currentImageView;
}

- (UIButton *)deleBtn {
    if (_deleBtn == nil) {
        _deleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleBtn setBackgroundColor:[UIColor blueColor]];
    }
    return _deleBtn;
}

@end
