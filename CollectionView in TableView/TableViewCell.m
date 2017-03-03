//
//  TableViewCell.m
//  CollectionView in TableView
//
//  Created by Nagam Pawan on 3/3/17.
//  Copyright © 2017 Nagam Pawan. All rights reserved.
//

#import "TableViewCell.h"

@implementation IndexedCollectionView



@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10);
    layout.itemSize = CGSizeMake(44, 44);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[IndexedCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:collevtionViewIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = YES;
    [self.contentView addSubview:self.contentView];    
        
    return self;
}

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource,UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath{
    
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.indexPath = indexPath;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    [self.collectionView reloadData];
    
}
@end
