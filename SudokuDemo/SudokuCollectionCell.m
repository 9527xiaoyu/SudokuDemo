//
//  SudokuCollectionCell.m
//  SudokuDemo
//
//  Created by 杨晓宇 on 2017/7/7.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import "SudokuCollectionCell.h"
#import <Masonry.h>

@interface SudokuCollectionCell()


@end

@implementation SudokuCollectionCell

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
    self.layer.cornerRadius=5;
    self.backgroundColor=[UIColor redColor];
//    self.titleName.textColor = [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1];
    self.titleName.textColor = [UIColor blackColor];
}

- (void)configView
{
    [self.contentView addSubview:self.pictureView];
    [self.contentView addSubview:self.titleName];
}

- (void)configConstraint
{
    //图片
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
        make.center.equalTo(self.contentView);
        
    }];
    //标题
    [self.titleName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.pictureView);
        make.size.mas_equalTo(CGSizeMake(78, 56));
    }];
}

- (void)configData
{
    
}

-(UIImageView *)pictureView{
    if (!_pictureView) {
         self.pictureView = [[UIImageView alloc]init];
    }
    return _pictureView;
}

-(UILabel *)titleName{
    if (!_titleName) {
        self.titleName = [[UILabel alloc]init];
        self.titleName.font = [UIFont fontWithName:@".PingFang-SC-Medium" size:14];
        self.titleName.textAlignment = NSTextAlignmentCenter;
    }
    return _titleName;
}

@end
