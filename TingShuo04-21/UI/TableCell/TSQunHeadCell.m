//
//  TSQunHeadCell.m
//  TingShuo04-21
//  群 头部内容
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSQunHeadCell.h"

@implementation TSQunHeadCell

@synthesize fensiTextLabel;
@synthesize msgTextLabel;
@synthesize msgReply = _msgReply;
@synthesize mainDic = _mainDic;


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
        self.fensiTextLabel = [[UILabel alloc] init];
        self.fensiTextLabel.textColor = [ UIColor brownColor];
        self.fensiTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.fensiTextLabel.numberOfLines = 1;
        [self addSubview:self.fensiTextLabel];
        
        self.msgTextLabel = [[UILabel alloc] init];
        self.msgTextLabel.textColor = [ UIColor brownColor];
        self.msgTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.msgTextLabel.numberOfLines = 1;
        [self addSubview:self.msgTextLabel];
        
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
    self.textLabel.text = @"群组名称群组名称";
    self.detailTextLabel.text = @"我骑着一头小毛驴去上学，不小心甩了一身泥,hahahaha";
    self.fensiTextLabel.text = @"粉丝 7569";
    self.msgTextLabel.text = @"消息 1278";
    
    [self.imageView setImageWithURL:[NSURL URLWithString:_msgReply.imageURL] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCell:(NSDictionary *)contentDic
{
    return 100.0f;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    self.detailTextLabel.frame = CGRectMake(70.0f, 30.0f, 240.0f, 40.0f);
    self.fensiTextLabel.frame = CGRectMake(50.0f, 75.0f, 100.0f, 20.0f);
    self.msgTextLabel.frame = CGRectMake(250.0f, 75.0f, 100.0f, 20.0f);
    
}

@end
