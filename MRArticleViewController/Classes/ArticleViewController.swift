//
//  ArticleViewController.swift
//  Pods
//
//  Created by Matthew Rigdon on 8/16/16.
//
//

import UIKit
import UIImageColors

public class ArticleViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var autoColored: Bool = false
    
    public var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    public var headline: String = "" {
        didSet {
            headlineLabel.text = headline
        }
    }
    
    public var author: String = "" {
        didSet {
            authorLabel.text = "by \(author)"
        }
    }
    
    public var date: NSDate = NSDate() {
        didSet {
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .LongStyle
            dateLabel.text = formatter.stringFromDate(date)
        }
    }
    
    public var body: String = "" {
        didSet {
            bodyLabel.text = body
        }
    }
    
    public var backgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            backgroundColorSet = true
            backgroundView.backgroundColor = backgroundColor
            view.backgroundColor = backgroundColor
        }
    }
    
    public var headlineColor: UIColor = UIColor.blackColor() {
        didSet {
            headlineColorSet = true
            headlineLabel.textColor = headlineColor
        }
    }
    
    public var dateColor: UIColor = UIColor.blackColor() {
        didSet {
            dateColorSet = true
            dateLabel.textColor = dateColor
        }
    }
    
    public var authorColor: UIColor = UIColor.blackColor() {
        didSet {
            authorColorSet = true
            authorLabel.textColor = authorColor
        }
    }
    
    public var bodyColor: UIColor = UIColor.blackColor() {
        didSet {
            bodyColorSet = true
            bodyLabel.textColor = bodyColor
        }
    }
    
    // MARK: - Private Properties
    
    private let scrollView = UIScrollView()
    private let backgroundView = UIView()
    private let imageView = UIImageView()
    private let headlineLabel = UILabel()
    private let authorLabel = UILabel()
    private let dateLabel = UILabel()
    private let divider = UIView()
    private let bodyLabel = UILabel()
    
    private var backgroundColorSet = false
    private var headlineColorSet = false
    private var dateColorSet = false
    private var authorColorSet = false
    private var bodyColorSet = false

    // MARK: - UIViewController
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // if autoColored, setup after extracting color; otherwise, setup now.
        if autoColored {
            image.getColors { colors in
                self.backgroundColor = self.backgroundColorSet ? self.backgroundColor : colors.backgroundColor
                self.headlineColor = self.headlineColorSet ? self.headlineColor : colors.primaryColor
                self.dateColor = self.dateColorSet ? self.dateColor : colors.detailColor
                self.authorColor = self.authorColorSet ? self.authorColor : colors.secondaryColor
                self.bodyColor = self.bodyColorSet ? self.bodyColor : colors.detailColor
                
                self.setupUI()
            }
        } else {
            setupUI()
        }
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupScrollView()
        setupImageView()
        setupHeadline()
        setupAuthor()
        setupDate()
        setupBody()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(backgroundView)
        NSLayoutConstraint(item: backgroundView, attribute: .Top, relatedBy: .Equal, toItem: scrollView, attribute: .Top, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: backgroundView, attribute: .Left, relatedBy: .Equal, toItem: scrollView, attribute: .Left, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: backgroundView, attribute: .Right, relatedBy: .Equal, toItem: scrollView, attribute: .Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: backgroundView, attribute: .Bottom, relatedBy: .Equal, toItem: scrollView, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: backgroundView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: view.bounds.width).active = true
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(imageView)
        NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: backgroundView, attribute: .Top, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Left, relatedBy: .Equal, toItem: backgroundView, attribute: .Left, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Right, relatedBy: .Equal, toItem: backgroundView, attribute: .Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: view.bounds.width).active = true
    }
    
    private func setupHeadline() {
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(headlineLabel)
        NSLayoutConstraint(item: headlineLabel, attribute: .Top, relatedBy: .Equal, toItem: imageView, attribute: .Bottom, multiplier: 1, constant: 8).active = true
        NSLayoutConstraint(item: headlineLabel, attribute: .Left, relatedBy: .Equal, toItem: backgroundView, attribute: .Left, multiplier: 1, constant: 14).active = true
        NSLayoutConstraint(item: headlineLabel, attribute: .Right, relatedBy: .Equal, toItem: backgroundView, attribute: .Right, multiplier: 1, constant: -24).active = true
        headlineLabel.numberOfLines = 0
        headlineLabel.sizeToFit()
        headlineLabel.font = UIFont(name: "HelveticaNeue-Light", size: 36)
    }
    
    private func setupAuthor() {
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(authorLabel)
        NSLayoutConstraint(item: authorLabel, attribute: .Top, relatedBy: .Equal, toItem: headlineLabel, attribute: .Bottom, multiplier: 1, constant: 8).active = true
        NSLayoutConstraint(item: authorLabel, attribute: .Left, relatedBy: .Equal, toItem: backgroundView, attribute: .Left, multiplier: 1, constant: 14).active = true
        NSLayoutConstraint(item: authorLabel, attribute: .Right, relatedBy: .Equal, toItem: backgroundView, attribute: .Right, multiplier: 1, constant: -14).active = true
        authorLabel.numberOfLines = 0
        authorLabel.sizeToFit()
        authorLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
    }
    
    private func setupDate() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(dateLabel)
        NSLayoutConstraint(item: dateLabel, attribute: .Top, relatedBy: .Equal, toItem: authorLabel, attribute: .Bottom, multiplier: 1, constant: 8).active = true
        NSLayoutConstraint(item: dateLabel, attribute: .Left, relatedBy: .Equal, toItem: backgroundView, attribute: .Left, multiplier: 1, constant: 14).active = true
        NSLayoutConstraint(item: dateLabel, attribute: .Right, relatedBy: .Equal, toItem: backgroundView, attribute: .Right, multiplier: 1, constant: -14).active = true
        dateLabel.numberOfLines = 0
        dateLabel.sizeToFit()
        dateLabel.font = UIFont(name: "HelveticaNeue", size: 12)
    }
    
    private func setupBody() {
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(bodyLabel)
        NSLayoutConstraint(item: bodyLabel, attribute: .Top, relatedBy: .Equal, toItem: dateLabel, attribute: .Bottom, multiplier: 1, constant: 20).active = true
        NSLayoutConstraint(item: bodyLabel, attribute: .Left, relatedBy: .Equal, toItem: backgroundView, attribute: .Left, multiplier: 1, constant: 14).active = true
        NSLayoutConstraint(item: bodyLabel, attribute: .Right, relatedBy: .Equal, toItem: backgroundView, attribute: .Right, multiplier: 1, constant: -14).active = true
        NSLayoutConstraint(item: bodyLabel, attribute: .Bottom, relatedBy: .Equal, toItem: backgroundView, attribute: .Bottom, multiplier: 1, constant: -30).active = true
        bodyLabel.numberOfLines = 0
        bodyLabel.sizeToFit()
        bodyLabel.font = UIFont(name: "Georgia", size: 20)
    }

}
