//
//  TSMainFriCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-30.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMainFriCell.h"
#import "MsgChat.h"

#import "UIImageView+AFNetworking.h"

//首页 朋友发布的消息
@implementation TSMainFriCell

@synthesize msgReply = _msgReply;
@synthesize mainDic = _mainDic;
@synthesize replyTextLabel;
@synthesize timeTextLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    if (self) {
        // Initialization code
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
        self.detailTextLabel.numberOfLines = 0;
        //跟显示风格有关系，如果默认的几个显示风格里没有自己想要的可自定义
        self.replyTextLabel = [[UILabel alloc] init];
        self.replyTextLabel.font = [UIFont systemFontOfSize:12.0f];
        self.replyTextLabel.text = @"匿名：跟显示风格有关系，如果默认的几个显示风格里没有自己想要的可自定义";
        //self.replyTextLabel.textAlignment = UITextAlignmentLeft;
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
        
        
    }
    
   return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateMsgReplyDic:(NSDictionary *)mainDic
{
    
    _msgReply.imageURL = [mainDic objectForKey:@"headUrl"];
    _msgReply.name = [mainDic objectForKey:@"name"];
    _msgReply.content = [mainDic objectForKey:@"sex"];
    _msgReply.sex = [mainDic objectForKey:@"sex"];
    _msgReply.time = [mainDic objectForKey:@"sex"];
    
    self.textLabel.text = [mainDic objectForKey:@"name"];
    //self.detailTextLabel.text = _msgReply.content;
    //self.replyTextLabel.text = _msgReply.time;
    [self.imageView setImageWithURL:[NSURL URLWithString:[mainDic objectForKey:@"headUrl"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithMsgReply:(NSDictionary *)mainDic
{
    CGSize sizeToFit = [[mainDic objectForKey:@"name"] sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
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
    detailTextLabelFrame.size.height = [[self class] heightForCellWithMsgReply:self.mainDic] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
    
    CGRect replyTextLabelFrame = CGRectOffset(self.detailTextLabel.frame, -50.0f, 30.0f);
    replyTextLabelFrame.size.height = 25.0f;
    replyTextLabelFrame.size.width = 250.0f;
    self.replyTextLabel.frame = replyTextLabelFrame;
    
}
@end
