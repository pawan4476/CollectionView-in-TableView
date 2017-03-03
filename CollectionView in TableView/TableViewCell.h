//
//  TableViewCell.h
//  CollectionView in TableView
//
//  Created by Nagam Pawan on 3/3/17.
//  Copyright © 2017 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface IndexedCollectionView : UICollectionView
@property (strong, nonatomic) NSIndexPath *indexPath;

@end
static NSString *collevtionViewIdentifier = @"cell1";
@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet IndexedCollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
