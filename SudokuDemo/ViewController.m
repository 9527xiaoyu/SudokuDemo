//
//  ViewController.m
//  SudokuDemo
//
//  Created by 杨晓宇 on 2017/7/7.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import "ViewController.h"
//#import "MYCollectionViewCell.h"
//#import "CustomCollectionView.h"
#import "SudokuViewAndButton.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *categoryAray;
@property(nonatomic,strong)NSArray *itemsArray;
@property(nonatomic,strong)SudokuViewAndButton *cView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self yw_configParams];
    [self yw_configDatas];
    [self yw_configViews];
    [self yw_configConstraints];
    
}

-(void)yw_configParams
{
    self.view.backgroundColor=[UIColor whiteColor];
    self.categoryAray=[NSMutableArray arrayWithObjects:@[@"油画",@"水墨",@"摄影",@"水彩"],@[@"抽象",@"具象",@"卡通", @"传统国画"],@[@"风景",@"人物",@"动物",@"山水"],@[@"没有人",@"冷",@"高兴",@"办公室"],nil];
    self.itemsArray = [NSMutableArray arrayWithObjects:@"类别",@"风格",@"题材",@"有趣的标签", nil];
}

-(void)yw_configDatas
{
    _cView=[[SudokuViewAndButton alloc]initWithFrame:self.view.frame ItemsArray:self.itemsArray CategoryArray:self.categoryAray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)yw_configConstraints
{
    
}

-(void)yw_configViews
{
    [self.view addSubview:self.cView];
}


@end
