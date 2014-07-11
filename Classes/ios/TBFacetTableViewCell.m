//
//  TBFacetTableViewCell.m
//  TBFacetTableView
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import "TBFacetTableViewCell.h"

@interface TBFacetTableViewCell ()

@property (nonatomic, retain) UIColor *currentColor;
@property (nonatomic, retain) UIColor *currentTopColor;
@property (nonatomic, retain) UIColor *currentBottomColor;

@end

@implementation TBFacetTableViewCell

+ (NSString *)reuseIdentifier
{
    return @"TBFacetTableViewCellReuseIdentifier";
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
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

- (void)setFacetTopColor:(UIColor *)facetTopColor
{
    _facetTopColor = facetTopColor;
    _currentTopColor = facetTopColor;
}

- (void)setFacetBottomColor:(UIColor *)facetBottomColor
{
    _facetBottomColor = facetBottomColor;
    _currentBottomColor = facetBottomColor;
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    // Fill colors top and bottom
    CGContextSetFillColorWithColor(ctx, [_currentTopColor CGColor]);
    CGRect rectTop = CGRectMake(x, y, w, h/2);
    CGContextFillRect(ctx, rectTop);
    CGContextSetFillColorWithColor(ctx, [_currentBottomColor CGColor]);
    CGRect rectBottom = CGRectMake(x, y+h/2, w, h/2);
    CGContextFillRect(ctx, rectBottom);
    
    // Draw the path from both sub paths
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Draw top edge - scale if necessary
    CGRect pathRect = CGPathGetPathBoundingBox(_topPath);
    CGFloat currentWidthScale = self.bounds.size.width / pathRect.size.width;
    CGAffineTransform stretch = CGAffineTransformMakeScale(currentWidthScale, 1);
    CGPathAddPath(path, &stretch, _topPath);
    
    // Draw right edge
    CGPathAddLineToPoint(path, nil, x+w, y+h);
    
    // Draw bottom edge - scale if necessary
    pathRect = CGPathGetPathBoundingBox(_bottomPath);
    currentWidthScale = self.bounds.size.width / pathRect.size.width;
    stretch = CGAffineTransformMakeScale(currentWidthScale, 1);
    CGMutablePathRef stretchedPath = CGPathCreateMutable();
    CGPathAddPath(stretchedPath, &stretch, _bottomPath);
    
    // Shift down the path
    CGAffineTransform shiftDown = CGAffineTransformMakeTranslation(0.f, y+h);
    CGPathAddPath(path, &shiftDown, stretchedPath);
    CGPathRelease(stretchedPath);

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
    _currentTopColor = (highlighted) ? _highlightTopColor : _facetTopColor;
    [self setNeedsDisplay];
}

- (void)setHighlightedBottom:(BOOL)highlighted animated:(BOOL)animated
{
    _currentBottomColor = (highlighted) ? _highlightBottomColor : _facetBottomColor;
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
