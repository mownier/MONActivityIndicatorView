//
//  MONViewController.m
//  MONActivityIndicatorViewDemo
//
//  Created by Mounir Ybanez on 4/24/14.
//  Copyright (c) 2014 Moaner. All rights reserved.
//

#import "MONViewController.h"
#import "MONActivityIndicatorView.h"

@interface MONViewController () <MONActivityIndicatorViewDelegate>

@end

@implementation MONViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  MONActivityIndicatorView *indicatorView = [[MONActivityIndicatorView alloc] initWithFrame:CGRectMake(10, 40, 200, 100)];
  indicatorView.numberOfCircles = 4;
  indicatorView.delegate = self;
  indicatorView.radius = 8;
  [self.view addSubview:indicatorView];
  [self.view addConstraint:
   [NSLayoutConstraint constraintWithItem:indicatorView
                                attribute:NSLayoutAttributeCenterX
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self.view
                                attribute:NSLayoutAttributeCenterX
                               multiplier:1.0f
                                 constant:0.0f]];
  [self.view addConstraint:
   [NSLayoutConstraint constraintWithItem:indicatorView
                                attribute:NSLayoutAttributeCenterY
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self.view
                                attribute:NSLayoutAttributeCenterY
                               multiplier:1.0f
                                 constant:0.0f]];
  
  [indicatorView startAnimating];
  [NSTimer scheduledTimerWithTimeInterval:5.0
                                   target:indicatorView
                                 selector:@selector(stopAnimating)
                                 userInfo:nil
                                  repeats:NO];
  [NSTimer scheduledTimerWithTimeInterval:7.0
                                   target:indicatorView
                                 selector:@selector(startAnimating)
                                 userInfo:nil
                                  repeats:NO];
}

#pragma mark -
#pragma mark - MONActivityIndicatorViewDelegate Methods

- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index {
  CGFloat red   = (arc4random() % 256)/255.0;
  CGFloat green = (arc4random() % 256)/255.0;
  CGFloat blue  = (arc4random() % 256)/255.0;
  CGFloat alpha = 1.0f;
  return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


@end
