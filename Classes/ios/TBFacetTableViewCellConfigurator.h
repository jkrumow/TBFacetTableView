//
//  TBFacetTableViewDataSource.h
//  TBFacetTableView
//
//  Created by Julian Krumow on 18.04.14.
//
//

#import <Foundation/Foundation.h>

#import "TBFacetTableViewCell.h"

@protocol TBFacetTableViewCellConfiguratorDelegate;
@interface TBFacetTableViewCellConfigurator : NSObject

- (instancetype)initWithDelegate:(id<TBFacetTableViewCellConfiguratorDelegate>)delegate;

- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath;

@end

@protocol TBFacetTableViewCellConfiguratorDelegate <NSObject>

- (UIColor *)colorForIndexPath:(NSIndexPath *)indexPath;
- (CGPathRef)topPathForCellAtIndexPath:(NSIndexPath *)indexPath;
- (CGPathRef)bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

@end