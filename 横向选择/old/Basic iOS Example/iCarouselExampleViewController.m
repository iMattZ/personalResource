//
//  iCarouselExampleViewController.m
//  iCarouselExample
//
//  Created by Nick Lockwood on 03/04/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "iCarouselExampleViewController.h"
#import "YuiCalendarView.h"

@interface iCarouselExampleViewController ()

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) UIImageView *bg;

@property (nonatomic, strong) UIColor *remeberColor;
@property (nonatomic, assign) NSInteger remeberIndex;

@end


@implementation iCarouselExampleViewController

- (UIImageView *)bg {
    if (_bg == nil) {
        _bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"123.png"]];
        _bg.frame = CGRectMake(0, 0, 375, 80);
    }
    return _bg;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    //set up data
    //your carousel should always be driven by an array of
    //data of some kind - don't store data in your item views
    //or the recycling mechanism will destroy your data once
    //your item views move off-screen
    self.items = [NSMutableArray array];
    for (int i = 0; i < 20; i++)
    {
        [_items addObject:@(i)];
    }
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    //this is true even if your project is using ARC, unless
    //you are targeting iOS 5 as a minimum deployment target
    _carousel.delegate = nil;
    _carousel.dataSource = nil;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.bg];
    self.bg.center  = _carousel.center;
    
    //configure carousel
    _carousel.type = iCarouselTypeLinear;
    [self.view bringSubviewToFront:_carousel];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //free up memory by releasing subviews
    self.carousel = nil;
    
    
    
    [self carousel:self.carousel didSelectItemAtIndex:5];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(80, 100);
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [_items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80.0f, 100.0f)];
//        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
//        view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = [_items[index] stringValue];
    if (index%2==1) {
        view.backgroundColor = [UIColor blueColor];
    }else {
        view.backgroundColor = [UIColor greenColor];
    }

    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"index = %ld",(long)index);
    
    
//    UIView *view =  [carousel itemViewAtIndex:index];
//    view.backgroundColor = [UIColor whiteColor];
    
//    UIView *view_last =  [carousel itemViewAtIndex:index+1];
//    view_last.backgroundColor = [UIColor greenColor];
//
//    UIView *view_next =  [carousel itemViewAtIndex:index-1];
//    view_next.backgroundColor = [UIColor greenColor];
//
//    UIView *view_last_plus =  [carousel itemViewAtIndex:index+2];
//    view_last_plus.backgroundColor = [UIColor blueColor];
//
//    UIView *view_next_plus =  [carousel itemViewAtIndex:index-2];
//    view_next_plus.backgroundColor = [UIColor blueColor];
    
}


- (NSInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel {
    return 4;//[_items count];
}
- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80.0f, 100.0f)];
//        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        //        view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
        
    }
    
    
    if (index%2==1) {
        view.backgroundColor = [UIColor blueColor];
    }else {
        view.backgroundColor = [UIColor greenColor];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = @"00";//[_items[index] stringValue];
    view.userInteractionEnabled = NO;
    
    return view;
}


- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    NSLog(@"___3 %lu",carousel.currentItemIndex);
    
    
    
    UIView *view =  [carousel itemViewAtIndex:self.remeberIndex];
    view.backgroundColor =self.remeberColor;
    
    
    // 当前选中的cell之前的颜色
    UIView *remeberColorView =  [carousel itemViewAtIndex:carousel.currentItemIndex];
    self.remeberColor = remeberColorView.backgroundColor;
    self.remeberIndex = carousel.currentItemIndex;
    
    
    
    remeberColorView.backgroundColor = [UIColor whiteColor];
//    self.selectView = carousel.currentItemView;
}

//-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform{
//    static CGFloat max_sacle = 1.0f;
//    static CGFloat min_scale = 0.8f;
//    if (offset <= 1 && offset >= -1) {
//        float tempScale = offset < 0 ? 1+offset : 1-offset;
//        float slope = (max_sacle - min_scale) / 1;
//
//        CGFloat scale = min_scale + slope*tempScale;
//        transform = CATransform3DScale(transform, scale, scale, 1);
//    }else{
//        transform = CATransform3DScale(transform, min_scale, min_scale, 1);
//    }
//
////    return CATransform3DTranslate(transform, offset * self.filmCarousel.itemWidth * 1.4, 0.0, 0.0);
//}

//- (void)carouselWillBeginScrollingAnimation:(iCarousel *)carousel {
//
//}
//- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel {
//
//}
//- (void)carouselDidScroll:(iCarousel *)carousel {
//
//}
//- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
//
//}
//- (void)carouselWillBeginDragging:(iCarousel *)carousel {
//
//}
//- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate {
//
//}
//- (void)carouselWillBeginDecelerating:(iCarousel *)carousel {
//
//}
//- (void)carouselDidEndDecelerating:(iCarousel *)carousel {
//
//}
@end
