//
//  ViewController.m
//  CurrentProjectKeyShowDemo
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"
#import "YuiInputTextFieldCustomView.h"
#import <Masonry.h>

@interface ViewController ()<UITextViewDelegate>
@property (nonatomic, strong) YuiInputTextFieldCustomView *textFieldCustomView;
@property (nonatomic, strong) UIButton *imgView;
@property (nonatomic,assign) BOOL open;
@end

@implementation ViewController

- (YuiInputTextFieldCustomView *)textFieldCustomView {
    if (_textFieldCustomView == nil) {
        _textFieldCustomView = [[YuiInputTextFieldCustomView alloc]init];
        [_textFieldCustomView.uploadImageButton addTarget:self action:@selector(ClickUploadButton:) forControlEvents:UIControlEventTouchUpInside];
        _textFieldCustomView.inputTextField.delegate = self;
    }
    return _textFieldCustomView;
}



- (void)ClickUploadButton:(id)sender {
    
    [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(15);
        make.bottom.mas_equalTo(self.textFieldCustomView.mas_top).offset(-15);
        make.size.mas_equalTo(CGSizeMake(72, 72));
        
        
    }];
    
}

- (void)ClickRemoveImage:(id)sender {
    
    [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(15);
        make.bottom.mas_equalTo(self.textFieldCustomView.mas_top).offset(-15);
        make.size.mas_equalTo(CGSizeMake(72, 0));
//        make.height.mas_equalTo(0);
    }];
    
}

- (UIButton *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIButton alloc]init];
        _imgView.backgroundColor = [UIColor redColor];
        [_imgView addTarget:self action:@selector(ClickRemoveImage:) forControlEvents:UIControlEventTouchUpInside];
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
//    self.view.backgroundColor = [UIColor redColor];
    
    
    [self.view addSubview:self.textFieldCustomView];
    [self.textFieldCustomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(95);
    }];
    
    [self.view addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(15);
        make.bottom.mas_equalTo(self.textFieldCustomView.mas_top).offset(-15);
        make.size.mas_equalTo(CGSizeMake(72, 0));
        
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
        self.textFieldCustomView.transform = CGAffineTransformMakeTranslation(0, -(keyBoardHeight + 0));
        self.imgView.transform = CGAffineTransformMakeTranslation(0, -(keyBoardHeight + 50));
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
            };
    
        if (animationTime > 0) {
                [UIView animateWithDuration:animationTime animations:animation];
            } else {
                    animation();
        }
        
    
}
@end
