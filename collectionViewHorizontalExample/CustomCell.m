//
//  CustomCell.m
//  collectionViewHorizontalExample
//
//  Created by KEVIN on 09/07/2014.
//  Copyright (c) 2014 KEVIN. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = self.text;
}

@end
