//
//  YuiCalendarView.m
//  YQNumberSlideView_DEMO
//
//  Created by Mac on 2019/7/11.
//  Copyright © 2019 freakyyang. All rights reserved.
//

#import "YuiCalendarView.h"

@implementation YuiCalendarView

//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super initWithCoder:coder];
//    if (self) {
//        self = [[[NSBundle mainBundle] loadNibNamed:@"YuiCalendarView" owner:self options:nil]firstObject];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self = [[[NSBundle mainBundle] loadNibNamed:@"YuiCalendarView" owner:self options:nil]firstObject];
        self.backgroundColor = [UIColor redColor];
        
        [self addSubview:self.backgroundimage];
        self.backgroundimage.frame = CGRectMake(0, 0, 60, 88);
        
        [self addSubview:self.currentLabel];
        self.currentLabel.frame =  CGRectMake(0, 0, 60, 88);
        
        
        [self addSubview:self.topLabel];
        self.topLabel.frame = CGRectMake(0, 0, 60, 35);
        
        [self addSubview:self.bottomLabel];
        self.bottomLabel.frame = CGRectMake(0, 55, 60, 30);
    }
    return self;
}




- (UIImageView *)backgroundimage {
    if (_backgroundimage == nil) {
        _backgroundimage = [[UIImageView alloc]init];
    }
    return _backgroundimage;
}

- (UILabel *)currentLabel {
    if (_currentLabel == nil) {
        _currentLabel = [[UILabel alloc]init];
        _currentLabel.textColor = [UIColor blackColor];
    }
    return _currentLabel;
}

- (UILabel *)topLabel {
    if (_topLabel == nil) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.text = @"Jun";
        _topLabel.font = [UIFont systemFontOfSize:14];
        _topLabel.textAlignment = NSTextAlignmentCenter;
    }return _topLabel;
}

- (UILabel *)bottomLabel {
    if (_bottomLabel == nil) {
        _bottomLabel = [[UILabel alloc]init];
        _bottomLabel.text = @"月";
        _bottomLabel.font = [UIFont systemFontOfSize:14];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomLabel;
}
@end
