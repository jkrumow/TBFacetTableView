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
 *
 *  Uses the `TBFacetTableViewCellConfiguratorDelegate` protocol to request color and paths from the delegate for the given cell.
 */
@interface TBFacetTableViewCellConfigurator : NSObject

/**
 *  Initializes the `TBFacetTableViewCellConfigurator` with a given `UITableView` and a `TBFacetTableViewCellConfiguratorDelegate` object.
 *
 *  @param tableView The `UITableView` hosting the TBFacetTableViewCell in question
 *  @param delegate  An object conforming to the `TBFacetTableViewCellConfiguratorDelegate` protocol
 *
 *  @return The fully initialized `TBFacetTableViewCellConfigurator` instance
 */
- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<TBFacetTableViewCellConfiguratorDelegate>)delegate;

/**
 *  Configures a given `TBFacetTableViewCell`.
 *
 *  Causes the instance to request `facetColor`, `facetColorTop` and `facetColorBottom` from the `TBFacetTableViewCellConfiguratorDelegate` object.
 *
 *  @param cell      The given `TBFacetTableViewCell` to configure
 *  @param indexPath The cell's indexPath
 */
- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath;

@end

/**
 *  This protocol is used by the `TBFacetTableViewCellConfigurator` to request data to configure a given `TBFacetTableViewCell`.
 */
@protocol TBFacetTableViewCellConfiguratorDelegate <NSObject>

/**
 *  Requests the value for the cell's `facetColor` property.
 *
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `facetColor` property
 */
- (UIColor *)colorForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Requests the value for the cell's `highlightColor` property.
 *
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `highlightColor` property
 */
- (UIColor *)highlightColorForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Requests the value for the cell's `pathTop` property.
 *
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `pathTop` property
 */
- (CGPathRef)topPathForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Requests the value for the cell's `pathBottom` property.
 *
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `pathBottom` property
 */
- (CGPathRef)bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath;

@end
