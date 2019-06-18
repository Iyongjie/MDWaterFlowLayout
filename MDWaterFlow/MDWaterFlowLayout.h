//
//  MDWaterFlowLayout.h
//  MDWaterFlow
//
//  Created by 李永杰 on 2019/6/18.
//  Copyright © 2019 liyongjie. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MDWaterFlowLayoutDelegate;
@interface MDWaterFlowLayout : UICollectionViewLayout

@property (nonatomic, assign) CGFloat       columnMargin;
@property (nonatomic, assign) CGFloat       rowMargin;
@property (nonatomic, assign) UIEdgeInsets  sectionInset;
@property (nonatomic, assign) NSInteger     columnCount;

@property (nonatomic, weak)  id<MDWaterFlowLayoutDelegate> delegate;

@end

@protocol MDWaterFlowLayoutDelegate <NSObject>

-(CGFloat)waterFlowLayout:(MDWaterFlowLayout *) WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath;


@end
