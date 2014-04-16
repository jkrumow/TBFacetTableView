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
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFacetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TBFacetTableViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.facetColor = [self colorForIndexPath:indexPath];
    
    cell.facetColorTop = [self colorForIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
    cell.facetColorBottom = [self colorForIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
    
    cell.pathTop = [self pathForCellAtIndexPath:indexPath];
    cell.pathBottom = [self pathForCellAtIndexPath:indexPath];
    
    
    cell.facetTextLabel.text = [NSString stringWithFormat:@"Item%li", (long)indexPath.row];
    
    return cell;
}

- (UIColor *)colorForIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = indexPath.row;
    return _cellColors[row%_cellColors.count];
}

- (CGPathRef)pathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_facetTableView cellForRowAtIndexPath:indexPath];
    CGRect rect = cell.bounds;
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat w = 320.f; //rect.size.width;
    CGFloat h = 80.f;//rect.size.height;
    
    /****/
    // Avoid drawing the path beyond the next cell
    //CGFloat controlYOffset = verticalVelocity*2>(h/2)?(h/2):verticalVelocity*2;
    
    // Bezier control points
    CGFloat controlPointX2, controlPointX3;
    controlPointX3 = controlPointX2;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, x, y);
    CGPathAddLineToPoint(path, NULL, 30.f, 10.f);
    CGPathAddLineToPoint(path, NULL, 120.f, 10.f);
    CGPathAddLineToPoint(path, NULL, 130.f, -10.f);
    CGPathAddLineToPoint(path, NULL, x+w, y );
    
    /****/
    
    return path;
}

#pragma mark - TBFacetTableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}


/*
 - override layoutSubviews in table to push table cells into each other?
 - use transform to shift path between top and bottom position

 
 */



@end
