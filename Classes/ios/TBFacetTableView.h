//
//  TBFacetTableView.h
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBFacetTableView : UITableView

@end

@protocol TBFacetTableViewDataSource <UITableViewDataSource>

- (UIColor *)colorForIndexPath:(NSIndexPath *)indexPath;

- (CGPathRef)topPathForCellAtIndexPath:(NSIndexPath *)indexPath;
- (CGPathRef)bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol TBFacetTableViewDelegate <UITableViewDelegate>

@end