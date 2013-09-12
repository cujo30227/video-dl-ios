#import "VDVideo.h"

@implementation VDVideo

@synthesize info_dict;

-(id)initWithFolder:(NSString *)folder
{
	self = [super init];
	if (self) {
		NSString *video_name = [folder lastPathComponent];
		self.videoPath = [folder stringByAppendingPathComponent:video_name];
		NSString *json_filename = [self.videoPath stringByAppendingPathExtension:@"info.json"];
		NSData *json_data = [NSData dataWithContentsOfFile:json_filename];
		self.info_dict = [NSJSONSerialization JSONObjectWithData:json_data options:0 error:nil];
		self.title = [info_dict objectForKey:@"title"];
		self.id = [info_dict objectForKey:@"id"];
		self.description = [info_dict objectForKey:@"description"];
		

		NSString *thumb_url = [info_dict objectForKey:@"thumbnail"];
		if (thumb_url == nil) {
			self.thumbnailPath = nil;
		} else {
			// this is how youtube-dl decides the name of the thumbnail
			NSString *thumb_ext = [[NSURL URLWithString:thumb_url] pathExtension];
			self.thumbnailPath = [[self.videoPath stringByDeletingPathExtension] stringByAppendingPathExtension:thumb_ext];
		}
	}
	return self;
}

@end
