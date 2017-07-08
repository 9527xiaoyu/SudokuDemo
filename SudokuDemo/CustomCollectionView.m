//
//  CustomCollectionView.m
//  NineCode
//
//  Created by 杨晓宇 on 2017/7/6.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import "CustomCollectionView.h"
//#import "MYCollectionViewCell.h"
#import "SudokuCollectionCell.h"

#import <Masonry.h>

@interface CustomCollectionView()

@property(nonatomic,strong)UICollectionView *collection;
@property(nonatomic,strong)NSArray *itemsArray;
@property(nonatomic,strong)NSArray *categoryArray;
@property(nonatomic,strong)NSMutableArray *tempArr;
@property(nonatomic,strong)UILabel *itemsLab;
@end

@implementation CustomCollectionView
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
    
}

- (void)configView
{
    [self addSubview:self.collection];
}

- (void)configConstraint
{
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self).offset(0);
        //        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(-20);
        //        make.size.mas_equalTo(CGSizeMake(414, 656));
    }];
    [self.itemsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self).offset(25);
        make.left.equalTo(self).offset(18);
//        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(-29);
        make.width.offset(35);
    }];
}

- (void)configData
{
    
}

-(UICollectionView *)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //添加头 三步
        layout.headerReferenceSize=CGSizeMake(self.bounds.size.width, 40);
        //添加按钮控件
        layout.itemSize = CGSizeMake(78, 56);
        layout.minimumInteritemSpacing = 20;//行间隔
        layout.minimumLineSpacing = 11;//列间隔
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;//水平排列
        
        _collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.delegate=self;
        _collection.dataSource=self;
        //注册MYCollectionViewCell
        //    [_collection registerNib:[UINib nibWithNibName:@"MYCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        [_collection registerClass:[SudokuCollectionCell class] forCellWithReuseIdentifier:@"cell"];
        //添加头 一步：注册头视图，不注册则奔溃
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionHeader"];
        _collection.backgroundColor = [UIColor whiteColor];
        
    }
    return _collection;
}

-(UILabel *)itemsLab{
    if (_itemsLab) {
        _itemsLab=[[UILabel alloc]init];
        _itemsLab.textColor=[UIColor blackColor];
        _itemsLab.font=[UIFont fontWithName:@".PingFang-SC-Medium" size:16];
        _itemsLab.textAlignment=NSTextAlignmentLeft;
    }
    return _itemsLab;
}

-(void)CustomCollectionViewWithItemsArray:(NSArray *)itemsArray CategoryArray:(NSArray *)categoryArray Requst:(CustomCollectionCheckedBlock)block{
    self.itemsArray=itemsArray;
    self.categoryArray=categoryArray;
    self.tempArr = [NSMutableArray arrayWithArray:self.categoryArray];
    self.callback = block;
    [self anywayInit];
    
}

#pragma MARK - delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

//添加头 二步
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"collectionHeader" forIndexPath:indexPath];
    
    _itemsLab=[[UILabel alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
    _itemsLab.text=self.itemsArray[indexPath.section];
    _itemsLab.textColor=[UIColor blackColor];
    _itemsLab.font=[UIFont fontWithName:@".PingFang-SC-Medium" size:16];
    _itemsLab.textAlignment=NSTextAlignmentLeft;
    [headView addSubview:_itemsLab];
    headView.backgroundColor = [UIColor blueColor];
    return headView;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SudokuCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.pictureView.image=[UIImage imageNamed:@"placeholder.png"];
    cell.titleName.text=self.categoryArray[indexPath.section][indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.callback(indexPath.section, indexPath.row,self.categoryArray[indexPath.section][indexPath.row]);
    
}

-(void)dealloc{
    self.categoryArray=nil;
    self.itemsArray=nil;
    self.tempArr=nil;
    self.collection=nil;
}

@end
