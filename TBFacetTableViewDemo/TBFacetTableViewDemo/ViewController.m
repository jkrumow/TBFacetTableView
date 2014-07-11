//
//  ViewController.m
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) TBFacetTableViewCellConfigurator *facetCellConfigurator;
@property (nonatomic, strong) NSArray *cellColors;
@property (nonatomic, strong) NSArray *cellHighlightColors;
@property (nonatomic, assign) CGMutablePathRef pathTop;
@property (nonatomic, assign) CGMutablePathRef pathBottom;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [_facetTableView registerNib:[UINib nibWithNibName:@"FacetTableViewCell" bundle:nil] forCellReuseIdentifier:[TBFacetTableViewCell reuseIdentifier]];
    _facetCellConfigurator = [[TBFacetTableViewCellConfigurator alloc] initWithTableView:_facetTableView dataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 250;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFacetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TBFacetTableViewCell reuseIdentifier] forIndexPath:indexPath];
    [_facetCellConfigurator configureCell:cell atIndexpath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0 + (rand() %50);
}

#pragma mark - TBFacetTableViewCellConfiguratorDataSource

- (UIColor *)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator facetColorForCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = indexPath.row;
    UIColor *cellColor = (indexPath.row >= [self tableView:_facetTableView numberOfRowsInSection:indexPath.section]) ? [UIColor whiteColor] : self.cellColors[row%self.cellColors.count];
    return cellColor;
}

- (UIColor *)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator highlightColorForCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = indexPath.row;
    UIColor *cellColor = (indexPath.row >= [self tableView:_facetTableView numberOfRowsInSection:indexPath.section]) ? [UIColor whiteColor] : self.cellHighlightColors[row%self.cellHighlightColors.count];
    return cellColor;
}

- (CGPathRef)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator topPathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row % 2) ? self.pathTop : self.pathBottom;
}

- (CGPathRef)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row % 2) ? self.pathBottom : self.pathTop;
}

# pragma mark - model

- (NSArray *)cellColors
{
    if (_cellColors == nil) {
        _cellColors = @[
                        [UIColor colorWithRed:27.0f/255.0f green:191.0f/255.0f blue:161.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:126.0f/255.0f green:113.0f/255.0f blue:128.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:255.0f/255.0f green:79.0f/255.0f blue:75.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:150.0f/255.0f green:214.0f/255.0f blue:217.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:230.0f/255.0f green:213.0f/255.0f blue:143.0f/255.0f alpha:1.0f]
                        ];
        
    }
    return _cellColors;
}

- (NSArray *)cellHighlightColors
{
    if (_cellHighlightColors == nil) {
        _cellHighlightColors = @[
                                 [UIColor colorWithRed:10.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0f],
                                 [UIColor colorWithRed:50.0f/255.0f green:200.0f/255.0f blue:40.0f/255.0f alpha:1.0f],
                                 [UIColor colorWithRed:200.0f/255.0f green:214.0f/255.0f blue:217.0f/255.0f alpha:1.0f],
                                 [UIColor colorWithRed:255.0f/255.0f green:114.0f/255.0f blue:50.0f/255.0f alpha:1.0f],
                                 [UIColor colorWithRed:14.0f/255.0f green:80.0f/255.0f blue:143.0f/255.0f alpha:1.0f]
                                 ];
    }
    return _cellHighlightColors;
}

- (CGMutablePathRef)pathTop
{
    if (_pathTop == NULL) {
        CGFloat x = 0.f;
        CGFloat y = 0.f;
        CGFloat w = _facetTableView.bounds.size.width;
        
        _pathTop = CGPathCreateMutable();
        CGPathMoveToPoint(_pathTop, nil, x, y);
        CGPathAddLineToPoint(_pathTop, NULL, 30.f, 10.f);
        CGPathAddLineToPoint(_pathTop, NULL, 60.f, 10.f);
        CGPathAddLineToPoint(_pathTop, NULL, 80.f, -10.f);
        CGPathAddLineToPoint(_pathTop, NULL, x+w, y );
    }
    return _pathTop;
}

- (CGMutablePathRef)pathBottom
{
    if (_pathBottom == NULL) {
        CGFloat x = 0.f;
        CGFloat y = 0.f;
        CGFloat w = _facetTableView.bounds.size.width;
        
        _pathBottom = CGPathCreateMutable();
        CGPathMoveToPoint(_pathBottom, nil, x, y);
        CGPathAddLineToPoint(_pathBottom, NULL, 30.f, 30.f);
        CGPathAddLineToPoint(_pathBottom, NULL, 120.f, 30.f);
        CGPathAddLineToPoint(_pathBottom, NULL, 130.f, -30.f);
        CGPathAddLineToPoint(_pathBottom, NULL, x+w, y );
    }
    return _pathBottom;
}

@end
