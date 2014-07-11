//
//  TBFacetTableViewCellConfigurator.h
//  TBFacetTableView
//
//  Created by Julian Krumow on 18.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TBFacetTableViewCell.h"

@protocol TBFacetTableViewCellConfiguratorDataSource;

/**
 *  This class configures `TBFacetTableViewCell`s.
 *
 *  Uses the `TBFacetTableViewCellConfiguratorDataSource` protocol to request color and paths from the delegate for the given cell.
 */
@interface TBFacetTableViewCellConfigurator : NSObject

/**
 *  Initializes the `TBFacetTableViewCellConfigurator` with a given `UITableView` and a `TBFacetTableViewCellConfiguratorDataSource` object.
 *
 *  @param tableView The `UITableView` hosting the TBFacetTableViewCell in question
 *  @param dataSource  An object conforming to the `TBFacetTableViewCellConfiguratorDataSource` protocol
 *
 *  @return The fully initialized `TBFacetTableViewCellConfigurator` instance
 */
- (instancetype)initWithTableView:(UITableView *)tableView dataSource:(id<TBFacetTableViewCellConfiguratorDataSource>)dataSource;

/**
 *  Configures a given `TBFacetTableViewCell`.
 *
 *  Causes the instance to request `facetColor`, `facetColorTop` and `facetColorBottom` from the `TBFacetTableViewCellConfiguratorDataSource` object.
 *
 *  @param cell      The given `TBFacetTableViewCell` to configure
 *  @param indexPath The cell's indexPath
 */
- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath;

@end

/**
 *  This protocol is used by the `TBFacetTableViewCellConfigurator` to request data to configure a given `TBFacetTableViewCell`.
 */
@protocol TBFacetTableViewCellConfiguratorDataSource <NSObject>

/**
 *  Requests the value for the cell's `facetColor` property.
 *
 *  @param facetTableViewCellConfigurator The FacetTableViewCellConfigurator requesting the data
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `facetColor` property
 */
- (UIColor *)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator facetColorForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Requests the value for the cell's `highlightColor` property.
 *
 *  @param facetTableViewCellConfigurator The FacetTableViewCellConfigurator requesting the data
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `highlightColor` property
 */
- (UIColor *)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator highlightColorForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Requests the value for the cell's `pathTop` property.
 *
 *  @param facetTableViewCellConfigurator The FacetTableViewCellConfigurator requesting the data
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `pathTop` property
 */
- (CGPathRef)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator topPathForCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Requests the value for the cell's `pathBottom` property.
 *
 *  @param facetTableViewCellConfigurator The FacetTableViewCellConfigurator requesting the data
 *  @param indexPath The cell's indexPath
 *
 *  @return The cell's `pathBottom` property
 */
- (CGPathRef)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath;

@end
