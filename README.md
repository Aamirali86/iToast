# iToast

[![CI Status](https://img.shields.io/travis/Aamir/SmartToast.svg?style=flat)](https://travis-ci.org/Aamir/SmartToast)
[![Version](https://img.shields.io/cocoapods/v/SmartToast.svg?style=flat)](https://cocoapods.org/pods/SmartToast)
[![License](https://img.shields.io/cocoapods/l/SmartToast.svg?style=flat)](https://cocoapods.org/pods/SmartToast)
[![Platform](https://img.shields.io/cocoapods/p/SmartToast.svg?style=flat)](https://cocoapods.org/pods/SmartToast)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Features
--------

- **Queueing**: Centralized toast center manages the toast queue.
- **Customizable**: See the [Appearance](#appearance) section.
- **Positionable**: Set the toast position to center, top or bottom

### Usage
---------

```swift
import SmartToast

// basic usage
ToastManager.shared.showToast("Hello world")

// toast with a specific duration and position
ToastManager.shared.showToast("Hello world", duration: ToastManager.LENGHT_LONG, position: .top)

// toast with customized appearance
var style = ToastStyle()
style.backgroundColor = UIColor.red.withAlphaComponent(0.8)
ToastManager.shared.showToast("Hello world", style:style)
```

## Installation

SmartToast is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SmartToast'
```

### Appearance

Supported appearance properties are:

| Property | Type | Description |
|---|---|---|
| `backgroundColor` | `UIColor` | Background color of toast |
| `cornerRadius` | `CGFloat` | Corner radius |
| `shadowOpacity` | `Float` | Toast shadow opacity |
| `shadowColor` | `UIColor` | Shadow color |
| `shadowOffset` | `CGSize` | Shadow offset |
| `shadowRadius` | `CGFloat` | Shadow radius |
|` textColor` | `UIColor` | Toast message color |

Demo
-----

![Screenshot](https://github.com/Aamirali86/iToast/blob/master/Example/taost_demo.gif)

## Author

Muhammad Aamir, aamir-muhammad@hotmail.com

## License

SmartToast is available under the MIT license. See the LICENSE file for more info.
