# JHBLayoutableButton
a subclass of UIButton, which support to custom layout button' image view and title label.

## 4 layout style support
* image view top, title label bottom
* image view bottom, title label top 
* image view left, title label right
* image view right, title label left

## Installation
* drag source into your project 
* use Cocoapod pod 'JHBLayoutableButton', '~> 0.0.1'

## Usage
import UIButton+JHBLayoutableButton.h file
``` Objective-C
UIButton *button = [UIButton buttonWithLayoutStyle:JHBLayoutableButtonStyleIRTL spaceBetweenImageAndTitle:3.0];
```

## Requirements
* iOS 7.0 or later

## License
MIT
