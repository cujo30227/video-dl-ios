#import "VDAppDelegate.h"
#import "VDVideoBrowser.h"


@implementation VDAppDelegate

@synthesize downloadViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];

	downloadViewController = [[VDDownloadViewController alloc] initWithNibName:@"VDDownloadViewController" bundle:nil];
	downloadViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:0];

	VDVideoBrowser *videoBrowser = [[VDVideoBrowser alloc] initWithNibName:@"VDVideoBrowser" bundle:nil];
	UINavigationController *videoBrowserNavigationController = [[UINavigationController alloc] initWithRootViewController:videoBrowser];
	videoBrowserNavigationController.tabBarItem.title = @"Browse videos";

	UITabBarController *tabController = [[UITabBarController alloc] init];
	tabController.viewControllers = @[downloadViewController, videoBrowserNavigationController];
	self.window.rootViewController = tabController;

    return YES;
}

+(VDVideoDL *)currentVideoDL
{
	return [[((VDAppDelegate *)[[UIApplication sharedApplication] delegate]) downloadViewController] video_dl];
}

@end
