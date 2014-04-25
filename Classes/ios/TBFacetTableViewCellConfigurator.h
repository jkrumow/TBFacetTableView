//
//  TBFacetTableViewCellConfigurator.h
//  TBFacetTableView
//
//  Created by Julian Krumow on 18.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TBFacetTableViewCell.h"

@protocol TBFacetTableViewCellConfiguratorDelegate;

/**
 *  This class configures `TBFacetTableViewCell`s.
 */
@interface TBFacetTableViewCellConfigurator : NSObject

/**
 *  Initializes the `TBFacetTableViewCellConfigurator` with a given `UITableView` and a `TBFacetTableViewCellConfiguratorDelegate` object.
 *
 *  @param tableView A `UITableView`
 *  @param delegate  A delegate
 *
 *  @return The fully initialized `TBFacetTableViewCellConfigurator` instance
 */
- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<TBFacetTableViewCellConfiguratorDelegate>)delegate;

/**
 *  Configures a given `TBFacetTableViewCell`. Requests `facetColor`, `facetColorTop` and `facetColorBottom` from the `TBFacetTableViewCellConfiguratorDelegate`object.
 *
 *  @param cell      The given `TBFacetTableViewCell` to configure
 *  @param indexPath The cell's indexPath
 */
- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath;

@end

/**
 *  This protocol is used by the `TBFacetTableViewCellConfigurator` to configure a given `TBFacetTableViewCell`.
 */
@protocol TBFacetTableViewCellConfiguratorDelegate <NSObject>

/**
 *  Retrieves the value for the cell's `facetColor` property.
 *
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `facetColor` property
 */
- (UIColor *)colorForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Retrieves the value for the cell's `facetColorTop` property.
 *
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `facetColorTop` property
 */
- (CGPathRef)topPathForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Retrieves the value for the cell's `facetColorBottom` property.
 *
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `facetColorBottom` property
 */
- (CGPathRef)bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath;

@end