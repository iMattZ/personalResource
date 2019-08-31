//
//  YuiInputTextFieldCustomView.m
//  toolbarView
//
//  Created by Mac on 2019/7/10.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "YuiInputTextFieldCustomView.h"
#import <Masonry.h>


@implementation YuiInputTextFieldCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.imageView];
        
        self.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.inputTextField];
        [self addSubview:self.uploadImageButton];
        [self addSubview:self.chooseExpressButton];
        [self addSubview:self.atSomeoneButton];
        [self addSubview:self.sendButton];
        
        [self addSubview:self.testButton];
        
        [self addConstraint];
        
    }
    return self;
}





- (void)addConstraint {
    
    
    
    
    
    // 图片按钮
    [self.uploadImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.inputTextField.mas_left).offset(10);
//        make.top.mas_equalTo(self.inputTextField.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self).offset(-10);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    
    
    //表情
    [self.chooseExpressButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.uploadImageButton.mas_right).offset(30);
        make.centerY.mas_equalTo(self.uploadImageButton);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    
    // at
    [self.atSomeoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.chooseExpressButton.mas_right).offset(30);
        make.centerY.mas_equalTo(self.uploadImageButton);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    
    // 发送按钮
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.uploadImageButton);
        make.size.mas_equalTo(CGSizeMake(70, 28));
        make.right.mas_equalTo(self.inputTextField.mas_right);
    }];
    
    // 输入框
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(36);
        //        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10).priority(300);
        make.bottom.mas_equalTo(self.uploadImageButton.mas_top).offset(-10).priority(200);
    }];
    
}


- (UIView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIView alloc]init];
        _imageView.backgroundColor = [UIColor greenColor];
    }
    return _imageView;
}
#pragma mark  - <init method>

- (FSTextView *)inputTextField {
    if (_inputTextField == nil) {
        _inputTextField = [FSTextView textView];
        _inputTextField.backgroundColor = [UIColor lightGrayColor];
        _inputTextField.layer.cornerRadius = 18;
        _inputTextField.layer.masksToBounds  = YES;
        _inputTextField.placeholder = @"  评论一句～！";
        _inputTextField.placeholderFont = [UIFont systemFontOfSize:14];
        _inputTextField.placeholderColor = [UIColor redColor];
        _inputTextField.textContainerInset = UIEdgeInsetsMake(8, 10, 5, 10);
    }
    return _inputTextField;
}

- (UIButton *)uploadImageButton {
    if (_uploadImageButton == nil) {
        _uploadImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_uploadImageButton setImage:[UIImage imageNamed:@"add_pic"] forState:UIControlStateNormal];
    }
    return _uploadImageButton;
}

- (UIButton *)chooseExpressButton {
    if (_chooseExpressButton == nil) {
        _chooseExpressButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chooseExpressButton setImage:[UIImage imageNamed:@"add_phiz"] forState:UIControlStateNormal];
    }
    return _chooseExpressButton;
}

- (UIButton *)atSomeoneButton {
    if (_atSomeoneButton == nil) {
        _atSomeoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_atSomeoneButton setImage:[UIImage imageNamed:@"add_at"] forState:UIControlStateNormal];
    }
    return _atSomeoneButton;
}

- (UIButton *)sendButton {
    if (_sendButton == nil) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendButton setImage:[UIImage imageNamed:@"huifu_se"] forState:UIControlStateNormal];
    }
    return _sendButton;
}


- (UIButton *)testButton {
    if (_testButton == nil) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_testButton setImage:[UIImage imageNamed:@"huifu_se"] forState:UIControlStateNormal];
    }
    return _testButton;
}
@end
