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

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius=5;
        self.backgroundColor=[UIColor redColor];
        [self setupUI];
    }
    return self;
    
}

-(void)setupUI{
    self.pictureView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.pictureView];
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
        make.center.equalTo(self.contentView);
        
    }];
    
    self.titleName = [[UILabel alloc]init];
    self.titleName.font = [UIFont fontWithName:@".PingFang-SC-Medium" size:14];
    self.titleName.textAlignment = NSTextAlignmentCenter;
//    self.titleName.textColor = [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1];
    self.titleName.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleName];
    [self.titleName mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf).offset(-18);
//        make.bottom.equalTo(weakSelf).offset(18);
//        make.left.equalTo(weakSelf).offset(25);
//        make.right.equalTo(weakSelf).offset(-25);
        make.center.equalTo(self.pictureView);
        make.size.mas_equalTo(CGSizeMake(78, 56));
    }];
}

@end
