//
//  ViewController.h
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBFacetTableView.h"

@interface ViewController : UIViewController<TBFacetTableViewDataSource, TBFacetTableViewDelegate>

@property (weak, nonatomic) IBOutlet TBFacetTableView *facetTableView;

@end
