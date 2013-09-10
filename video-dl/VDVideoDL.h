#import <Foundation/Foundation.h>

#import "Python.h"

@interface VDVideoDL : NSObject
{
	PyObject *vdl;
	NSString *youtube_dl_version;
}

-(void)testDownload;

-(PyObject *)progressHookWithSelf:(PyObject *)s AndArgs:(PyObject *)args;

-(void)downloadFromUrl:(NSString *)url;

@end
