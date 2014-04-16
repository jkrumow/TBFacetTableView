//
//  TBFacetTableViewDataSource.h
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TBFacetTableViewDataSource <UITableViewDataSource>

- (UIColor *)colorForIndexPath:(NSIndexPath *)indexPath;

@end
