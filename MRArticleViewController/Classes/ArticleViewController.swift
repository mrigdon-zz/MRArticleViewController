//
//  ArticleViewController.swift
//  Pods
//
//  Created by Matthew Rigdon on 8/16/16.
//
//

import UIKit

open class ArticleViewController: UIViewController {
    
    // MARK: - Public Properties
    
    open var autoColored: Bool = false
    
    open var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    open var headline: String = "" {
        didSet {
            headlineLabel.text = headline
        }
    }
    
    open var author: String = "" {
        didSet {
            authorLabel.text = "by \(author)"
        }
    }
    
    open var date: Date = Date() {
        didSet {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .long
            dateLabel.text = formatter.string(from: date)
        }
    }
    
    open var body: String = "" {
        didSet {
            bodyLabel.text = body
        }
    }
    
    open var backgroundColor: UIColor = UIColor.white {
        didSet {
            backgroundColorSet = true
            backgroundView.backgroundColor = backgroundColor
            view.backgroundColor = backgroundColor
        }
    }
    
    open var headlineColor: UIColor = UIColor.black {
        didSet {
            headlineColorSet = true
            headlineLabel.textColor = headlineColor
        }
    }
    
    open var dateColor: UIColor = UIColor.black {
        didSet {
            dateColorSet = true
            dateLabel.textColor = dateColor
        }
    }
    
    open var authorColor: UIColor = UIColor.black {
        didSet {
            authorColorSet = true
            authorLabel.textColor = authorColor
        }
    }
    
    open var bodyColor: UIColor = UIColor.black {
        didSet {
            bodyColorSet = true
            bodyLabel.textColor = bodyColor
        }
    }
    
    // MARK: - Private Properties
    
    fileprivate let scrollView = UIScrollView()
    fileprivate let backgroundView = UIView()
    fileprivate let imageView = UIImageView()
    fileprivate let headlineLabel = UILabel()
    fileprivate let authorLabel = UILabel()
    fileprivate let dateLabel = UILabel()
    fileprivate let divider = UIView()
    fileprivate let bodyLabel = UILabel()
    
    fileprivate var backgroundColorSet = false
    fileprivate var headlineColorSet = false
    fileprivate var dateColorSet = false
    fileprivate var authorColorSet = false
    fileprivate var bodyColorSet = false

    // MARK: - UIViewController
    
    override open func viewDidLoad() {
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

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupUI() {
        setupScrollView()
        setupImageView()
        setupHeadline()
        setupAuthor()
        setupDate()
        setupBody()
    }
    
    fileprivate func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(backgroundView)
        NSLayoutConstraint(item: backgroundView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: backgroundView, attribute: .left, relatedBy: .equal, toItem: scrollView, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: backgroundView, attribute: .right, relatedBy: .equal, toItem: scrollView, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: backgroundView, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: backgroundView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.bounds.width).isActive = true
    }
    
    fileprivate func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(imageView)
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: backgroundView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: backgroundView, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: backgroundView, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.bounds.width).isActive = true
    }
    
    fileprivate func setupHeadline() {
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(headlineLabel)
        NSLayoutConstraint(item: headlineLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: headlineLabel, attribute: .left, relatedBy: .equal, toItem: backgroundView, attribute: .left, multiplier: 1, constant: 14).isActive = true
        NSLayoutConstraint(item: headlineLabel, attribute: .right, relatedBy: .equal, toItem: backgroundView, attribute: .right, multiplier: 1, constant: -24).isActive = true
        headlineLabel.numberOfLines = 0
        headlineLabel.sizeToFit()
        headlineLabel.font = UIFont(name: "HelveticaNeue-Light", size: 36)
    }
    
    fileprivate func setupAuthor() {
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(authorLabel)
        NSLayoutConstraint(item: authorLabel, attribute: .top, relatedBy: .equal, toItem: headlineLabel, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: authorLabel, attribute: .left, relatedBy: .equal, toItem: backgroundView, attribute: .left, multiplier: 1, constant: 14).isActive = true
        NSLayoutConstraint(item: authorLabel, attribute: .right, relatedBy: .equal, toItem: backgroundView, attribute: .right, multiplier: 1, constant: -14).isActive = true
        authorLabel.numberOfLines = 0
        authorLabel.sizeToFit()
        authorLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
    }
    
    fileprivate func setupDate() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(dateLabel)
        NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: authorLabel, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: backgroundView, attribute: .left, multiplier: 1, constant: 14).isActive = true
        NSLayoutConstraint(item: dateLabel, attribute: .right, relatedBy: .equal, toItem: backgroundView, attribute: .right, multiplier: 1, constant: -14).isActive = true
        dateLabel.numberOfLines = 0
        dateLabel.sizeToFit()
        dateLabel.font = UIFont(name: "HelveticaNeue", size: 12)
    }
    
    fileprivate func setupBody() {
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(bodyLabel)
        NSLayoutConstraint(item: bodyLabel, attribute: .top, relatedBy: .equal, toItem: dateLabel, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: bodyLabel, attribute: .left, relatedBy: .equal, toItem: backgroundView, attribute: .left, multiplier: 1, constant: 14).isActive = true
        NSLayoutConstraint(item: bodyLabel, attribute: .right, relatedBy: .equal, toItem: backgroundView, attribute: .right, multiplier: 1, constant: -14).isActive = true
        NSLayoutConstraint(item: bodyLabel, attribute: .bottom, relatedBy: .equal, toItem: backgroundView, attribute: .bottom, multiplier: 1, constant: -30).isActive = true
        bodyLabel.numberOfLines = 0
        bodyLabel.sizeToFit()
        bodyLabel.font = UIFont(name: "Georgia", size: 20)
    }

}
