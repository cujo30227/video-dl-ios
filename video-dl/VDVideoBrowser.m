#import <MediaPlayer/MediaPlayer.h>

#import "VDVideoBrowser.h"
#import "VDVideoDL.h"

@implementation VDVideoBrowser

-(id)initWithNibName:(NSString *)name bundle:(NSBundle *)bundle
{
	self = [super initWithNibName:name bundle:bundle];
	if (self) { 
		videos_folders = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[VDVideoDL videosFolder] error:nil];
		videos = [NSMutableDictionary dictionary];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.title = @"Videos";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// TODO: separate in groups sorted alphabetically
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [videos_folders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"video-cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

	VDVideo *info = [self videoInfoForIndexPath:indexPath];
	cell.textLabel.text = info.title;
	cell.detailTextLabel.text = info.description;
	cell.imageView.image = [UIImage imageWithContentsOfFile:info.thumbnailPath];
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	VDVideo *video = [self videoInfoForIndexPath:indexPath];
	NSURL *url = [NSURL fileURLWithPath:video.videoPath];
	MPMoviePlayerViewController *player =
	[[MPMoviePlayerViewController alloc] initWithContentURL:url];
	[self presentMoviePlayerViewControllerAnimated:player];
}

#pragma mark Custom methods

-(VDVideo *)videoInfoForIndexPath:(NSIndexPath *)indexPath
{
	return [self videoInfoForVideo:[videos_folders objectAtIndex:[indexPath indexAtPosition:1]]];
}

-(VDVideo *)videoInfoForVideo:(NSString *)videoFolder
{
	NSString *fullFolderPath = [[VDVideoDL videosFolder] stringByAppendingPathComponent:videoFolder];
	VDVideo *video = [videos objectForKey:videoFolder];
	if (video == nil) {
		video = [[VDVideo alloc] initWithFolder:fullFolderPath];
	}
	return video;
}

@end
