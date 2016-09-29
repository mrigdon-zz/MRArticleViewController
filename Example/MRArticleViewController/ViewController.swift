//
//  ViewController.swift
//  MRArticleViewController
//
//  Created by Matthew Rigdon on 08/16/2016.
//  Copyright (c) 2016 Matthew Rigdon. All rights reserved.
//

import UIKit
import MRArticleViewController

class ViewController: ArticleViewController {
    
    let bodyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et magna elit. Curabitur eleifend orci quis ligula elementum ullamcorper a sit amet diam. Donec facilisis odio lectus, id viverra massa fermentum non. Mauris efficitur orci nec sem hendrerit hendrerit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi commodo quis nunc egestas porttitor. Fusce facilisis leo sed ipsum pulvinar suscipit. Etiam in orci lacinia, facilisis turpis quis, tincidunt quam. \n\nEtiam nec sollicitudin est. Aliquam convallis dui eget interdum vehicula. Fusce tristique nec ex id euismod. Proin pretium sem ante, vitae ultrices diam finibus ac. Ut lacinia scelerisque sagittis. Ut placerat risus magna, et fermentum nunc malesuada in. Nulla vitae massa facilisis, iaculis sapien commodo, lacinia justo. \n\nVestibulum id tristique enim. Etiam in augue nec ex euismod ullamcorper. Nam tincidunt ultricies ligula nec finibus. Aenean luctus est in ultricies tempus. Vivamus hendrerit posuere lacinia. Morbi rutrum ultrices pretium. Maecenas eleifend gravida augue. Vestibulum pellentesque ligula non molestie interdum.\n\nMorbi semper felis eget luctus feugiat. Praesent neque ligula, pharetra non tincidunt ut, egestas eget turpis. Nullam sagittis nisi vehicula quam efficitur accumsan. Quisque ac arcu tellus. Sed id dignissim est. Nullam eget est ut orci euismod dictum rutrum sed ipsum. Sed ultricies, purus eu fringilla rutrum, lacus justo tincidunt sem, eget mollis libero nisi sed elit.\n\nSed imperdiet nec est quis porttitor. Sed mollis arcu vitae faucibus mollis. Maecenas mauris nisl, porta eget diam non, pharetra condimentum augue. Duis ac ipsum at nibh placerat aliquam ac vitae est. Praesent porta congue rhoncus. Phasellus finibus accumsan gravida. Nam tristique rhoncus interdum. Pellentesque ac tempor magna, iaculis auctor urna. Nunc luctus tortor vitae mauris consequat convallis. Phasellus sed ex nec neque imperdiet consectetur. Donec ultricies tortor ut magna dictum, et ultrices urna tristique."

    override func viewDidLoad() {
        image = UIImage(named: "interstellar")!
        headline = "LA gangsters witness supposed \"Divine Intervention\""
        author = "Quentin Tarantino"
        date = NSDate() as Date
        body = bodyText
        autoColored = true
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

