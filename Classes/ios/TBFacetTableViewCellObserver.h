//
//  TBFacetTableViewCellObserver.h
//  TBFacetTableView
//
//  Created by Julian Krumow on 26.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TBFacetTableViewCell.h"

static void *highlightContext = &highlightContext;
static NSString *highlightKeyPath = @"isHighlighted";

/**
 *  This class observes the state of given `TBFacetTableViewCell`s in a specified `UITableView`
 */
@interface TBFacetTableViewCellObserver : NSObject

/**
 *  Initializes the `TBFacetTableViewCellObserver` with a given `UITableView`.
 *
 *  @param tableView A given `UITableView`
 *
 *  @return The fully initialized `TBFacetTableViewCellObserver` instance
 */

- (instancetype)initWithTableView:(UITableView *)tableView;

/**
 *  Registers a given cell with the `TBFacetTableViewCellObserver`.
 *
 *  @param cell The given `TBFacetTableViewCell` to register
 */
- (void)registerCell:(TBFacetTableViewCell *)cell;

@end
