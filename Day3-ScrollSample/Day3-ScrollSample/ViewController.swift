//
//  ViewController.swift
//  Day3-ScrollSample
//
//  Created by iMac_15 on 2020. 7. 15..
//  Copyright © 2020년 KPU ios app dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var coordLabel: UILabel!
}

extension ViewController: UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pt = scrollView.contentOffset
        coordLabel.text = "(\(Int(pt.x)), \(Int(pt.y)))"
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("applicationDidBecomeActive")
    }
}

