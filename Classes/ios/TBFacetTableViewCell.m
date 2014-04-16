//
//  TBFacetTableViewCell.m
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import "TBFacetTableViewCell.h"

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
    [self initialize];
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    // Filling colors top and bottom
    CGContextSetFillColorWithColor(ctx, [_facetColorTop CGColor]);
    CGRect rectTop = CGRectMake(x, y, w, h/2);
    CGContextFillRect(ctx, rectTop);
    CGContextSetFillColorWithColor(ctx, [_facetColorBottom CGColor]);
    CGRect rectBottom = CGRectMake(x, y+h/2, w, h/2);
    CGContextFillRect(ctx, rectBottom);
    
    // Draw the path from both sub paths
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Draw top
    CGPathAddPath(path, NULL, _pathBottom);
    CGPathAddLineToPoint(path, nil, x+w, y+h);
    
    /** shift up **/
    CGAffineTransform shiftUp = CGAffineTransformMakeTranslation(0.f, y+h);
    CGPathAddPath(path, &shiftUp, _pathTop);
    
    // Draw bottom
    CGPathAddLineToPoint(path, nil, x, y);
    CGPathCloseSubpath(path);
    
    CGContextAddPath(ctx, path);
    CGContextSetFillColorWithColor(ctx, [_facetColor CGColor]);
    CGContextFillPath(ctx);
    CGPathRelease(path);
}

@end
