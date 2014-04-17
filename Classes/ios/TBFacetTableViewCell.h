//
//  TBFacetTableViewCell.h
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBFacetTableViewCell : UITableViewCell

@property (strong, nonatomic) UIColor *facetColor;
@property (strong, nonatomic) UIColor *facetColorTop;
@property (strong, nonatomic) UIColor *facetColorBottom;
@property (assign, nonatomic) CGPathRef pathTop;
@property (assign, nonatomic) CGPathRef pathBottom;

+ (NSString *)reuseIdentifier;

@end
