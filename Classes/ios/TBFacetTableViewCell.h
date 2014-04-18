//
//  TBFacetTableViewCell.h
//  TBFacetTableView
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBFacetTableViewCell : UITableViewCell

@property (strong, nonatomic) UIColor *facetColor;
@property (strong, nonatomic) UIColor *facetColorTop;
@property (strong, nonatomic) UIColor *facetColorBottom;
@property (nonatomic, assign) BOOL isHighlighted;
@property (assign, nonatomic) CGPathRef pathTop;
@property (assign, nonatomic) CGPathRef pathBottom;

+ (NSString *)reuseIdentifier;

- (void)setHighlightedTop:(BOOL)highlighted animated:(BOOL)animated;
- (void)setHighlightedBottom:(BOOL)highlighted animated:(BOOL)animated;

@end
