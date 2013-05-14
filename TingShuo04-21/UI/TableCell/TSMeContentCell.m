//
//  TSMeContentCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-6.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMeContentCell.h"
#import "MsgChat.h"

#import "UIImageView+AFNetworking.h"

//我 自己发的状态，包括回复
@implementation TSMeContentCell

@synthesize msgReply = _msgReply;
@synthesize mainDic = _mainDic;
@synthesize replyTextLabel;
@synthesize timeTextLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
        self.detailTextLabel.numberOfLines = 2;
        //跟显示风格有关系，如果默认的几个显示风格里没有自己想要的可自定义
        self.replyTextLabel = [[UILabel alloc] init];
        self.replyTextLabel.font = [UIFont systemFontOfSize:12.0f];
        //self.replyTextLabel.textAlignment = UITextAlignmentLeft;
        self.replyTextLabel.textColor = [ UIColor redColor ];
        self.replyTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.replyTextLabel.numberOfLines = 1;
        [self addSubview:self.replyTextLabel];
        
        self.timeTextLabel = [[UILabel alloc] init];
        self.timeTextLabel.textColor = [ UIColor brownColor];
        self.timeTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.timeTextLabel.numberOfLines = 1;
        [self addSubview:self.timeTextLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateContents:(NSArray *)conArr
{
    self.timeTextLabel.text = @"今天 16:45";
    
    self.textLabel.text = @"陈默默";
    self.detailTextLabel.text = @"我骑着一头小毛驴去上学，不小心甩了一身泥,hahahaha";
    self.replyTextLabel.text = @"匿名：跟显示风格有关系，如果默认的几个显示风格里没有自己想要的可自定义";
    [self.imageView setImageWithURL:[NSURL URLWithString:_msgReply.imageURL] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCell:(NSDictionary *)contentDic
{
    CGSize sizeToFit = [[contentDic objectForKey:@"name"] sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX)];
    
    return fmaxf(100.0f, sizeToFit.height + 100.0f);
}


#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    self.timeTextLabel.frame = CGRectMake(250.0f, 10.0f, 60.0f, 20.0f);
    
    //改变文本显示大小的代码
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    detailTextLabelFrame.size.height = [[self class] heightForCell:self.mainDic] - 40.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
    
    CGRect replyTextLabelFrame = CGRectOffset(self.detailTextLabel.frame, -50.0f, 45.0f);
    replyTextLabelFrame.size.height = 20.0f;
    replyTextLabelFrame.size.width = 300.0f;
    self.replyTextLabel.frame = replyTextLabelFrame;
    
}
@end
