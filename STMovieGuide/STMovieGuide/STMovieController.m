//
//  STMovieController.m
//  huoying
//
//  Created by study on 2017/3/16.
//  Copyright © 2017年 Study. All rights reserved.
//

#import "STMovieController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import "ViewController.h"
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface STMovieController ()
@property (strong, nonatomic) MPMoviePlayerController *player;

@end

@implementation STMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpVideoPlayer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//设置视频
- (void)setUpVideoPlayer
{
    NSString *myFilePath = [[NSBundle mainBundle]pathForResource:@"Study"ofType:@"mov"];
    NSURL *movieURL = [NSURL fileURLWithPath:myFilePath];
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay = YES;
    [self.player setControlStyle:MPMovieControlStyleNone];
    self.player.repeatMode = MPMovieRepeatModeOne;
    [self.player.view setFrame:self.view.bounds];
    self.player.view.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    [self setUpLoginView];
}

- (void)setUpLoginView{
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    enterMainButton.alpha = 0;
    [self.player.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:1.0 animations:^{
        enterMainButton.alpha = 1.0;
    }];
}
- (void)enterMainAction:(UIButton *)btn {
    NSLog(@"进入应用");
    ViewController *lv = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lv];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    lv.navigationItem.title = @"StudyMoveGuide";
    lv.view.backgroundColor = RGBA(134, 216, 210, 0.5);
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
}


@end
