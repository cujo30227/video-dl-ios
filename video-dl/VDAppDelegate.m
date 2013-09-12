#import "VDAppDelegate.h"
#import "VDVideoBrowser.h"


@implementation VDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
	VDVideoBrowser *videoBrowser = [[VDVideoBrowser alloc] initWithNibName:@"VDVideoBrowser" bundle:nil];
	UINavigationController *videoBrowserNavigationController = [[UINavigationController alloc] initWithRootViewController:videoBrowser];
	self.window.rootViewController = videoBrowserNavigationController;

	self.videodl = [[VDVideoDL alloc] init];

    return YES;
}

@end
