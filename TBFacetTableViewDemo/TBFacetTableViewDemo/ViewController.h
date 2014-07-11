//
//  ViewController.h
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBFacetTableViewCellConfigurator.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, TBFacetTableViewCellConfiguratorDataSource>

@property (weak, nonatomic) IBOutlet UITableView *facetTableView;

@end
