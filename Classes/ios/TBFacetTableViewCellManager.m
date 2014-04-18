//
//  TBFacetTableViewCellManager.m
//  TBFacetTableView
//
//  Created by Julian Krumow on 18.04.14.
//
//

#import "TBFacetTableViewCellManager.h"

static void     *highlightContext = &highlightContext;
static NSString *highlightKeyPath = @"isHighlighted";

@interface TBFacetTableViewCellManager ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) id<TBFacetTableViewCellManagerDelegate> delegate;

@end

@implementation TBFacetTableViewCellManager

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<TBFacetTableViewCellManagerDelegate>)delegate
{
    self = [super init];
    if (self) {
        
        _tableView = tableView;
        _delegate = delegate;
        
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
    
    @try {
        [cell removeObserver:self forKeyPath:highlightKeyPath context:highlightContext];
    } @catch(id Exception) {
        
    }
    [cell addObserver:self forKeyPath:highlightKeyPath options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:highlightContext];
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

