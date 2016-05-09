//
//  CYYClassCollectionView.m
//  项目实战一
//
//  Created by ma c on 16/5/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "CYYClassCollectionView.h"
#import "CYYEffectCollectionViewCell.h"
#import "CYYClassCollectionViewCell.h"
#import "CYYHeaderCollectionReusableView.h"

#import "CYYEffectClassModel.h"
#import "CYYClassModel.h"
static NSString *classCollectionCell = @"classCollectionViewCell";
static NSString *effertCollectionCell = @"effertCollectionViewCell";
static NSString *headerCollectionView = @"HeaderCollectionReusableView";

@interface CYYClassCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end
@implementation CYYClassCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        //注册
        [self registerClass:[CYYClassCollectionViewCell class] forCellWithReuseIdentifier:classCollectionCell];
        [self registerClass:[CYYEffectCollectionViewCell class] forCellWithReuseIdentifier:effertCollectionCell];
        [self registerClass:[CYYHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCollectionView];
         }
    return self;
}


#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.effectArray.count;
        
    }else if (section == 1){
        return self.classicClassArray.count;
    }else
        return self.recommendClassArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
      
        CYYEffectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:effertCollectionCell forIndexPath:indexPath];
        cell.effectModel = self.effectArray[indexPath.row];
        return cell;
    }else{
        CYYClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:classCollectionCell forIndexPath:indexPath];
        if (indexPath.section == 1) {
            cell.classModel = self.classicClassArray[indexPath.row];
        }else{
            cell.classModel = self.recommendClassArray[indexPath.row];
        }
        return cell;
    }
}

#pragma mark - UICollectionViewDelegate methods
//创建sectionHeader的方法
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    //kind:种类，一共两种，一种是header,一种是footer
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        CYYHeaderCollectionReusableView * reusable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCollectionView forIndexPath:indexPath];
        if (indexPath.section == 0) {
            reusable.titleLabelText = @"功效分类";
            reusable.backgroundColor = RGB(239, 248, 251);
        }else if (indexPath.section == 1){
            reusable.titleLabelText = @"经典品牌";
            reusable.backgroundColor = RGB(252, 244, 243);
        }else{
            reusable.titleLabelText = @"推荐品牌";
            reusable.backgroundColor = RGB(252, 244, 243);
        }
        
        return reusable;
    }
    
    return nil;
}
//获得数据
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    CYYEffectClassModel *effectModel = self.effectArray[indexPath.row];
    if (indexPath.section == 0) {
        if (_effectArray) {
            _effectBlock([self.effectArray[indexPath.row] GoodsType]);
            
        }
    }else if (indexPath.section == 1){
        if (_classicBlock) {
            _classicBlock([self.classicClassArray[indexPath.row] ShopId]);
        }
    }else{
        if (_recommendBlock) {
            _recommendBlock([self.recommendClassArray[indexPath.row] ShopId]);
        }
    }
    
}

@end
