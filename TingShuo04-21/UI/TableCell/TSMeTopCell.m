//
//  TSMeTopCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-6.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMeTopCell.h"
//我，头部封面等内容，单独放在顶部
@implementation TSMeTopCell

@synthesize bgImg = _bgImg;//
@synthesize headImg = _headImg;//
@synthesize nameTextLabel = _nameTextLabel;//名字
@synthesize renqiTextLabel = _renqiTextLabel;//人气，后期改为按钮，点击显示浏览者头像
@synthesize signInTextLabel = _signInTextLabel;//签名

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _bgImg = [[UIImageView alloc] init];
        [self addSubview:_bgImg];
        
        _headImg = [[UIImageView alloc] init];
        [self addSubview:_headImg];
        
        self.nameTextLabel = [[UILabel alloc] init];
        //self.nameTextLabel.font = [UIFont systemFontOfSize:12.0f];
        //self.replyTextLabel.textAlignment = UITextAlignmentLeft;
        self.nameTextLabel.textColor = [ UIColor blackColor];
        self.nameTextLabel.font = [ UIFont fontWithName: @"Arial" size: 15.0 ];
        self.nameTextLabel.numberOfLines = 1;
        [self addSubview:self.nameTextLabel];
        
        _renqiTextLabel = [[UILabel alloc] init];
        _renqiTextLabel.textColor = [ UIColor blackColor];
        _renqiTextLabel.font = [ UIFont fontWithName: @"Arial" size: 15.0 ];
        _renqiTextLabel.numberOfLines = 1;
        [self addSubview:_renqiTextLabel];
        
        _signInTextLabel = [[UILabel alloc] init];
        _signInTextLabel.textColor = [ UIColor blackColor];
        _signInTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        _signInTextLabel.numberOfLines = 1;
        [self addSubview:_signInTextLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgImg.frame = CGRectMake(0.0f, 0.0f, 320.0f, 120.0f);
    self.headImg.frame = CGRectMake(10.0f, 95.0f, 50.0f, 50.0f);
    self.nameTextLabel.frame = CGRectMake(80.0f, 120.0f, 60.0f, 20.0f);
    self.renqiTextLabel.frame = CGRectMake(250.0f, 120.0f, 60.0f, 20.0f);
    self.signInTextLabel.frame = CGRectMake(10.0f, 145.0f, 300.0f, 20.0f);
    
}

- (void)updateContents:(NSArray *)conArr
{
    [_bgImg setImageWithURL:[NSURL URLWithString:@"http://www.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0008_clear_sky_night.png"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [_headImg setImageWithURL:[NSURL URLWithString:@"http://hdn.xnimg.cn/photos/hdn421/20130502/0955/h_head_Y0jz_e6d0000007a3111a.jpg"] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
    _nameTextLabel.text = @"陈摸摸";
    
    _renqiTextLabel.text = @"人气 198";
    
    _signInTextLabel.text = @"床前明月光，疑是地上霜。举头望明月，低头思故乡。思故乡。思故乡。思故乡。思故乡。思故乡。思故乡。";
}

+ (CGFloat)heightForCell:(NSDictionary *)contentDic
{
    return 170.0f;
}

@end
