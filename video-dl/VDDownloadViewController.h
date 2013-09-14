#import <UIKit/UIKit.h>
#import "VDVideoDL.h"

@interface VDDownloadViewController : UIViewController <UITextFieldDelegate>

@property  VDVideoDL *video_dl;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

-(void)downloadFromUrl:(NSString *)url;

@end
