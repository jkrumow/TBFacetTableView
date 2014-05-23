# TBFacetTableView

[![Version](http://cocoapod-badges.herokuapp.com/v/TBFacetTableView/badge.png)](http://cocoadocs.org/docsets/TBFacetTableView)
[![Platform](http://cocoapod-badges.herokuapp.com/p/TBFacetTableView/badge.png)](http://cocoadocs.org/docsets/TBFacetTableView)

A UITableView with cells shaped like facets.

![Screenshot](https://github.com/tarbrain/TBFacetTableView/raw/master/Documentation/Images/Screenshots/screenshot.png)

## Usage

To run the example project; clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TBFacetTableView is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "TBFacetTableView"

## Usage

To use TBFacetTableView pod just use the `TBFacetTableViewCellConfigurator` to configure `TBFacetTableViewCells`.

```
#import "TBFacetTableViewCellConfigurator.h"
```

Your view controller class must implement the `TBFacetTableViewCellConfiguratorDelegate` protocol.

Create an instance of `TBFacetTableViewCellConfigurator` passing a regular `UITableView` instance or subtype:

```
_facetCellConfigurator = [[TBFacetTableViewCellConfigurator alloc] initWithTableView:_facetTableView delegate:self];
```

Use it to configure your `TBFacetTableViewCell`:

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFacetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TBFacetTableViewCell reuseIdentifier] forIndexPath:indexPath];
    [_facetCellConfigurator configureCell:cell atIndexpath:indexPath];
        
    return cell;
}
```

In the delegate methods `- (CGPathRef)topPathForCellAtIndexPath:(NSIndexPath *)indexPath` and `- (CGPathRef)bottomPathForCellAtIndexPath:(NSIndexPath *)indexPath` return the corresponding `CGPathRef`.

## Author

Julian Krumow, julian.krumow@tarbrain.com

## License

TBFacetTableView is available under the MIT license. See the LICENSE file for more info.

