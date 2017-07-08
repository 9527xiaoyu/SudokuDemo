//
//  CustomCollectionView.h
//  NineCode
//
//  Created by 杨晓宇 on 2017/7/6.
//  Copyright © 2017年 com.ywart. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CustomCollectionCheckedBlock)(NSInteger checkedSection,NSInteger checkedRow,NSString* nameLabel);

@interface CustomCollectionView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,copy)CustomCollectionCheckedBlock callback;

-(void)CustomCollectionViewWithItemsArray:(NSArray*)itemsArray CategoryArray:(NSArray*)categoryArray Requst:(CustomCollectionCheckedBlock)block;
@end
