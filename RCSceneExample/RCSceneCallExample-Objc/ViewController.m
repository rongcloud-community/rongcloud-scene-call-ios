//
//  ViewController.m
//  RCSceneCallExample-Objc
//
//  Created by johankoi on 2022/5/9.
//

#import "ViewController.h"
#import "RCSceneCallExample_Objc-Swift.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <RCSceneCall.h>
#import <RongCloudOpenSource/RCIM.h>

@interface ViewController ()

@property (strong, nonatomic) SceneCallBridge *sceneCallBridge;


@end

@implementation ViewController

- (SceneCallBridge *)sceneCallBridge {
    if (!_sceneCallBridge) {
        _sceneCallBridge = [[SceneCallBridge alloc] init];
    }
    return _sceneCallBridge;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RCSceneCall";
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self connection];
}


- (IBAction)show:(id)sender {
    [self.sceneCallBridge showDialVcFromVc:self];
}
- (void)connection {
    if ([[RCIM sharedRCIM] getConnectionStatus] == ConnectionStatus_Connected) {
        return;
    }
    NSString *rcToken = [self.sceneCallBridge userDefaultsSavedToken];
    if (rcToken.length == 0) {
        [self performSegueWithIdentifier:@"Login" sender:nil];
        return;
    }
    [[RCIM sharedRCIM] initWithAppKey:[AppConfigs getRCKey]];
    [[RCIM sharedRCIM] connectWithToken:rcToken dbOpened:^(RCDBErrorCode code) {
        NSLog(@"RCIM db open failed: %zd",code);
    } success:^(NSString *userId) {
        NSLog(@"userId: %@",userId);
         
    } error:^(RCConnectErrorCode errorCode) {
        NSLog(@"RCIM connect failed: %zd", errorCode);
    }];
}

@end
