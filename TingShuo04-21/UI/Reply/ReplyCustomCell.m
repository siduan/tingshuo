

#import "ReplyCustomCell.h"


@implementation ReplyCustomCell

@synthesize nameLabel = _nameLabel;
//@synthesize contentLabel = _contentLabel;
@synthesize contentSubView = _contentSubView;
@synthesize dateLabel = _dateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        
        _nameLabel = [[UILabel alloc] init];
        
        _nameLabel.textColor = [ UIColor blueColor];
        _nameLabel.font = [ UIFont fontWithName: @"Arial" size: 15.0 ];
        _nameLabel.numberOfLines = 1;
        [self addSubview:_nameLabel];
        
        //_contentLabel = [[UILabel alloc] init];
        //_contentLabel.textColor = [ UIColor blackColor];
        //_contentLabel.font = [ UIFont fontWithName: @"Arial" size: 12.0 ];
        //_contentLabel.numberOfLines = 1;
        //[self addSubview:_contentLabel];
        
        _contentSubView = [[UIView alloc] init];
        [self addSubview:_contentSubView];
        
        _dateLabel = [[UILabel alloc] init];
        
        _dateLabel.textColor = [ UIColor brownColor];
        _dateLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        _dateLabel.numberOfLines = 1;
        [self addSubview:_dateLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

}

- (void)updateContents:(NSString *)name Content:(NSString *)content Time:(NSString *)data
{
    //_nameLabel.text = @"某男：";
    //_contentLabel.text = @"今天自挂东南枝，今天自挂东南枝，今天自挂东南枝";
    _dateLabel.text = @"今天 16:45";
    _nameLabel.text = name;
    //_contentLabel.text = content;
    //_dateLabel.text = data;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(10.0f, 10.0f, 30.0f, 20.0f);
    //_contentLabel.frame = CGRectMake(40.0f, 10.0f, 240.0f, 20.0f);
    _dateLabel.frame = CGRectMake(10.0f, 30.0f, 60.0f, 20.0f);
    _contentSubView.frame = CGRectMake(40.0f, 10.0f, 240.0f, 20.0f);
}

- (void)dealloc {
    [_nameLabel release];
    //[_contentLabel release];
    [_contentSubView release];
	[_dateLabel release];
    [super dealloc];
}


@end
