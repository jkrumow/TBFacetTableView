# TBFacetTableView

[![Version](https://img.shields.io/cocoapods/v/TBFacetTableView.svg?style=flat)](http://cocoadocs.org/docsets/TBFacetTableView)
[![License](https://img.shields.io/cocoapods/l/TBFacetTableView.svg?style=flat)](http://cocoadocs.org/docsets/TBFacetTableView)
[![Platform](https://img.shields.io/cocoapods/p/TBFacetTableView.svg?style=flat)](http://cocoadocs.org/docsets/TBFacetTableView)

A UITableView with cells shaped like facets.

![Screenshot facets](https://github.com/tarbrain/TBFacetTableView/raw/master/Documentation/Images/Screenshots/facets.png)

![Screenshot facets highlihgted](https://github.com/tarbrain/TBFacetTableView/raw/master/Documentation/Images/Screenshots/facets_highlighted.png)


## Example project

To run the example project; clone the repo, and run `pod install` from the `TBFacetTableViewDemo` directory first.

## Requirements

* Xcode 5
* iOS 5.0

## Installation

TBFacetTableView is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "TBFacetTableView"

## Usage

This pod consists of three classes:

* `TBFacetTableViewCell` - UITableViewCell shaped like a facet or shard
* `TBFacetTableViewCellConfigurator` - configures the cells
* `TBFacetTableViewCellObserver` - handles the highlight state of the cells

To use the classes in your code just import `TBFacetTableViewCellConfigurator.h`.

### Configuring cells

Implement the `TBFacetTableViewCellConfiguratorDataSource` protocol. The best place is your `UIViewController` subclass or `UITableViewDatasource` implementation:

```objective-c
- (UIColor *)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator facetColorForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return // whatever color you like
}

- (UIColor *)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator highlightColorForCellAtIndexPath:(NSIndexPath *)indexPath;
{
    return // whatever color you like
}

- (CGPathRef)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator topPathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return // whatever CGPathRef you like - should match bottom path of cell above
}

- (CGPathRef)facetTableViewCellConfigurator:(TBFacetTableViewCellConfigurator *)facetTableViewCellConfigurator bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return // whatever CGPathRef you like - should match top path of cell below
}
```

Create an instance of `TBFacetTableViewCellConfigurator` passing a regular `UITableView` instance or subtype:

```objective-c
_facetCellConfigurator = [[TBFacetTableViewCellConfigurator alloc] initWithTableView:_facetTableView
                                                                            dataSource:self];
```

### Configuring cells

Configure your `TBFacetTableViewCell` by passing it and its index path:

```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFacetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TBFacetTableViewCell reuseIdentifier]
                                                                 forIndexPath:indexPath];
    [_facetCellConfigurator configureCell:cell atIndexpath:indexPath];
        
    return cell;
}
```

## Author

Julian Krumow, julian.krumow@tarbrain.com

## License

TBFacetTableView is available under the MIT license. See the LICENSE file for more info.

