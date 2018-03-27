# SplitSlider

[![CI Status](http://img.shields.io/travis/3ph/SplitSlider.svg?style=flat)](https://travis-ci.org/3ph/SplitSlider)
[![Version](https://img.shields.io/cocoapods/v/SplitSlider.svg?style=flat)](http://cocoapods.org/pods/SplitSlider)
[![License](https://img.shields.io/cocoapods/l/SplitSlider.svg?style=flat)](http://cocoapods.org/pods/SplitSlider)
[![Platform](https://img.shields.io/cocoapods/p/SplitSlider.svg?style=flat)](http://cocoapods.org/pods/SplitSlider)
![Swift](https://img.shields.io/badge/in-swift4.0-orange.svg)

Customizable two way slider split in the middle. Left and right parts are independent, each can have different min,
max, step, colors, etc.

<img src="./screenshot.gif" alt="Screenshot" />

## Usage

Simply add as custom view to storyboard or create programatically.

```swift
let slider = SplitSlider()
```

#### Generic slider properties (affects both parts):

```swift
// Minimal slider value.
slider.min = 0
```
```swift
// Maximal slider value.
slider.max = 100
```
```swift
// Step value of the slider.
slider.step = 5
```
```swift
// Font of the value labels.
slider.labelFont = UIFont.systemFont(ofSize: 10)
```
```swift
// Font color of the value labels.
slider.labelTextColor = UIColor.black
```
```swift
// Size of the slider's thumb.
slider.thumbSize = 20
```
```swift
// Color of the thumb.
slider.thumbColor = UIColor.darkGray
```
```swift
// Track height.
slider.trackHeight = 0
```
```swift
// Track color.
slider.trackColor = = UIColor.lightGray
```
```swift
// Color of selected part of the track.
slider.trackHighlightColor = UIColor.gray
```
```swift
// Determines if thumb should be snapped to the closest step after the move.
slider.snapToStep = true
```

All above properties would affect both portions of the slider but can be set individually through either `slider.left` or `slider.right` portion.

#### Delegate methods
```swift
// Called when user selects (holds) portion of the slider. Return `nil` when no portion is being hold.
slider(_ slider: SplitSlider, didSelect portion: SplitSliderPortion?)

// Called when user drags the thumb and portion value is thus updated.
slider(_ slider: SplitSlider, didUpdate value: CGFloat, for portion: SplitSliderPortion)
```

## Example

To run the example project, run `pod try`.

## Requirements
iOS 8+.

## Installation

SplitSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SplitSlider"
```

## Author

Tomas Friml, instantni.med@gmail.com

## License

SplitSlider is available under the MIT license. See the LICENSE file for more info.
