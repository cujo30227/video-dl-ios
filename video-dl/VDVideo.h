#import <Foundation/Foundation.h>

@interface VDVideo : NSObject

@property NSDictionary *info_dict;
@property NSString *title;
@property NSString *id;
@property NSString *description;
@property NSString *videoPath;
@property NSString *thumbnailPath;

-(id)initWithFolder:(NSString *)folder;

@end
