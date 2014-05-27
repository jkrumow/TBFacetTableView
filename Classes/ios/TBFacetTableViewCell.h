//
//  TBFacetTableViewCell.h
//  TBFacetTableView
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  This class represents a `UITablbeViewCell` shaped like facets. This cells do not look like they have horizontal edges.
 *  The shape of the horizontal edges can be defined by `CGPathRef`s.
 *
 *  To get the effect that the cells fit into each other like a jigsaw the overlapping part of the shape is drawn onto the neighbouring cell.
 *
 *  The cell has three areas that are colored separately. A `facetColor` which defines the fill color of the facet shape itself.
 *  The rectangle below the shape is horizontally split into two stripes each filled with the same color as the `facetColor` of the neighbouring cells.
 */
@interface TBFacetTableViewCell : UITableViewCell

/**
 *  Defines the fill color of the facet shape.
 */
@property (strong, nonatomic) UIColor *facetColor;

/**
 *  Defines the fill color of the cell above.
 */
@property (strong, nonatomic) UIColor *facetColorTop;

/**
 *  Defines the fill color of the cell below.
 */
@property (strong, nonatomic) UIColor *facetColorBottom;

/**
 *  Stores the highlight state of the facet.
 */
@property (nonatomic, assign) BOOL isHighlighted;

/**
 *  The color of the cell's highlight state.
 */
@property (nonatomic, retain) UIColor *highlightColor;

/**
 *  Defines the highlight color of the cell above.
 */
@property (strong, nonatomic) UIColor *highlightColorTop;

/**
 *  Defines the highlight color of the cell below.
 */
@property (strong, nonatomic) UIColor *highlightColorBottom;


/**
 *  Stores the path of the top edge of the facet.
 */
@property (assign, nonatomic) CGPathRef pathTop;

/**
 *  Stores the path of the bottom edge of the facet.
 */
@property (assign, nonatomic) CGPathRef pathBottom;

/**
 *  The cells reuse identifier.
 *
 *  @return The cell's reuse identifier as a string.
 */
+ (NSString *)reuseIdentifier;

/**
 *  Sets the highlight state of the top section - synchronously to the highlight state of the cell above.
 *
 *  @param highlighted Set to `YES` to highlight the cell
 *  @param animated    Set to `YES` to animate the change of the highlighting state
 */
- (void)setHighlightedTop:(BOOL)highlighted animated:(BOOL)animated;

/**
 *  Sets the highlight state of the bottom section - synchronously to the highlight state of the cell below.
 *
 *  @param highlighted Set to `YES` to highlight the cell
 *  @param animated    Set to `YES` to animate the change of the highlighting state
 */
- (void)setHighlightedBottom:(BOOL)highlighted animated:(BOOL)animated;

@end
