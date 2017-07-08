//
//  ButtonShadowView.h
//  NineCode
//
//  Created by 杨晓宇 on 2017/7/7.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SudokuButtonShadowViewBlock)();
@interface SudokuButtonShadowView : UIView

@property(nonatomic,copy)SudokuButtonShadowViewBlock callback;

-(void)ButtonShadowViewWithRequst:(SudokuButtonShadowViewBlock)block;

@end
