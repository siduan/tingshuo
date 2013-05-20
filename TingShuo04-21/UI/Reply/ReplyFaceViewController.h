

#import <UIKit/UIKit.h>

@class ReplyViewController;


@interface ReplyFaceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
	NSMutableArray            *_phraseArray;
	ReplyViewController        *_chatViewController;
    
    
}

@property (retain, nonatomic) IBOutlet UIScrollView *faceScrollView;
@property (nonatomic, retain) NSMutableArray            *phraseArray;
@property (nonatomic, retain) ReplyViewController        *chatViewController;

-(IBAction)dismissMyselfAction:(id)sender;
- (void)showEmojiView;
@end
