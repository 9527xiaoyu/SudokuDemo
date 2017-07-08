//
//  CollectionHeaderView.m
//  Sudoku
//
//  Created by yxy on 17/7/8.
//  Copyright © 2017年 霜月. All rights reserved.
//

#import "CollectionHeaderView.h"
#import <Masonry.h>

@interface CollectionHeaderView()

@end

@implementation CollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self anywayInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self anywayInit];
}

- (void)anywayInit
{
    [self configParam];
    [self configView];
    [self configData];
    [self configConstraint];
}

- (void)configParam
{
    self.titleLabel.textColor=[UIColor blackColor];
//    self.backgroundColor = [UIColor blueColor];
}

- (void)configView
{
    [self addSubview:self.titleLabel];
}

- (void)configConstraint
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.right.mas_equalTo(-10.0);
    }];
}

- (void)configData
{
    
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc]init];
        _titleLabel.font=[UIFont fontWithName:@".PingFang-SC-Medium" size:16];
        _titleLabel.textAlignment=NSTextAlignmentLeft;
    }
    return _titleLabel;
}

@end
