//
//  ButtonShadowView.m
//  NineCode
//
//  Created by 杨晓宇 on 2017/7/7.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import "SudokuButtonShadowView.h"
#import <Masonry.h>

@interface SudokuButtonShadowView()
@property(nonatomic,strong) UIButton *randomBtn;
@end

@implementation SudokuButtonShadowView

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
    self.backgroundColor=[UIColor colorWithRed:0.255 green:0.659 blue:0.62 alpha:0.9];
}

- (void)configView
{
   [self addSubview:self.randomBtn];
}

- (void)configConstraint
{
    [self.randomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configData
{
    self.layer.cornerRadius=10;
    self.layer.shadowColor=[UIColor colorWithRed:0.255 green:0.659 blue:0.62 alpha:1].CGColor;//阴影颜色
    self.layer.shadowOffset=CGSizeMake(0,1);//阴影偏移范围 （0，0）是四周环绕 (w,h)的增加阴影向右下方偏移
    self.layer.shadowOpacity=0.9;//阴影的透明度
}

#pragma mark - 懒加载
-(UIButton *)randomBtn{
    if (!_randomBtn) {
        _randomBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [_randomBtn setTitle:@"随便看看" forState:UIControlStateNormal];
        [_randomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_randomBtn setBackgroundColor:[UIColor colorWithRed:0.255 green:0.659 blue:0.62 alpha:1]];
        [_randomBtn addTarget:self action:@selector(RandomIsSelected:) forControlEvents:UIControlEventTouchUpInside];
        _randomBtn.layer.cornerRadius=5;
    }
    return _randomBtn;
}

#pragma mark - 回调
-(void)ButtonShadowViewWithRequst:(SudokuButtonShadowViewBlock)block{
    _callback = block;
    [self anywayInit];
}

#pragma mark - action
-(void)RandomIsSelected:(UIButton*)sender{
    NSLog(@"随便看");
}

@end
