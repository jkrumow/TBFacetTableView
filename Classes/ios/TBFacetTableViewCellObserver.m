//
//  TBFacetTableViewCellObserver.m
//  TBFacetTableView
//
//  Created by Julian Krumow on 26.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import "TBFacetTableViewCellObserver.h"


@interface TBFacetTableViewCellObserver ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableSet *registeredCells;

@end

@implementation TBFacetTableViewCellObserver

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        
        _tableView = tableView;
        _registeredCells = [[NSMutableSet alloc] init];
        
    }
    return self;
}

- (void)registerCell:(TBFacetTableViewCell *)cell
{
    if ([_registeredCells containsObject:cell] == NO) {
        [_registeredCells addObject:cell];
        [cell addObserver:self forKeyPath:highlightKeyPath options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:highlightContext];
    }
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if (context == highlightContext && [keyPath isEqualToString:highlightKeyPath]) {
        
        if ([[change objectForKey:NSKeyValueChangeKindKey] integerValue] == NSKeyValueChangeSetting) {
            
            BOOL newHighlight = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
            BOOL oldHighlight = [[change objectForKey:NSKeyValueChangeOldKey] boolValue];
            
            if (newHighlight != oldHighlight) {
                
                if ([object isKindOfClass:[TBFacetTableViewCell class]]) {
                    TBFacetTableViewCell *cell = (TBFacetTableViewCell *)object;
                    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
                    
                    TBFacetTableViewCell *cellAbove = (TBFacetTableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
                    [cellAbove setHighlightedBottom:newHighlight animated:NO];
                    
                    TBFacetTableViewCell *cellBelow = (TBFacetTableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
                    [cellBelow setHighlightedTop:newHighlight animated:NO];
                }
            }
        }
    }
}


@end
