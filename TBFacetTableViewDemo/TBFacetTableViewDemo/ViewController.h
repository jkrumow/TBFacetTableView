//
//  ViewController.h
//  TBFacetTableViewDemo
//
//  Created by Julian Krumow on 16.04.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBFacetTableViewCellManager.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, TBFacetTableViewCellManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *facetTableView;

@end
