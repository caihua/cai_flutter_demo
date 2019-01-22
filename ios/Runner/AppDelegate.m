#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
//    NSOperation *a = [[NSOperation alloc]init];
//    NSLog(@"%p",&a);
//    
//    NSOperationQueue *q = [NSOperationQueue currentQueue];
//    [q addOperation:a];
    
    FlutterBasicMessageChannel *x;//这个东西怎么用
    
    
    FlutterViewController *vc = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel *batteryMethodChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/battery" binaryMessenger:vc];
    
    [batteryMethodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"getBatteryLevel_iOS" isEqualToString:call.method]) {
            NSString *msg1 = call.arguments[0];
            
            int bl = [self getBL];
            if (bl == -1) {
                result ([FlutterError errorWithCode:@"UNAVAILABLE" message:[NSString stringWithFormat:@"电池信息不可用！%@",msg1] details:nil]);
            }else{
                result([NSString stringWithFormat:@"%d -arg1:%@",bl,msg1]);
            }
        }else{
            result(FlutterMethodNotImplemented);
        }
    }];
    
    FlutterEventChannel *chargingEventChannel = [FlutterEventChannel eventChannelWithName:@"samples.flutter.io/charging" binaryMessenger:vc];
    [chargingEventChannel setStreamHandler:self];//通过这个来区分不同的回调函数
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    if (events) {
        NSMutableDictionary * params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:@"test1" forKey:@"ataNo"];
        [params setValue:@"test2" forKey:@"docType"];
        [params setValue:@"test3" forKey:@"aircraftNo"];
        [params setValue:@"我是标题" forKey:@"title"];
        events(params); //发送数据
    }
    return nil;
}
- (FlutterError *)onCancelWithArguments:(id)arguments{
    return nil;
}
-(int)getBL{
    UIDevice *device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    }else{
        return (int)(device.batteryLevel * 100);
    }
}

@end
