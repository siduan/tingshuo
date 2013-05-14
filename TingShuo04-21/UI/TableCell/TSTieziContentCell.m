//
//  TSTieziContentCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSTieziContentCell.h"

@implementation TSTieziContentCell

@synthesize nameTextLabel = _nameTextLabel;
@synthesize replyTextLabel = _replyTextLabel;
@synthesize timeTextLabel = _timeTextLabel;
@synthesize contentTextLabel = _contentTextLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _nameTextLabel = [[UILabel alloc] init];
        _nameTextLabel.font = [UIFont systemFontOfSize:15.0f];
        _nameTextLabel.textColor = [UIColor blackColor];
        _nameTextLabel.numberOfLines = 1;
        [self addSubview:_nameTextLabel];
        
        _replyTextLabel = [[UILabel alloc] init];
        _replyTextLabel.font = [UIFont fontWithName: @"Arial" size:10.0f];
        _replyTextLabel.textColor = [UIColor darkGrayColor];
        _replyTextLabel.numberOfLines = 1;
        [self addSubview:_replyTextLabel];
        
        _contentTextLabel = [[UILabel alloc] init];
        _contentTextLabel.font = [UIFont systemFontOfSize:10.0f];
        _contentTextLabel.textColor = [UIColor blackColor];
        _contentTextLabel.numberOfLines = 3;//最多80个字
        [self addSubview:_contentTextLabel];
        
        _timeTextLabel = [[UILabel alloc] init];
        _timeTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        _timeTextLabel.textColor = [UIColor darkGrayColor];
        _timeTextLabel.numberOfLines = 1;
        [self addSubview:_timeTextLabel];
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
    _nameTextLabel.text = @"某男";
    _replyTextLabel.text = @"回复：某条评论的前一行，前一行";
    _timeTextLabel.text = @"2013-5-11 11:21";
    _contentTextLabel.text = @"我骑着一头小毛驴去上学，不小心甩了一身泥,hahahaha";
    
    [self updateImgContent];
    
    [self setNeedsLayout];
}
//最多3张照片
- (void)updateImgContent
{
    for (int j = 0; j < 3; j++)
    {
        UIImageView *qunImg = [[UIImageView alloc] init];
        [qunImg setImageWithURL:[NSURL URLWithString:@"http://www.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0008_clear_sky_night.png"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        [self addSubview:qunImg];
        
        qunImg.frame = CGRectMake(10.0f+(j%3)*50, 70.0f+(j/3)*50, 50.0f, 50.0f);
    }
    
}

+ (CGFloat)heightForCell:(NSDictionary *)contentDic
{
    return 150.0f;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _nameTextLabel.frame = CGRectMake(10.0f, 10.0f, 30.0f, 20.0f);
    _replyTextLabel.frame = CGRectMake(50.0f, 10.0f, 250.0f, 20.0f);
    _contentTextLabel.frame = CGRectMake(10.0f, 30.0f, 300.0f, 30.0f);
    
    _timeTextLabel.frame = CGRectMake(10.0f, 125.0f, 150.0f, 20.0f);
    
}

@end
