//
//  ViewController.m
//  MDWaterFlow
//
//  Created by 李永杰 on 2019/6/18.
//  Copyright © 2019 liyongjie. All rights reserved.
//

#import "ViewController.h"
#import "MDWaterFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, MDWaterFlowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];

}
-(void)configUI {
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.view addSubview:self.collectionView];
}

-(UICollectionView *)collectionView {
    if (!_collectionView) {
        MDWaterFlowLayout *layout = [[MDWaterFlowLayout alloc]init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    }
    return _collectionView;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    return cell;
}

-(CGFloat)waterFlowLayout:(MDWaterFlowLayout *)WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath {
    return width/[[self rateForWidthDividedHeight][indexPath.row]floatValue];
}
//瀑布流图片真实宽高比
- (NSArray *)rateForWidthDividedHeight{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pictures" ofType:@".plist"];
    NSArray *images = [NSArray arrayWithContentsOfFile:path];
    __block NSMutableArray *rates = [NSMutableArray array];
    [images enumerateObjectsUsingBlock:^(NSDictionary *imageDic, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat w = [imageDic[@"w"] floatValue];
        CGFloat h = [imageDic[@"h"] floatValue];
        [rates addObject:@(w/h)];
    }];
    return rates;
}
@end
