# MONActivityIndicatorView

MONActivityIndicatorView is an awesome custom activity indicator view for iOS.

![MONActivityIndicatorView] (https://raw.github.com/mownier/MONActivityIndicatorView/master/MONActivityIndicatorView-Screenshot.gif)

## Installation

### Manual Install
* Copy and add the files `MONActivityIndicatorView.h` and `MONActivityIndicatorView.m` to your project.
* Add the **QuartzCore** framework to your project.
* Then do, `import MONActivityIndicatorView.h`

### From CocoaPods
* Add `pod 'MONActivityIndicatorView'` to your Podfile.
* Then `pod install` in the terminal.

## Usage

### Initialization
``` objective-c
- (void)viewDidLoad {
  [super viewDidLoad];

  MONActivityIndicatorView *indicatorView = [[MONActivityIndicatorView alloc] init];
  [self.view addSubview:indicatorView];
}
```

### Toggling Indicator
``` objective-c
[indicatorView startAnimating];
[indicatorView stopAnimating];
```


## Customization

### Default Property Values
* Animation delay           : `delay           = 0.2`
* Animation duration        : `duration        = 0.8`
* Number of circles         : `numberOfCircles = 5`
* Circle's radius           : `radius          = 10`
* Circle's internal spacing : `internalSpacing = 5`
* Circle's background Color : `defaultColor    = [UIColor lightGrayColor]`


### Custom Property Values
``` objective-c
- (void)viewDidLoad {
  [super viewDidLoad];
  
  MONActivityIndicatorView *indicatorView = [[MONActivityIndicatorView alloc] init];
  indicatorView.numberOfCircles = 3;
  indicatorView.radius = 20;
  indicatorView.internalSpacing = 3;
  indicatorView.duration = 0.5;
  indicatorView.delay = 0.5
  indicatorView.center = self.view.center;
  [self.view addSubview:indicatorView];
  [indicatorView startAnimating];
}
```

### Custom Circle's Background Color
First, assign the `MONActivityIndicatorViewDelegate` protocol to a view controller. Then, implement the method `activityIndicatorView:circleBackgroundColorAtIndex:`
``` objective-c
@interface ViewController : UIViewController <MONActivityIndicatorViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  MONActivityIndicatorView *indicatorView = [[MONActivityIndicatorView alloc] init];
  indicatorView.delegate = self;
  indicatorView.numberOfCircles = 3;
  indicatorView.radius = 20;
  indicatorView.internalSpacing = 3;
  indicatorView.duration = 0.5;
  indicatorView.delay = 0.5
  indicatorView.center = self.view.center;
  [self.view addSubview:indicatorView];
  [indicatorView startAnimating];
}

- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index {
  // For a random background color for a particular circle
  CGFloat red   = (arc4random() % 256)/255.0;
  CGFloat green = (arc4random() % 256)/255.0;
  CGFloat blue  = (arc4random() % 256)/255.0;
  CGFloat alpha = 1.0f;
  return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
```



