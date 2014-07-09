//
//  CustomCollectionViewLayout.h
//  collectionViewHorizontalExample
//
//  Created by KEVIN on 09/07/2014.
//  Copyright (c) 2014 KEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * The customViewFlowLayoutDelegate protocol defines methods that let you coordinate with
 *location of cell which is centered.
 */
@protocol CustomViewFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

/** Informs delegate about location of centered cell in grid.
 *  Delegate should use this location 'indexPath' information to
 *   adjust it's conten associated with this cell.
 *   @param indexpath of cell in collection view which is centered.
 */

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout cellCenteredAtIndexPath:(NSIndexPath *)indexPath;
@end
@interface CustomCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<CustomViewFlowLayoutDelegate> delegate;
@end
