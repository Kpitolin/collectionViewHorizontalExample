//
//  CustomCollectionViewLayout.m
//  collectionViewHorizontalExample
//
//  Created by KEVIN on 09/07/2014.
//  Copyright (c) 2014 KEVIN. All rights reserved.
//

#import "CustomCollectionViewLayout.h"

@implementation CustomCollectionViewLayout
- (void)prepareLayout {
    [super prepareLayout];
}

static const CGFloat ACTIVE_DISTANCE = 0.0f; //Distance of given cell from center of visible rect
static const CGFloat WIDTH = 250.0f; // Width/ of cell.
static const CGFloat HEIGHT = 300.0f; // /Height of cell.

- (id)init {
    if ((self = [super init]) ) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UIEdgeInsets insets;
        insets.top  = ( 568  - HEIGHT)/2;
        insets.bottom = insets.top;
        insets.left =( 320  - WIDTH)/2;
        insets.right = insets.left;
        self.sectionInset = insets;
        self.itemSize = CGSizeMake(WIDTH, HEIGHT);
        self.minimumInteritemSpacing = 2*insets.left;
        self.minimumLineSpacing = 2*insets.left;
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            
            CGFloat distance = CGRectGetMidX(visibleRect) - attribute.center.x;
            // Make sure given cell is center
            if (ABS(distance) < ACTIVE_DISTANCE) {
                [self.delegate collectionView:self.collectionView layout:self cellCenteredAtIndexPath:attribute.indexPath];
            }
        }
    }
    return attributes;
}
@end
