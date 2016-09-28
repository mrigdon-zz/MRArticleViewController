# MRArticleViewController

[![CI Status](http://img.shields.io/travis/mrigdon/MRArticleViewController.svg?style=flat)](https://travis-ci.org/Matthew Rigdon/MRArticleViewController)
[![Version](https://img.shields.io/cocoapods/v/MRArticleViewController.svg?style=flat)](http://cocoapods.org/pods/MRArticleViewController)
[![License](https://img.shields.io/cocoapods/l/MRArticleViewController.svg?style=flat)](http://cocoapods.org/pods/MRArticleViewController)
[![Platform](https://img.shields.io/cocoapods/p/MRArticleViewController.svg?style=flat)](http://cocoapods.org/pods/MRArticleViewController)

This framework allows you to easily setup View Controllers to display News Articles inspired by those from the Apple News App. Simply set the required fields and run, and you will have a nice looking view for your articles.

![Preview](https://raw.githubusercontent.com/mrigdon/MRArticleViewController/master/preview1.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 2.X

## Installation

MRArticleViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MRArticleViewController"
```

## Usage

1. Import the module

  ```swift
  import MRArticleViewController
  ```

2. Subclass `ArticleViewController`

  ```swift
  class ViewController: ArticleViewController
  ```

3. In `viewDidLoad`, set the following properties *before* `super.viewDidLoad()` like so:

  ```swift
  override func viewDidLoad() {
      // required
      image = UIImage(named: "pulpfiction")!
      headline = "LA gangsters witness supposed \"Divine Intervention\""
      author = "Quentin Tarantino"
      date = NSDate()
      body = bodyText

      // optional; defaults to false. If left false, the background will be white and all the text will be black.
      autoColored = true

      super.viewDidLoad()
  }
  ```

4. Optional: If you aren't satisfied with either the default coloring, or autoColoring, you can set each element's color individually:

  ```swift
  ...
  
  backgroundColor = UIColor.blackColor()
  headlineColor = UIColor.yellowColor()
  authorColor = UIColor.orangeColor()
  dateColor = UIColor.grayColor()
  bodyColor = UIColor.grayColor()
  
  super.viewDidLoad()
  ```
  
Done!

#### More on `autoColor`

This library leverages [UIImageColors](https://github.com/jathu/UIImageColors). Setting `autoColor = true` extracts the colors from the `image` and applies the 
* background color to the background
* the primary color to the headline
* the detail color to the date and body
* and the secondary color to the author. 

## Author

Matthew Rigdon, rigdonmr@gmail.com

## License

MRArticleViewController is available under the MIT license. See the LICENSE file for more info.
