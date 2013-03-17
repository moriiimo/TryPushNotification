//
//  ViewController.m
//  PushNotification
//
//  Created by moriiimo on 2013/03/17.
//  
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");

    // デフォルトの通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知センターに通知要求を登録する
    // この例だと、通知センターに"Tuchi"という名前の通知がされた時に、
    // updateBadgeCountメソッドを呼び出すという通知要求の登録を行っている。
    [nc addObserver:self selector:@selector(updateBadgeCount:) name:@"Tuchi" object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateBadgeCount: (NSNotification *)nc
{
    NSDictionary *userInfo = nc.userInfo;
    NSString *badgeCount = [[userInfo objectForKey:@"badgeCount"]stringValue];
    [self.badge setText:badgeCount];
    
    // アイコンのバッジの数を０にしたいときは以下を使う。
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

@end
