//
//  TSQunTopTenCell.m
//  TingShuo04-21
//  top10的帖子，可以横向或者总想滚动的
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSQunTopTenCell.h"

@implementation TSQunTopTenCell

@synthesize topTextLabel = _topTextLabel;
@synthesize searchTimesTextLabel = _searchTimesTextLabel;
@synthesize timeTextLabel = _timeTextLabel;
@synthesize contentTextLabel = _contentTextLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _topTextLabel = [[UILabel alloc] init];
        _topTextLabel.font = [ UIFont fontWithName: @"Arial" size: 15.0 ];
        _topTextLabel.textColor = [UIColor redColor];
        _topTextLabel.numberOfLines = 1;
        [self addSubview:_topTextLabel];
        
        _searchTimesTextLabel = [[UILabel alloc] init];
        _searchTimesTextLabel.font = [UIFont systemFontOfSize:10.0f];
        _searchTimesTextLabel.textColor = [UIColor darkGrayColor];
        _searchTimesTextLabel.numberOfLines = 1;
        [self addSubview:_searchTimesTextLabel];

        _timeTextLabel = [[UILabel alloc] init];
        _timeTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        _timeTextLabel.textColor = [UIColor darkGrayColor];
        _timeTextLabel.numberOfLines = 1;
        [self addSubview:_timeTextLabel];
        
        _contentTextLabel = [[UILabel alloc] init];
        _contentTextLabel.font = [UIFont systemFontOfSize:12.0f];
        _contentTextLabel.textColor = [UIColor blackColor];
        _contentTextLabel.numberOfLines = 1;
        [self addSubview:_contentTextLabel];
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
    _topTextLabel.text = @"本周TOP1";
    _searchTimesTextLabel.text = @"浏览92843次";
    _timeTextLabel.text = @"2013-5-11 11:21";
    _contentTextLabel.text = @"我骑着一头小毛驴去上学，不小心甩了一身泥,hahahaha,床前明月光，自挂东南枝。";
    
    [self updateImgContent];
    
    [self setNeedsLayout];
}

- (void)updateImgContent
{
    for (int j = 0; j < 3; j++)
    {
        UIImageView *qunImg = [[UIImageView alloc] init];
        [qunImg setImageWithURL:[NSURL URLWithString:@"http://www.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0008_clear_sky_night.png"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        [self addSubview:qunImg];
        
        qunImg.frame = CGRectMake(10.0f+(j%3)*50, 60.0f+(j/3)*50, 40.0f, 40.0f);
    }
    
}

+ (CGFloat)heightForCell:(NSDictionary *)contentDic
{
    return 110.0f;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _topTextLabel.frame = CGRectMake(10.0f, 10.0f, 100.0f, 20.0f);
    _searchTimesTextLabel.frame = CGRectMake(100.0f, 10.0f, 100.0f, 20.0f);
    _timeTextLabel.frame = CGRectMake(240.0f, 10.0f, 150.0f, 20.0f);
    _contentTextLabel.frame = CGRectMake(10.0f, 40.0f, 300.0f, 15.0f);
    
}

@end
