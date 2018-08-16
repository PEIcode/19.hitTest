//
//  ViewController.swift
//  19.hitTest
//
//  Created by xingshulin on 2018/8/16.
//  Copyright © 2018年 xingshulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnClick(_ sender: UIButton) {
        view.backgroundColor = UIColor.init(red:CGFloat(arc4random_uniform(255))/CGFloat(255.0), green:CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue:CGFloat(arc4random_uniform(255))/CGFloat(255.0) , alpha: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

