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
@property (nonatomic, assign) id<TBFacetTableViewCellConfiguratorDelegate> delegate;
@property (nonatomic, strong) TBFacetTableViewCellObserver *cellObserver;

@end

@implementation TBFacetTableViewCellConfigurator

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<TBFacetTableViewCellConfiguratorDelegate>)delegate
{
    self = [super init];
    if (self) {
        
        _tableView = tableView;
        _delegate = delegate;
        
        _cellObserver = [[TBFacetTableViewCellObserver alloc] initWithTableView:_tableView];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)configureCell:(TBFacetTableViewCell *)cell atIndexpath:(NSIndexPath *)indexPath
{
    cell.facetColor = [self.delegate colorForCellAtIndexPath:indexPath];
    cell.pathTop = [self.delegate topPathForCellAtIndexPath:indexPath];
    cell.pathBottom = [self.delegate bottomPathForCellAtIndexPath:indexPath];
    
    cell.facetColorTop = [self.delegate colorForCellAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    cell.facetColorBottom = [self.delegate colorForCellAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
    
    [_cellObserver registerCell:cell];
}



@end

