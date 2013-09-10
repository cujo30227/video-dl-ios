#import "VDAppDelegate.h"


@implementation VDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
	self.window.rootViewController = [[UIViewController alloc] init];

	self.videodl = [[VDVideoDL alloc] init];

    return YES;
}

@end
