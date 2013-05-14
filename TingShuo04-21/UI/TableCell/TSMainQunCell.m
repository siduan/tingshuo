//
//  TSMainQunCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-30.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMainQunCell.h"
#import "MsgChat.h"

#import "UIImageView+AFNetworking.h"

//首页 加入群组推送的消息
@implementation TSMainQunCell

@synthesize msgReply = _msgReply;
@synthesize mainDic = _mainDic;
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
        
        self.timeTextLabel = [[UILabel alloc] init];
        self.timeTextLabel.text = @"今天 16:45";
        self.timeTextLabel.textColor = [ UIColor brownColor];
        self.timeTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.timeTextLabel.numberOfLines = 1;
        [self addSubview:self.timeTextLabel];
        
        [self updateImgContent];
        
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    return self;
}

- (void)updateImgContent
{
    for (int j = 0; j < 5; j++)
    {
        UIImageView *qunImg = [[UIImageView alloc] init];
        [qunImg setImageWithURL:[NSURL URLWithString:@"http://www.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0008_clear_sky_night.png"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        [self addSubview:qunImg];
        
        qunImg.frame = CGRectMake(10.0f+(j%3)*60, 80.0f+(j/3)*60, 50.0f, 50.0f);
    }
    
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
    self.detailTextLabel.text = @"床前明月光，自挂东南枝。一行白鹭上青天，自挂东南枝";

    [self.imageView setImageWithURL:[NSURL URLWithString:[mainDic objectForKey:@"headUrl"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithMsgReply:(NSDictionary *)mainDic
{
    CGSize sizeToFit = [[mainDic objectForKey:@"name"] sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];

    return fmaxf(75.0f, sizeToFit.height + 75.0f+120.0f);
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
    detailTextLabelFrame.size.height = 25;//[[self class] heightForCellWithMsgReply:self.mainDic] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
    
}

@end
