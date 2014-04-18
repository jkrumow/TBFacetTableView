//
//  TBFacetTableViewCellManager.h
//  TBFacetTableView
//
//  Created by Julian Krumow on 18.04.14.
//
//

#import <Foundation/Foundation.h>

#import "TBFacetTableViewCell.h"

@protocol TBFacetTableViewCellManagerDelegate;
@interface TBFacetTableViewCellManager : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<TBFacetTableViewCellManagerDelegate>)delegate;

- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath;

@end

@protocol TBFacetTableViewCellManagerDelegate <NSObject>

- (UIColor *)colorForCellAtIndexPath:(NSIndexPath *)indexPath;
- (CGPathRef)topPathForCellAtIndexPath:(NSIndexPath *)indexPath;
- (CGPathRef)bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath;

@end