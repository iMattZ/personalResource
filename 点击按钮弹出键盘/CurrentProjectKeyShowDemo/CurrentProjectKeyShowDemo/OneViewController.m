//
//  OneViewController.m
//  CurrentProjectKeyShowDemo
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "OneViewController.h"
#import "YuiInputTextFieldCustomView.h"
#import <Masonry.h>
#import "YuiUploadImageView.h"

@interface OneViewController ()<UITextViewDelegate>
@property (nonatomic, strong) YuiInputTextFieldCustomView *textFieldCustomView;
@property (nonatomic, strong) YuiUploadImageView *imgView;
@property (nonatomic,assign) BOOL open;

@property (nonatomic, strong) UIButton *bottomButton;

@end

@implementation OneViewController

// 输入框
- (YuiInputTextFieldCustomView *)textFieldCustomView {
    if (_textFieldCustomView == nil) {
        _textFieldCustomView = [[YuiInputTextFieldCustomView alloc]init];
        [_textFieldCustomView.uploadImageButton addTarget:self action:@selector(ClickUploadButton:) forControlEvents:UIControlEventTouchUpInside];
        [_textFieldCustomView.sendButton addTarget:self action:@selector(ClickSendButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        _textFieldCustomView.inputTextField.delegate = self;
    }
    return _textFieldCustomView;
}


// 底部按钮
- (UIButton *)bottomButton {
    if (_bottomButton == nil) {
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomButton addTarget:self action:@selector(ShowTextView:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomButton setBackgroundColor:[UIColor lightGrayColor]];
        [_bottomButton setTitle:@"bottomButton" forState:UIControlStateNormal];
    }
    return _bottomButton;
}

// 提起键盘
- (void)ShowTextView:(id)sender {
    [self.textFieldCustomView.inputTextField becomeFirstResponder];
    
}


// 提起发送按钮
- (void)ClickSendButtonEvent:(id)sender {
    [self.textFieldCustomView.inputTextField endEditing:YES];
    self.textFieldCustomView.inputTextField.text = @"";
    
    
    self.imgView.hidden = YES;
    [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(0);
        make.bottom.mas_equalTo(self.textFieldCustomView.mas_top).offset(-0);
        make.size.mas_equalTo(CGSizeMake(72+20, 0));

    }];
    
    
    NSLog(@"发送成功 ");
    
}

// 上传图片
- (void)ClickUploadButton:(id)sender {
    
    self.imgView.hidden = NO;
    
    [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(0);
        make.bottom.mas_equalTo(self.textFieldCustomView.mas_top).offset(-0);
        make.size.mas_equalTo(CGSizeMake(72+20, 72+20));
        
        
    }];
    
}

// 移除图片
- (void)ClickRemoveImage:(id)sender {
    
    self.imgView.hidden = YES;
    [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(0);
        make.bottom.mas_equalTo(self.textFieldCustomView.mas_top).offset(-0);
        make.size.mas_equalTo(CGSizeMake(72+20, 0));
        //        make.height.mas_equalTo(0);
    }];
    
}


// 图片
- (YuiUploadImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[YuiUploadImageView alloc]init];
        _imgView.backgroundColor = [UIColor clearColor];
        _imgView.hidden = YES;
        [_imgView.deleBtn addTarget:self action:@selector(ClickRemoveImage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _imgView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_open == NO) {
        [self.textFieldCustomView becomeFirstResponder];
        _open = YES;
    }else {
        [self.textFieldCustomView endEditing:YES];
        _open = NO;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    // 底部按钮
    [self.view addSubview:self.bottomButton];
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(66);
    }];
    
    // 输入框
    [self.view addSubview:self.textFieldCustomView];
    [self.textFieldCustomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(95);
    }];
    
    
    // 上传图片
    [self.view addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(0);
        make.bottom.mas_equalTo(self.textFieldCustomView.mas_top).offset(-0);
        make.size.mas_equalTo(CGSizeMake(72+20, 0));
        
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

#pragma mark -键盘监听方法
- (void)keyBoardWillShow:(NSNotification *)notification
{
    //     获取用户信息
    NSDictionary *userInfo = [NSDictionary dictionaryWithDictionary:notification.userInfo];
    // 获取键盘高度
    CGRect keyBoardBounds  = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyBoardHeight = keyBoardBounds.size.height;
    // 获取键盘动画时间
    CGFloat animationTime  = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // 定义好动作
    void (^animation)(void) = ^void(void) {
        self.textFieldCustomView.transform = CGAffineTransformMakeTranslation(0, -(keyBoardHeight + 95));
        self.imgView.transform = CGAffineTransformMakeTranslation(0, -(keyBoardHeight + 95));
    };
    
    if (animationTime > 0) {
        [UIView animateWithDuration:animationTime animations:animation];
    } else {
        animation();
    }
    
}
- (void)keyBoardWillHide:(NSNotification *)notificaiton
{
        
        // 获取用户信息
        NSDictionary *userInfo = [NSDictionary dictionaryWithDictionary:notificaiton.userInfo];
        // 获取键盘动画时间
        CGFloat animationTime  = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
        // 定义好动作
        void (^animation)(void) = ^void(void) {
                self.textFieldCustomView.transform = CGAffineTransformIdentity;
        self.imgView.transform = CGAffineTransformIdentity;
        self.imgView.transform = CGAffineTransformMakeTranslation(0, -(66));
            };
    
        if (animationTime > 0) {
                [UIView animateWithDuration:animationTime animations:animation];
            } else {
                    animation();
        }
        
    
}
@end
