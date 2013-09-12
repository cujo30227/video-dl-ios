#import <UIKit/UIKit.h>

#import "VDVideo.h"

@interface VDVideoBrowser : UITableViewController
{
	NSArray *videos_folders;
	NSMutableDictionary *videos;
}

-(VDVideo *)videoInfoForVideo:(NSString *)videoFolder;

@end
