//
//  CategoryViewWithButton.m
//  NineCode
//
//  Created by 杨晓宇 on 2017/7/6.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import "SudokuViewAndButton.h"
#import "CustomCollectionView.h"
#import "SudokuButtonShadowView.h"
#import <Masonry.h>

@interface SudokuViewAndButton(){
    CGFloat _customHeight;
}

@property(nonatomic,strong)NSArray *itemsArray;
@property(nonatomic,strong)NSArray *categoryArray;

@property(nonatomic,strong)UIButton *randomLookBtn;
@property(nonatomic,strong)CustomCollectionView *customView;
@property(nonatomic,strong)SudokuButtonShadowView *btnShadowView;

@end

@implementation SudokuViewAndButton

-(instancetype)initWithFrame:(CGRect)frame ItemsArray:(NSArray *)itemsArray CategoryArray:(NSArray *)categoryArray{
    if (self = [super initWithFrame:frame]) {
        self.itemsArray=itemsArray;
        self.categoryArray=categoryArray;
        [self anywayInit];
    }
    return self;
}

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
    [self configData];
    [self configView];
    [self configConstraint];
}

- (void)configParam
{
    _customHeight=_btnShadowView.frame.origin.y+_btnShadowView.frame.size.height+10;
}

- (void)configView
{
    [self addSubview:_btnShadowView];
    [self addSubview:_customView];
}

- (void)configConstraint
{
    [_btnShadowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.customView.mas_top).offset(44);
        make.top.equalTo(self).offset(64);
        make.left.equalTo(self).offset(78);
        make.right.equalTo(self).offset(-78);
        make.height.offset(44);
//        make.size.mas_equalTo(CGSizeMake(219, 44));
    }];
    
    [_customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_btnShadowView.mas_bottom).offset(20);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        //        make.size.equalTo(self);
        make.height.equalTo(self.mas_height);
    }];
    
}

- (void)configData
{
    _btnShadowView=[[SudokuButtonShadowView alloc]init];
    [_btnShadowView ButtonShadowViewWithRequst:^{
        
    }];
    
    _customView = [[CustomCollectionView alloc]init];
    [_customView CustomCollectionViewWithItemsArray:self.itemsArray CategoryArray:self.categoryArray Requst:^(NSInteger checkedSection, NSInteger checkedRow, NSString *nameLabel) {
        NSLog(@"点击了第%ld行第%ld列的---%@",(long)checkedSection,(long)checkedRow,nameLabel);
    }];
}

#pragma mark - 懒加载
//-(SudokuButtonShadowView *)btnShadowView{
//    if (!_btnShadowView) {
//        
//    }
//    return _btnShadowView;
//}
//
//-(CustomCollectionView *)customView{
//    if (!_customView) {
//        
//    }
//    return _customView;
//}

#pragma mark - action
-(void)RandomLookChecked:(UIButton*)sender{
    NSLog(@"点了kankan");
}

@end
