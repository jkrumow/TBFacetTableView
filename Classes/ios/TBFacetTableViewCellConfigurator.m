//
//  TBFacetTableViewDataSource.m
//  TBFacetTableView
//
//  Created by Julian Krumow on 18.04.14.
//
//

#import "TBFacetTableViewCellConfigurator.h"

@interface TBFacetTableViewCellConfigurator ()

@property (nonatomic, assign) id<TBFacetTableViewCellConfiguratorDelegate> delegate;

@end

@implementation TBFacetTableViewCellConfigurator

- (instancetype)initWithDelegate:(id<TBFacetTableViewCellConfiguratorDelegate>)delegate
{
    self = [super init];
    if (self) {
        
        _delegate = delegate;
        
    }
    return self;
}

- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath
{
    cell.facetColor = [self.delegate colorForIndexPath:indexPath];
    cell.pathTop = [self.delegate topPathForCellAtIndexPath:indexPath];
    cell.pathBottom = [self.delegate bottomPathForCellAtIndexPath:indexPath];
    
    cell.facetColorTop = [self.delegate colorForIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    cell.facetColorBottom = [self.delegate colorForIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
}

@end

