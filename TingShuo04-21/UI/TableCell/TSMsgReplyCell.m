//
//  TSMsgReplyCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-28.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMsgReplyCell.h"
#import "MsgChat.h"

#import "UIImageView+AFNetworking.h"

@implementation TSMsgReplyCell{
    
}

@synthesize msgReply = _msgReply;
@synthesize msgReplyDic = _msgReplyDic;
@synthesize replyTextLabel;
@synthesize timeTextLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textColor = [UIColor darkGrayColor];
    
    self.detailTextLabel.font = [UIFont systemFontOfSize:15.0f];
    self.detailTextLabel.textColor = [UIColor blackColor];
    self.detailTextLabel.numberOfLines = 0;
    //跟显示风格有关系，如果默认的几个显示风格里没有自己想要的可自定义
    self.replyTextLabel = [[UILabel alloc] init];
    self.replyTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.replyTextLabel.text = @"回复：跟显示风格有关系，如果默认的几个显示风格里没有自己想要的可自定义";
    self.replyTextLabel.textColor = [ UIColor darkGrayColor];
    self.replyTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    self.replyTextLabel.numberOfLines = 0;
    [self addSubview:self.replyTextLabel];
    
    self.timeTextLabel = [[UILabel alloc] init];
    self.timeTextLabel.text = @"今天 16:45";
    self.timeTextLabel.textColor = [ UIColor brownColor];
    self.timeTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    self.timeTextLabel.numberOfLines = 1;
    [self addSubview:self.timeTextLabel];
    
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMsgReply:(MsgChat *)msgReply
{
    
    
    
}

- (void)updateMsgReplyDic:(NSDictionary *)msgReplyDic
{

    _msgReply.imageURL = [[[msgReplyDic objectForKey:@"weatherIconUrl"] objectAtIndex:0] objectForKey:@"value"];
    _msgReply.name = [msgReplyDic objectForKey:@"weatherCode"];
    _msgReply.content = [[[msgReplyDic objectForKey:@"weatherDesc"] objectAtIndex:0] objectForKey:@"value"];
    _msgReply.sex = [msgReplyDic objectForKey:@"precipMM"];
    _msgReply.time = [msgReplyDic objectForKey:@"precipMM"];
    
    self.textLabel.text = @"陈默默";
    self.detailTextLabel.text = @"主题鲜明：五中gossipgirl，碎了一地";
    //self.replyTextLabel.text = _msgReply.time;
    [self.imageView setImageWithURL:[NSURL URLWithString:_msgReply.imageURL] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithMsgReply:(NSDictionary *)msgReplyDic
{
    CGSize sizeToFit = [[msgReplyDic objectForKey:@"precipMM"] sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
    return fmaxf(70.0f, sizeToFit.height + 75.0f);
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
    detailTextLabelFrame.size.height = [[self class] heightForCellWithMsgReply:self.msgReplyDic] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
    
    CGRect replyTextLabelFrame = CGRectOffset(self.detailTextLabel.frame, -50.0f, 30.0f);
    replyTextLabelFrame.size.height = 25.0f;
    replyTextLabelFrame.size.width = 300.0f;
    self.replyTextLabel.frame = replyTextLabelFrame;
    
}


@end
