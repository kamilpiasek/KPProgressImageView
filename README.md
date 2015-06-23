# KPProgressImageView

[![CI Status](http://img.shields.io/travis/Kamil Piasek/KPProgressImageView.svg?style=flat)](https://travis-ci.org/Kamil Piasek/KPProgressImageView)
[![Version](https://img.shields.io/cocoapods/v/KPProgressImageView.svg?style=flat)](http://cocoapods.org/pods/KPProgressImageView)
[![License](https://img.shields.io/cocoapods/l/KPProgressImageView.svg?style=flat)](http://cocoapods.org/pods/KPProgressImageView)
[![Platform](https://img.shields.io/cocoapods/p/KPProgressImageView.svg?style=flat)](http://cocoapods.org/pods/KPProgressImageView)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Usage is very simple.

* Add `KPProgressImageView` to your view as you usually do with any UIImageView. 
* Set `tintColor` property to provide color for base image tint. 
* Assign value to `progressTintColor` property to set tint color for part of image that will show your current progress. 
* To provide actual progress value modify `progressPercent` property (notice it's values are between 0.f and 1.f). 
* Using `KPProgressDirection` enum you may optionally set progress direction (by default it's set to `KPProgressDirectionBottomToTop`).

## Requirements

[UIImageTrim](https://github.com/pushpak/UIImageTrim) was used in KPProgressImageView to calculate actual image content insets.

## Installation

KPProgressImageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KPProgressImageView"
```

##Visual demo
Below you can see simple demo of four `KPProgressImageView`'s, each of different direction. Slider modifies current progress from 0 to 100%.

![Demo](http://s23.postimg.org/xax5raepn/Demo.gif)

## Author

Kamil Piasek, kamil.piasek@gmail.com

## License

KPProgressImageView is available under the MIT license. See the LICENSE file for more info.
