//  Copyright (c) 2014 Google. All rights reserved.

#import "ViewController.h"

#import "DFPBannerView.h"
#import "GADRequest.h"

@interface ViewController () <GADBannerViewDelegate>
@property (nonatomic, strong) DFPBannerView *bannerView;
@end

@implementation ViewController


- (void)loadBanner {
    self.bannerView = [[DFPBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    self.bannerView.delegate = self;
    self.bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.bannerView];
    
    NSDictionary *views = @{@"banner":self.bannerView};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[banner(50)]-0-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[banner(320)]-0-|" options:0 metrics:nil views:views]];
    
    // Replace this ad unit ID with your own ad unit ID.
    self.bannerView.adUnitID = @"/6499/example/banner";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}

- (void)clearBanner {
    if (self.bannerView) {
        [self.bannerView removeFromSuperview];
        self.bannerView.delegate = nil;
        self.bannerView = nil;
    }
}

- (void)viewDidLoad {
  [super viewDidLoad];
    self.bannerView = nil;
}

- (void)clearAndLoadBanner {
    [self clearBanner];
    [self loadBanner];
}

- (IBAction)buttonPush:(id)sender {
    [self clearAndLoadBanner];
}

- (IBAction)button100Push:(id)sender {
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSUInteger times = 0;
        while (times < 100) {
            ++times;
            
            dispatch_sync(dispatch_get_main_queue(), ^(void) {
                [weakSelf clearAndLoadBanner];
            });
            
            [NSThread sleepForTimeInterval:1.0f];
        }
    });
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
