//
//  ViewController.h
//  CollectionView in TableView
//
//  Created by Nagam Pawan on 3/3/17.
//  Copyright © 2017 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *categoryList;


@end

