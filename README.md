# MRArticleViewController

[![CI Status](http://img.shields.io/travis/mrigdon/MRArticleViewController.svg?style=flat)](https://travis-ci.org/mrigdon/MRArticleViewController)
[![Version](https://img.shields.io/cocoapods/v/MRArticleViewController.svg?style=flat)](http://cocoapods.org/pods/MRArticleViewController)
[![License](https://img.shields.io/cocoapods/l/MRArticleViewController.svg?style=flat)](http://cocoapods.org/pods/MRArticleViewController)
[![Platform](https://img.shields.io/cocoapods/p/MRArticleViewController.svg?style=flat)](http://cocoapods.org/pods/MRArticleViewController)

This framework allows you to easily setup View Controllers to display News Articles inspired by those from the Apple News App. Simply set the required fields and run, and you will have a nice looking view for your articles.

![Preview](https://raw.githubusercontent.com/mrigdon/MRArticleViewController/master/preview1.png)
![Preview](https://raw.githubusercontent.com/mrigdon/MRArticleViewController/master/preview2.png)
![Preview](https://raw.githubusercontent.com/mrigdon/MRArticleViewController/master/preview3.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Swift 3: use current
- Swift 2: use v0.2.0

## Installation

MRArticleViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MRArticleViewController'
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

3. In `viewDidLoad`, set the following **required** properties *before* `super.viewDidLoad()`:

  ```swift
  override func viewDidLoad() {
      // required
      imageView.image = UIImage(named: "pulpfiction")!
      headline = "LA gangsters witness supposed \"Divine Intervention\""
      author = "Quentin Tarantino"
      date = NSDate()
      body = bodyText

      super.viewDidLoad()
  }
  ```

4. Optional: In `viewDidLoad`, set the following **optional** properties *before* `super.viewDidLoad()`:

  ```swift
  ...
  
  // Uses the algorithm from UIImageColors to extract the colors from the image and color the
  // background, headline, author, date, and body accordingly. Defaults to false, but highly
  // recommended to set to true. More on this feature below.
  autoColored = true
  
  // If you don't like the autoColor feature, you can also color each component individually
  backgroundColor = UIColor.black
  headlineColor = UIColor.yellow
  authorColor = UIColor.orange
  dateColor = UIColor.gray
  bodyColor = UIColor.gray
  
  super.viewDidLoad()
  ```
  
Done! :beers:

## More on `autoColored`

This library leverages the algorithm from [UIImageColors](https://github.com/jathu/UIImageColors). Setting `autoColor = true` extracts the colors from the `image` and applies the 
* background color to the background
* the primary color to the headline
* the detail color to the date and body
* and the secondary color to the author.

Note that UIImageColors is not a dependency, the code has just been ported into this library.

## To-do

Want a feature you don't see? Submit an issue and I'll add it to the to-do list, or hack it yourself and submit a pull request.

- [ ] Add new styles
- [ ] Swift package manager

## Author

Matthew Rigdon, rigdonmr@gmail.com

## License

MRArticleViewController is available under the MIT license. See the LICENSE file for more info. Please also refer to Panic's [original license](https://github.com/panicinc/ColorArt/#license) for the autoColor feature.
