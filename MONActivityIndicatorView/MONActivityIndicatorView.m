//
//  MONActivityIndicatorView.m
//
//  Created by Mounir Ybanez on 4/24/14.
//

#import <QuartzCore/QuartzCore.h>
#import "MONActivityIndicatorView.h"

@interface MONActivityIndicatorView ()

/** The default color of each circle. */
@property (strong, nonatomic) UIColor *defaultColor;

/** The container of the circles. */
@property (strong, nonatomic) UIView *contentView;

/** An indicator whether the activity indicator view is animating. */
@property (readwrite, nonatomic) BOOL isAnimating;

/**
 Sets up default values
 */
- (void)setupDefaults;

/**
 Adds circles.
 */
- (void)addCircles;

/**
 Removes circles.
 */
- (void)removeCircles;

/**
 Creates the circle view.
 @param radius The radius of the circle.
 @param color The background color of the circle.
 @param positionX The x-position of the circle in the contentView.
 @return The circle view.
 */
- (UIView *)createCircleWithRadius:(CGFloat)radius color:(UIColor *)color positionX:(CGFloat)x;

/**
 Creates the animation of the circle.
 @param duration The duration of the animation.
 @param delay The delay of the animation
 @return The animation of the circle.
 */
- (CABasicAnimation *)createAnimationWithDuration:(CGFloat)duration delay:(CGFloat)delay;

@end

@implementation MONActivityIndicatorView

#pragma mark -
#pragma mark - Initializations

- (id)init {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    [self setupDefaults];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupDefaults];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self setupDefaults];
  }
  return self;
}

#pragma mark -
#pragma mark - Private Methods

- (void)setupDefaults {
  self.translatesAutoresizingMaskIntoConstraints = NO;
  self.numberOfCircles = 5;
  self.internalSpacing = 20;
  self.radius = 10;
  self.delay = 0.2;
  self.duration = 0.8;
  self.defaultColor = [UIColor lightGrayColor];
}

- (UIView *)createCircleWithRadius:(CGFloat)radius
                          color:(UIColor *)color
                      positionX:(CGFloat)x {
  UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(x, 0, radius * 2, radius * 2)];
  circle.backgroundColor = color;
  circle.layer.cornerRadius = radius;
  return circle;
}

- (CABasicAnimation *)createAnimationWithDuration:(CGFloat)duration delay:(CGFloat)delay {
  CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  anim.delegate = self;
  anim.fromValue = [NSNumber numberWithFloat:0.0f];
  anim.toValue = [NSNumber numberWithFloat:1.0f];
  anim.autoreverses = YES;
  anim.duration = duration;
  anim.removedOnCompletion = NO;
  anim.beginTime = CACurrentMediaTime()+delay;
  anim.repeatCount = INFINITY;
  anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  return anim;
}

- (void)addCircles {
  self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
  for (NSUInteger i = 0; i < self.numberOfCircles; i++) {
    UIView *circle = [self createCircleWithRadius:self.radius color:[UIColor blueColor] positionX:(i * self.internalSpacing)];
    UIColor *color = nil;
    if (self.delegate && [self.delegate respondsToSelector:@selector(activityIndicatorView:circleBackgroundColorAtIndex:)]) {
      color = [self.delegate activityIndicatorView:self circleBackgroundColorAtIndex:i];
    }
    circle.backgroundColor = (color == nil) ? self.defaultColor : color;
    circle.transform = CGAffineTransformMakeScale(0, 0);
    [circle.layer addAnimation:[self createAnimationWithDuration:self.duration delay:(i * self.delay)] forKey:@"scale"];
    [self.contentView addSubview:circle];
    // Last circle
    if (i == self.numberOfCircles - 1) {
      CGRect frame = self.contentView.frame;
      frame.size.height = circle.frame.size.height;
      frame.size.width = CGRectGetMaxX(circle.frame);
      self.contentView.frame = frame;
    }
  }
  [self addSubview:self.contentView];
  [self addConstraint:
   [NSLayoutConstraint constraintWithItem:self.contentView
                                attribute:NSLayoutAttributeCenterX
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterX
                               multiplier:1.0f
                                 constant:0.0f]];
  [self addConstraint:
   [NSLayoutConstraint constraintWithItem:self.contentView
                                attribute:NSLayoutAttributeCenterY
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterY
                               multiplier:1.0f
                                 constant:0.0f]];

}

- (void)removeCircles {
  [self.contentView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj removeFromSuperview];
  }];
  self.contentView = nil;
}

#pragma mark -
#pragma mark - Public Methods

- (void)startAnimating {
  if (!self.isAnimating) {
    [self addCircles];
    self.hidden = NO;
    self.isAnimating = YES;
  }
}

- (void)stopAnimating {
  if (self.isAnimating) {
    [self removeCircles];
    self.hidden = YES;
    self.isAnimating = NO;
  }
}

@end
