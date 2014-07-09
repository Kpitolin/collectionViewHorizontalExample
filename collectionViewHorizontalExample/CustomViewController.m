//
//  ViewController.m
//  collectionViewHorizontalExample
//
//  Created by KEVIN on 09/07/2014.
//  Copyright (c) 2014 KEVIN. All rights reserved.
//
#import "CustomCell.h"
#import "CustomViewController.h"
#import "CustomCollectionViewLayout.h"
@interface CustomViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CustomViewFlowLayoutDelegate>
@property (strong,nonatomic) NSArray * datasource;

@end

@implementation CustomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    CustomCollectionViewLayout *flowLayout = [[CustomCollectionViewLayout alloc]init];
    self.collectionView.collectionViewLayout = flowLayout;

    flowLayout.delegate = self;
    self.collectionView.pagingEnabled = YES;
    
    self.pageControl.numberOfPages = [self.datasource count];
}

-(NSArray *)datasource
{
    NSArray * array = [[NSArray alloc] initWithObjects:@"1ère cellule",@"2ème cellule",@"3ème cellule", nil];
    if(!_datasource)
    {
        _datasource = array;
    }
    return _datasource ;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

{
    return [self.datasource count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CustomCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cellID"
                                                                        forIndexPath:indexPath];
    
    
    cell.text = [NSString stringWithFormat:@"Ceci est la \n%@",[self.datasource objectAtIndex:indexPath.item]] ;
    
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)colView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
}
- (void)collectionView:(UICollectionView *)colView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
}


- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout cellCenteredAtIndexPath:(NSIndexPath *)indexPath
{
    self.pageControl.currentPage = indexPath.row;
}
@end
