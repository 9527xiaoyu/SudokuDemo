//
//  MYCollectionViewCell.h
//  NineCode
//
//  Created by 杨晓宇 on 2017/7/6.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bg_imageView;
@property (weak, nonatomic) IBOutlet UILabel *name_label;

//-(instancetype)InitWithFrame:(CGRect)frame Image:(NSString*)imgName Label:(NSString*)name;
@end
