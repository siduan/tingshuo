

#import <UIKit/UIKit.h>

@interface ReplyCustomCell : UITableViewCell{
	
}
@property (nonatomic, retain) UILabel      *nameLabel;
//@property (nonatomic, retain) UILabel      *contentLabel;
@property (nonatomic, retain) UILabel      *dateLabel;
@property (nonatomic, retain) UIView      *contentSubView;

- (void)updateContents:(NSString *)name Content:(NSString *)content Time:(NSString *)time;
@end
