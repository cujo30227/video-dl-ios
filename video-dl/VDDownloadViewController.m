#import "VDDownloadViewController.h"

@implementation VDDownloadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.urlTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.urlTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	self.urlTextField.enablesReturnKeyAutomatically = YES;
	self.urlTextField.keyboardType = UIKeyboardTypeURL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // TODO: finalize the python interpreter?
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	NSLog(@"%@", textField.text);
	[textField resignFirstResponder];
	[self downloadFromUrl:textField.text];
	return NO;
}

-(void)downloadFromUrl:(NSString *)url
{
	if (self.video_dl == nil) {
		self.video_dl = [[VDVideoDL alloc] init];
	}
	[self.video_dl performSelectorInBackground:@selector(downloadFromUrl:) withObject:url];

}

@end
