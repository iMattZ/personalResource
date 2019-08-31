//
//  ViewController.h
//  SliderViewDemo
//
//  Created by Mac on 2019/7/18.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@interface ViewController : UIViewController<iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;


@end

