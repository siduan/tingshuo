//
//  TSMainFriQunCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-30.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMainFriQunCell.h"
#import "MsgChat.h"

#import "UIImageView+AFNetworking.h"

//首页朋友加入的群
@implementation TSMainFriQunCell

@synthesize msgReply = _msgReply;
@synthesize mainDic = _mainDic;
@synthesize joinInLabel;//“加入了”字样
@synthesize timeTextLabel;//时间
@synthesize qunImg;//群图片
@synthesize qunIntroTextLabel;//群介绍


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    if (self) {
        // Initialization code
        //好友的名字
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.textColor = [UIColor darkGrayColor];
        
        self.detailTextLabel.font = [UIFont systemFontOfSize:15.0f];
        self.detailTextLabel.textColor = [UIColor darkGrayColor];
        self.detailTextLabel.numberOfLines = 1;
        
        self.joinInLabel = [[UILabel alloc] init];
        self.joinInLabel.text = @"加入了";
        self.joinInLabel.textColor = [ UIColor redColor];
        self.joinInLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        [self addSubview:self.joinInLabel];
        
        //跟显示风格有关系，如果默认的几个显示风格里没有自己想要的可自定义
        self.qunIntroTextLabel = [[UILabel alloc] init];
        self.qunIntroTextLabel.text = @"群组说明：我跟你说，这个群不是吹出来的，是盖出来的。";
        self.qunIntroTextLabel.textColor = [ UIColor darkGrayColor];
        self.qunIntroTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.qunIntroTextLabel.numberOfLines = 0;
        [self addSubview:self.qunIntroTextLabel];
        
        self.timeTextLabel = [[UILabel alloc] init];
        self.timeTextLabel.text = @"今天 16:45";
        self.timeTextLabel.textColor = [ UIColor brownColor];
        self.timeTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.timeTextLabel.numberOfLines = 1;
        [self addSubview:self.timeTextLabel];
        
        self.qunImg = [[UIImageView alloc] init];
        [self.qunImg setImageWithURL:[NSURL URLWithString:@"http://www.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0008_clear_sky_night.png"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        [self addSubview:self.qunImg];
        
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
    //self.qunIntroTextLabel.text = _msgReply.time;
    [self.imageView setImageWithURL:[NSURL URLWithString:[mainDic objectForKey:@"headUrl"]] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
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
    self.joinInLabel.frame = CGRectMake(200.0f, 10.0f, 50.0f, 20.0f);
    self.timeTextLabel.frame = CGRectMake(250.0f, 10.0f, 60.0f, 20.0f);
    self.qunImg.frame = CGRectMake(250.0f, 32.0f, 50.0f, 50.0f);
    
    //改变文本显示大小的代码
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    detailTextLabelFrame.size.height = [[self class] heightForCellWithMsgReply:self.mainDic] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
    
    CGRect replyTextLabelFrame = CGRectOffset(self.detailTextLabel.frame, -50.0f, 30.0f);
    replyTextLabelFrame.size.height = 25.0f;
    replyTextLabelFrame.size.width = 220.0f;
    self.qunIntroTextLabel.frame = replyTextLabelFrame;
    
}

@end
