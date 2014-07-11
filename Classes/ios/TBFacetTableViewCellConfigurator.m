//
//  TBFacetTableViewCellConfigurator.m
//  TBFacetTableView
//
//  Created by Julian Krumow on 18.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import "TBFacetTableViewCellConfigurator.h"
#import "TBFacetTableViewCellObserver.h"


@interface TBFacetTableViewCellConfigurator ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) id<TBFacetTableViewCellConfiguratorDataSource> dataSource;
@property (nonatomic, strong) TBFacetTableViewCellObserver *cellObserver;

@end

@implementation TBFacetTableViewCellConfigurator

- (instancetype)initWithTableView:(UITableView *)tableView dataSource:(id<TBFacetTableViewCellConfiguratorDataSource>)dataSource
{
    self = [super init];
    if (self) {
        
        _tableView = tableView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _dataSource = dataSource;
        _cellObserver = [[TBFacetTableViewCellObserver alloc] initWithTableView:_tableView];
    }
    return self;
}

- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath
{
    cell.topPath = [self.dataSource facetTableViewCellConfigurator:self topPathForCellAtIndexPath:indexPath];
    cell.bottomPath = [self.dataSource facetTableViewCellConfigurator:self bottomPathForCellAtIndexPath:indexPath];
    
    cell.facetColor = [self.dataSource facetTableViewCellConfigurator:self facetColorForCellAtIndexPath:indexPath];
    cell.facetTopColor = [self.dataSource facetTableViewCellConfigurator:self facetColorForCellAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    cell.facetBottomColor = [self.dataSource facetTableViewCellConfigurator:self facetColorForCellAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
    
    cell.highlightColor = [self.dataSource facetTableViewCellConfigurator:self highlightColorForCellAtIndexPath:indexPath];
    cell.highlightTopColor = [self.dataSource facetTableViewCellConfigurator:self highlightColorForCellAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    cell.highlightBottomColor = [self.dataSource facetTableViewCellConfigurator:self highlightColorForCellAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
    
    [_cellObserver registerCell:cell];
}



@end

