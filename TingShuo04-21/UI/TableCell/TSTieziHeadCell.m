//
//  TSTieziHeadCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSTieziHeadCell.h"

@implementation TSTieziHeadCell

@synthesize themeTextLabel = _themeTextLabel;
@synthesize searchTimesTextLabel = _searchTimesTextLabel;
@synthesize timeTextLabel = _timeTextLabel;
@synthesize contentTextLabel = _contentTextLabel;
@synthesize newestButton = _newestButton;
@synthesize hotestButton = _hotestButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _themeTextLabel = [[UILabel alloc] init];
        _themeTextLabel.font = [UIFont systemFontOfSize:15.0f];
        _themeTextLabel.textColor = [UIColor blackColor];
        _themeTextLabel.numberOfLines = 1;
        [self addSubview:_themeTextLabel];
        
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
        
        _newestButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _newestButton.backgroundColor = [UIColor clearColor];
        [_newestButton setTitle:@"最新" forState:UIControlStateNormal];
        [_newestButton addTarget:self action:@selector(doSelectedNewest) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_newestButton];
        
        _hotestButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _hotestButton.backgroundColor = [UIColor clearColor];
        [_hotestButton setTitle:@"最热" forState:UIControlStateNormal];
        [_hotestButton addTarget:self action:@selector(doSelectedHotest) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_hotestButton];
    }
    return self;
}

//选择了最新的按钮
-(void)doSelectedNewest
{
    if([self.delegate respondsToSelector:@selector(switchNeworHot:)])
    {
        [self.delegate switchNeworHot:YES];
    }
}

//选择了最热的按钮
-(void)doSelectedHotest
{
    if([self.delegate respondsToSelector:@selector(switchNeworHot:)])
    {
        [self.delegate switchNeworHot:NO];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateContents:(NSArray *)conArr
{
    _themeTextLabel.text = @"帖子的题目题目题目";
    _searchTimesTextLabel.text = @"浏览92843次";
    _timeTextLabel.text = @"2013-5-11 11:21";
    _contentTextLabel.text = @"我骑着一头小毛驴去上学，不小心甩了一身泥,hahahaha";
    
    [self updateImgContent];
    
    [self setNeedsLayout];
}

- (void)updateImgContent
{
    for (int j = 0; j < 5; j++)
    {
        UIImageView *qunImg = [[UIImageView alloc] init];
        [qunImg setImageWithURL:[NSURL URLWithString:@"http://www.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0008_clear_sky_night.png"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        [self addSubview:qunImg];
        
        qunImg.frame = CGRectMake(10.0f+(j%3)*70, 80.0f+(j/3)*70, 60.0f, 60.0f);
    }
    
}

+ (CGFloat)heightForCell:(NSDictionary *)contentDic
{
    return 250.0f;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _themeTextLabel.frame = CGRectMake(10.0f, 10.0f, 300.0f, 20.0f);
    _searchTimesTextLabel.frame = CGRectMake(10.0f, 30.0f, 100.0f, 20.0f);
    _timeTextLabel.frame = CGRectMake(240.0f, 30.0f, 150.0f, 20.0f);
    _contentTextLabel.frame = CGRectMake(10.0f, 50.0f, 300.0f, 30.0f);
    
    _newestButton.frame = CGRectMake(10.0f, 220.0f, 50.0f, 30.0f);
    _hotestButton.frame = CGRectMake(65.0f, 220.0f, 50.0f, 30.0f);
}

@end
