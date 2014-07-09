//
//  CustomCell.h
//  collectionViewHorizontalExample
//
//  Created by KEVIN on 09/07/2014.
//  Copyright (c) 2014 KEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (strong,nonatomic) NSString * text;
@end
