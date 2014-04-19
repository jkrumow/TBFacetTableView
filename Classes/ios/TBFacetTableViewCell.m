//
//  TBFacetTableViewCell.m
//  TBFacetTableView
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import "TBFacetTableViewCell.h"

@interface TBFacetTableViewCell ()

@property (nonatomic, retain) UIColor *highlightColor;
@property (nonatomic, retain) UIColor *currentColor;
@property (nonatomic, retain) UIColor *currentColorTop;
@property (nonatomic, retain) UIColor *currentColorBottom;

@end

@implementation TBFacetTableViewCell

+ (NSString *)reuseIdentifier
{
    return @"TBFacetTableViewCellReuseIdentifier";
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initialize];
        
    }
    return self;
}

- (void)awakeFromNib
{
    [self initialize];
    _highlightColor = [UIColor whiteColor];
}


- (void)initialize
{
    [self setBackgroundColor:[UIColor clearColor]];
    [self setSelectedBackgroundView:nil];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setNeedsDisplay];
}

- (void)setFacetColor:(UIColor *)facetColor
{
    _facetColor = facetColor;
    _currentColor = facetColor;
    [self initialize];
}

- (void)setFacetColorTop:(UIColor *)facetColorTop
{
    _facetColorTop = facetColorTop;
    _currentColorTop = facetColorTop;
}

- (void)setFacetColorBottom:(UIColor *)facetColorBottom
{
    _facetColorBottom = facetColorBottom;
    _currentColorBottom = facetColorBottom;
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    // Fill colors top and bottom
    CGContextSetFillColorWithColor(ctx, [_currentColorTop CGColor]);
    CGRect rectTop = CGRectMake(x, y, w, h/2);
    CGContextFillRect(ctx, rectTop);
    CGContextSetFillColorWithColor(ctx, [_currentColorBottom CGColor]);
    CGRect rectBottom = CGRectMake(x, y+h/2, w, h/2);
    CGContextFillRect(ctx, rectBottom);
    
    // Draw the path from both sub paths
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Draw bottom edge - scale if necessary
    CGRect pathRect = CGPathGetPathBoundingBox(_pathBottom);
    CGFloat currentWidthScale = self.bounds.size.width / pathRect.size.width;
    CGAffineTransform stretch = CGAffineTransformMakeScale(currentWidthScale, 1);
    CGPathAddPath(path, &stretch, _pathBottom);
    
    // Draw right edge
    CGPathAddLineToPoint(path, nil, x+w, y+h);
    
    // Draw top edge - scale if necessary
    pathRect = CGPathGetPathBoundingBox(_pathTop);
    currentWidthScale = self.bounds.size.width / pathRect.size.width;
    stretch = CGAffineTransformMakeScale(currentWidthScale, 1);
    CGMutablePathRef stretchedPath = CGPathCreateMutable();
    CGPathAddPath(stretchedPath, &stretch, _pathTop);
    
    // Shift up the path
    CGAffineTransform shiftUp = CGAffineTransformMakeTranslation(0.f, y+h);
    CGPathAddPath(path, &shiftUp, stretchedPath);

    // Draw left edge
    CGPathAddLineToPoint(path, nil, x, y);
    CGPathCloseSubpath(path);
    
    // Fill main cell color
    CGContextAddPath(ctx, path);
    CGContextSetFillColorWithColor(ctx, [_currentColor CGColor]);
    CGContextFillPath(ctx);
    CGPathRelease(path);
}

- (void)setHighlightedTop:(BOOL)highlighted animated:(BOOL)animated
{
    _currentColorTop = (highlighted) ? _highlightColor : _facetColorTop;
    [self setNeedsDisplay];
}

- (void)setHighlightedBottom:(BOOL)highlighted animated:(BOOL)animated
{
    _currentColorBottom = (highlighted) ? _highlightColor : _facetColorBottom;
    [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    self.isHighlighted = highlighted;
    
    _currentColor = (highlighted) ? _highlightColor : _facetColor;
    [self setNeedsDisplay];
}

@end
