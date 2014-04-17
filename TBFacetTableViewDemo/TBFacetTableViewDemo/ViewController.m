//
//  ViewController.m
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import "ViewController.h"

#import "TBFacetTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *cellColors;
@property (nonatomic, assign) CGMutablePathRef pathTop;
@property (nonatomic, assign) CGMutablePathRef pathBottom;
@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _cellColors = @[[UIColor colorWithRed:27.0f/255.0f green:191.0f/255.0f blue:161.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:126.0f/255.0f green:113.0f/255.0f blue:128.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:255.0f/255.0f green:79.0f/255.0f blue:75.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:150.0f/255.0f green:214.0f/255.0f blue:217.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:230.0f/255.0f green:213.0f/255.0f blue:143.0f/255.0f alpha:1.0f]];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [_facetTableView registerNib:[UINib nibWithNibName:@"FacetTableViewCell" bundle:nil] forCellReuseIdentifier:[TBFacetTableViewCell reuseIdentifier]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TBFacetTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFacetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TBFacetTableViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.facetColor = [self colorForIndexPath:indexPath];
    
    cell.facetColorTop = [self colorForIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    cell.facetColorBottom = [self colorForIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
    
    cell.pathTop = [self pathForCellAtIndexPath:indexPath];
    cell.pathBottom = [self pathForCellAtIndexPath:indexPath];
    
    return cell;
}

- (UIColor *)colorForIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = indexPath.row;
    UIColor *cellColor = (indexPath.row >= [self tableView:_facetTableView numberOfRowsInSection:indexPath.section]) ? [UIColor whiteColor] : _cellColors[row%_cellColors.count];
    return cellColor;
}

- (CGPathRef)pathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    if (_pathTop == NULL) {
        CGFloat x = 0.f;
        CGFloat y = 0.f;
        CGFloat w = _facetTableView.bounds.size.width;
        
        _pathTop = CGPathCreateMutable();
        CGPathMoveToPoint(_pathTop, nil, x, y);
        CGPathAddLineToPoint(_pathTop, NULL, 30.f, 10.f);
        CGPathAddLineToPoint(_pathTop, NULL, 120.f, 10.f);
        CGPathAddLineToPoint(_pathTop, NULL, 130.f, -10.f);
        CGPathAddLineToPoint(_pathTop, NULL, x+w, y );
    }
    
    if (_pathBottom == NULL) {
        CGFloat x = 0.f;
        CGFloat y = 0.f;
        CGFloat w = _facetTableView.bounds.size.width;
        
        _pathBottom = CGPathCreateMutable();
        CGPathMoveToPoint(_pathBottom, nil, x, y);
        CGPathAddLineToPoint(_pathBottom, NULL, 30.f, 10.f);
        CGPathAddLineToPoint(_pathBottom, NULL, 70.f, 0.f);
        CGPathAddLineToPoint(_pathBottom, NULL, 100.f, -10.f);
        CGPathAddLineToPoint(_pathBottom, NULL, x+w, y );
    }

    return (indexPath.row % 2) ? _pathTop : _pathBottom;
}

#pragma mark - TBFacetTableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0 + (rand() %50);
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFacetTableViewCell *cellAbove = (TBFacetTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    [cellAbove setHighlightedBottom:YES animated:NO];
    TBFacetTableViewCell *cellBelow = (TBFacetTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
    [cellBelow setHighlightedTop:YES animated:NO];
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFacetTableViewCell *cellAbove = (TBFacetTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    [cellAbove setHighlightedBottom:NO animated:NO];
    TBFacetTableViewCell *cellBelow = (TBFacetTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
    [cellBelow setHighlightedTop:NO animated:NO];
}

@end
