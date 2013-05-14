//
//  TSMsgChatCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-23.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMsgChatCell.h"
#import "MsgChat.h"

#import "UIImageView+AFNetworking.h"
//消息 --聊天栏
@implementation TSMsgChatCell{
//@private
  //  __strong MsgChat *_msgChat;
}

@synthesize msgChat = _msgChat;
@synthesize msgChatDic = _msgChatDic;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines = 0;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)setMsgChat:(MsgChat *)msgChat
{
    
    
    
}

- (void)updateMsgChatDic:(NSDictionary *)msgChatDic
{
    //self.msgChatDic = msgChatDic;
    _msgChat.imageURL = [[[msgChatDic objectForKey:@"weatherIconUrl"] objectAtIndex:0] objectForKey:@"value"];
    _msgChat.name = [msgChatDic objectForKey:@"precipMM"];
    _msgChat.content = [[[msgChatDic objectForKey:@"weatherDesc"] objectAtIndex:0] objectForKey:@"value"];
    _msgChat.sex = [msgChatDic objectForKey:@"precipMM"];
    _msgChat.time = [msgChatDic objectForKey:@"precipMM"];
    
    self.textLabel.text = @"陈默默";
    self.detailTextLabel.text = @"五中gossipgirl，碎了一地";
    [self.imageView setImageWithURL:[NSURL URLWithString:_msgChat.imageURL] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithMsgChat:(NSDictionary *)msgChatDic
{
    CGSize sizeToFit = [[msgChatDic objectForKey:@"precipMM"] sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
    return fmaxf(70.0f, sizeToFit.height + 45.0f);
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    //改变文本显示大小的代码
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    detailTextLabelFrame.size.height = [[self class] heightForCellWithMsgChat:self.msgChatDic] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
