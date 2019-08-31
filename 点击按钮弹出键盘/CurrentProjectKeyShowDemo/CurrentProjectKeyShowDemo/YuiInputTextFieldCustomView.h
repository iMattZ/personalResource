//
//  YuiInputTextFieldCustomView.h
//  toolbarView
//
//  Created by Mac on 2019/7/10.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YuiInputTextFieldCustomView : UIView
@property (nonatomic, strong) UIView *imageView;

// 文本输入
@property (nonatomic, strong) FSTextView *inputTextField;
// 上传图片
@property (nonatomic, strong) UIButton *uploadImageButton;
// 选择表情
@property (nonatomic, strong) UIButton *chooseExpressButton;
// at someone
@property (nonatomic, strong) UIButton *atSomeoneButton;
// 发送按钮
@property (nonatomic, strong) UIButton *sendButton;

@property (nonatomic, strong) UIButton *testButton;



- (void)addConstraint;
@end

NS_ASSUME_NONNULL_END
