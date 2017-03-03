//
//  ViewController.m
//  CollectionView in TableView
//
//  Created by Nagam Pawan on 3/3/17.
//  Copyright © 2017 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end


@implementation ViewController{
    
    NSArray *categoriesArray,*collectionViewArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialMethod];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initialMethod{
    
    self.categoryList=[[NSArray alloc]initWithObjects:@"General Topics",@"General Aptitude",@"Technical Aptitude",@"Sports", nil];
    NSArray *generalAptitude=@[@"Odd Man Out & Series",@"Probability",@"Boats & Streams",@"Ratio & Proportion",@"Problems on HCF & LCM",@"Permutation & Combination"];
    NSArray *technicalAptitude=@[@"Java",@"C",@"C++",@"C#"];
    NSArray *generalTopics= @[@"History",@"Geography",@"Science",@"Arts",@"Technology",@"Food-Drink"];
    NSArray *sports=@[@"Cricket",@"Hockey",@"Tennis"];
    
    categoriesArray=[[NSArray alloc]initWithObjects:generalTopics,generalAptitude,technicalAptitude,sports, nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return categoriesArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.categoryLabel.text = [self.categoryList objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell setCollectionViewDataSourceDelegate:(id)self indexPath:indexPath];
    NSInteger index = cell.collectionView.indexPath.row;
    CGFloat horizontalOffSet = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionView setContentOffset:CGPointMake(horizontalOffSet, 0)];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    collectionViewArray = categoriesArray[[(IndexedCollectionView *)collectionView indexPath].row];
    return collectionViewArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collevtionViewIdentifier forIndexPath:indexPath];
    
    @try {
        
        collectionViewArray = categoriesArray[[(IndexedCollectionView *)collectionView indexPath].row];
        cell.myImage.image = [UIImage imageNamed:[collectionViewArray objectAtIndex:indexPath.item]];
    } @catch (NSException *exception) {
        
    }
    
    return cell;
}
@end
