//
//  ArticleViewController.swift
//  Pods
//
//  Created by Matthew Rigdon on 8/16/16.
//
//

import UIKit
import SnapKit
import UIImageColors

public enum LayoutStyle {
    case First
}

public class ArticleViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
        }
    }
    
    public var headline: String {
        get {
            return headlineLabel.text ?? ""
        }
        set(text) {
            headlineLabel.text = text
        }
    }
    
    public var author: String {
        get {
            let author = authorLabel.text ?? ""
            let index = author.startIndex.advancedBy(3)
            return author.substringFromIndex(index)
        }
        set(text) {
            authorLabel.text = "by \(text)"
        }
    }
    
    public var date: NSDate? {
        get {
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .LongStyle
            return formatter.dateFromString(dateLabel.text ?? "")
        }
        set(date) {
            if let date = date {
                let formatter = NSDateFormatter()
                formatter.dateStyle = .MediumStyle
                formatter.timeStyle = .LongStyle
                dateLabel.text = formatter.stringFromDate(date)
            }
        }
    }
    
    public var body: String {
        get {
            return bodyLabel.text ?? ""
        }
        set(text) {
            bodyLabel.text = text
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
    
    // MARK: - Public Methods
    
    public func autoColor() {
        image?.getColors { colors in
            self.backgroundView.backgroundColor = colors.backgroundColor
            self.view.backgroundColor = colors.backgroundColor
            self.headlineLabel.textColor = colors.primaryColor
            self.dateLabel.textColor = colors.detailColor
            self.authorLabel.textColor = colors.secondaryColor
            self.bodyLabel.textColor = colors.detailColor
        }
    }

    // MARK: - UIViewController
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupImageView()
        setupHeadline()
        setupAuthor()
        setupDate()
        setupBody()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private Methods
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp_makeConstraints(closure: { make in
            make.top.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
        })
        
        scrollView.addSubview(backgroundView)
        backgroundView.snp_makeConstraints(closure: { make in
            make.top.equalTo(scrollView)
            make.right.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.width.equalTo(view)
        })
    }
    
    private func setupImageView() {
        backgroundView.addSubview(imageView)
        imageView.snp_makeConstraints(closure: { make in
            make.top.equalTo(backgroundView)
            make.right.equalTo(backgroundView)
            make.left.equalTo(backgroundView)
            make.height.equalTo(view.bounds.width)
        })
    }
    
    private func setupHeadline() {
        backgroundView.addSubview(headlineLabel)
        headlineLabel.snp_makeConstraints(closure: { make in
            make.top.equalTo(imageView.snp_bottom).offset(8)
            make.right.equalTo(backgroundView).offset(-24)
            make.left.equalTo(backgroundView).offset(14)
        })
        headlineLabel.numberOfLines = 0
        headlineLabel.sizeToFit()
        headlineLabel.font = UIFont(name: "HelveticaNeue-Light", size: 36)
    }
    
    private func setupAuthor() {
        backgroundView.addSubview(authorLabel)
        authorLabel.snp_makeConstraints(closure: { make in
            make.top.equalTo(headlineLabel.snp_bottom).offset(8)
            make.right.equalTo(backgroundView).offset(14)
            make.left.equalTo(backgroundView).offset(14)
        })
        authorLabel.numberOfLines = 0
        authorLabel.sizeToFit()
        authorLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
    }
    
    private func setupDate() {
        backgroundView.addSubview(dateLabel)
        dateLabel.snp_makeConstraints(closure: { make in
            make.top.equalTo(authorLabel.snp_bottom).offset(8)
            make.right.equalTo(backgroundView).offset(14)
            make.left.equalTo(backgroundView).offset(14)
        })
        dateLabel.numberOfLines = 0
        dateLabel.sizeToFit()
        dateLabel.font = UIFont(name: "HelveticaNeue", size: 12)
    }
    
    private func setupBody() {
        backgroundView.addSubview(bodyLabel)
        bodyLabel.snp_makeConstraints(closure: { make in
            make.top.equalTo(dateLabel.snp_bottom).offset(20)
            make.right.equalTo(backgroundView).offset(-14)
            make.bottom.equalTo(backgroundView).offset(-30)
            make.left.equalTo(backgroundView).offset(14)
        })
        bodyLabel.numberOfLines = 0
        bodyLabel.sizeToFit()
        bodyLabel.font = UIFont(name: "Georgia", size: 20)
    }

}
