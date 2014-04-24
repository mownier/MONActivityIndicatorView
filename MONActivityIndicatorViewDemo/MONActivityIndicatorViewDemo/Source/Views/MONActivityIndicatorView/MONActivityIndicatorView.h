//
//  MONActivityIndicatorView.h
//  MONActivityIndicatorViewDemo
//
//  Created by Mounir Ybanez on 4/24/14.
//  Copyright (c) 2014 Moaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MONActivityIndicatorViewDelegate;

/**
 */
@interface MONActivityIndicatorView : UIView

/**
 */
@property (readwrite, nonatomic) NSUInteger numberOfCircles;

/**
 */
@property (readwrite, nonatomic) CGFloat internalSpacing;

/**
 */
@property (readwrite, nonatomic) CGFloat radius;

/**
 */
@property (readwrite, nonatomic) CGFloat delay;

/**
 */
@property (readwrite, nonatomic) CGFloat duration;

/**
 */
@property (strong, nonatomic) id<MONActivityIndicatorViewDelegate> delegate;


/**
 */
- (void)startAnimating;

/**
 */
- (void)stopAnimating;

@end

/**
 */
@protocol MONActivityIndicatorViewDelegate <NSObject>

@optional

/**
 */
- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index;

@end
