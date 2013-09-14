#import <UIKit/UIKit.h>

#import "VDVideoDL.h"
#import "VDDownloadViewController.h"

@interface VDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property VDDownloadViewController *downloadViewController;

+(VDVideoDL *)currentVideoDL;

@end
