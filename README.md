# TBFacetTableView

[![Version](http://cocoapod-badges.herokuapp.com/v/TBFacetTableView/badge.png)](http://cocoadocs.org/docsets/TBFacetTableView)
[![Platform](http://cocoapod-badges.herokuapp.com/p/TBFacetTableView/badge.png)](http://cocoadocs.org/docsets/TBFacetTableView)

A UITableView with cells shaped like facets.

![Screenshot facets](https://github.com/tarbrain/TBFacetTableView/raw/master/Documentation/Images/Screenshots/facets.png)

![Screenshot facets highlihgted](https://github.com/tarbrain/TBFacetTableView/raw/master/Documentation/Images/Screenshots/facets_highlighted.png)


## Usage

To run the example project; clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TBFacetTableView is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "TBFacetTableView"

## Usage

This pod consists of three classes:

* `TBFacetTableViewCell` - which can be configured to be shaped like facets or shards
* `TBFacetTableViewCellConfigurator` - to configure the cells
* `TBFacetTableViewCellObserver` - to handle the selection state of the cells

To use the classes in your code just import `TBFacetTableViewCellConfigurator.h`.

Your view controller class must implement the `TBFacetTableViewCellConfiguratorDelegate` protocol:

```objective-c
- (UIColor *)colorForCellAtIndexPath:(NSIndexPath *)indexPath {
    return // whatever color you like
}

- (CGPathRef)topPathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return // whatever CGPathRef you like - must match bottom path of cell above
}

- (CGPathRef)bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return // whatever CGPathRef you like - must match top path of cell below
}
```

Create an instance of `TBFacetTableViewCellConfigurator` passing a regular `UITableView` instance or subtype:

```objective-c
_facetCellConfigurator = [[TBFacetTableViewCellConfigurator alloc] initWithTableView:_facetTableView
                                                                            delegate:self];
```

Use it to configure your `TBFacetTableViewCell`:

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

