//
//  TSRelationFensiCell.m
//  TingShuo04-21
//  关系 -》粉丝
//  Created by 张 璐 on 13-5-6.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSRelationFensiCell.h"
//#import "TSChatViewController.h"

@implementation TSRelationFensiCell

@synthesize mainDic = _mainDic;
@synthesize msgReply = _msgReply;
@synthesize attentionTextLabel = _attentionTextLabel;
@synthesize sendMsgButton = _sendMsgButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.textColor = [UIColor darkGrayColor];
        
        self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
        self.detailTextLabel.numberOfLines = 1;
        
        self.attentionTextLabel = [[UILabel alloc] init];
        self.attentionTextLabel.textColor = [ UIColor brownColor];
        self.attentionTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
        self.attentionTextLabel.numberOfLines = 1;
        [self addSubview:self.attentionTextLabel];
        
        _sendMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _sendMsgButton.backgroundColor = [UIColor clearColor];
        [_sendMsgButton setTitle:@"发信" forState:UIControlStateNormal];
        [_sendMsgButton addTarget:self action:@selector(doSelected) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendMsgButton];
        
        self.imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClickhandler:)];
        [self.imageView addGestureRecognizer:singleTap];
        [singleTap release];
        
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    return self;
}

-(void)doSelected
{
    if([self.delegate respondsToSelector:@selector(openFensi:)])
    {
        [self.delegate openFensi:@"123"];
    }
}

//点击头像
- (void)imageViewClickhandler:(UIGestureRecognizer *)gestureRecognizer
{
    if([self.delegate respondsToSelector:@selector(imageViewFensiClick:)])
    {
        [self.delegate imageViewFensiClick:@"123"];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)updateContents:(NSArray *)conArr
{
    self.textLabel.text = @"陈默默";
    self.detailTextLabel.text = @"北京市第奇葩中学";
    self.attentionTextLabel.text = @"互粉";
    
    [self.imageView setImageWithURL:[NSURL URLWithString:_msgReply.imageURL] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCell:(NSDictionary *)contentDic
{
    return 60.0f;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    self.detailTextLabel.frame = CGRectMake(70.0f, 30.0f, 240.0f, 20.0f);
    _attentionTextLabel.frame = CGRectMake(170, 5, 50, 20);
     _sendMsgButton.frame = CGRectMake(220, 10, 40, 20);
    
}


@end
