//
//  ViewController.m
//  ClickButtonAlertKeyBoardView
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)  UIButton *sendBtn;
@property (nonatomic, strong) UITextField *commentTF;
@property (nonatomic, strong) UIView *commentView;
@property (nonatomic,assign) BOOL open;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _open = NO;
    
    [self setupView];
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    
}


- (void)textFieldEditChanged:(UITextField *)textField {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_open == NO) {
            [self.commentTF becomeFirstResponder];
        _open = YES;
    }else {
        [self.commentTF endEditing:YES];
        _open = NO;
    }
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.commentTF endEditing:YES];
}

- (void)setupView {
    UIView *keyBoardTopView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, 375, 50)];
    keyBoardTopView.backgroundColor = [UIColor whiteColor];
    keyBoardTopView.layer.borderWidth = 0.7;
    keyBoardTopView.layer.borderColor = [UIColor redColor].CGColor;//HZKColor(204, 204, 204).CGColor;
    //发布按钮
    self.sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(keyBoardTopView.bounds.size.width - 60 - 12, 4, 60, 45)];
    self.sendBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.sendBtn setTitle:@"发布" forState:UIControlStateNormal];
    self.sendBtn.alpha = 0.4;
    self.sendBtn.tag = 2002;
    [self.sendBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.sendBtn addTarget:self action:@selector(dismissKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardTopView addSubview:self.sendBtn];
    //输入框
    UITextField *inputTF = [[UITextField alloc] init];
    inputTF.frame = CGRectMake(10, 4, 375 - 10 - 72, 42);
    inputTF.placeholder = @"请输入评论";
    inputTF.tag = 1001;
    inputTF.delegate = self;
    inputTF.layer.cornerRadius = 5;
    inputTF.layer.masksToBounds = YES;
    self.commentTF = inputTF;
    inputTF.backgroundColor = [UIColor greenColor];//HZKColor(242, 242, 242);
    [inputTF addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    [keyBoardTopView addSubview:inputTF];
    self.commentView = keyBoardTopView;
    [self.view addSubview:keyBoardTopView];

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
        self.commentView.transform = CGAffineTransformMakeTranslation(0, -(keyBoardHeight + 50));
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
                self.commentView.transform = CGAffineTransformIdentity;
            };
    
        if (animationTime > 0) {
                [UIView animateWithDuration:animationTime animations:animation];
            } else {
                    animation();
        }
        
    
}
@end
