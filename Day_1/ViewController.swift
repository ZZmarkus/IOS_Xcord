//
//  ViewController.swift
//  Day_1
//
//  Created by iMac_15 on 2020. 7. 13..
//  Copyright © 2020년 KPU ios app dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var num = 0
    let img:Array = ["img1", "img2", "img3", "img4", "img5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        num = 3
        
        updateImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var TextView: UILabel!
    
    
    
    @IBAction func onPrevBtn(_ sender: UIButton) {
        num -= 1
        updateImage()
    }
    
    @IBAction func onNextBtn(_ sender: UIButton) {
        num += 1
        updateImage()
    }
    
    @IBOutlet weak var onImageView: UIImageView!
    
    func updateImage(){
        let name = img[num]
        onImageView.image = UIImage(named: name)
        TextView.text = "\(num+1) / \(img.count)"
        

        prevButton.isEnabled = num != 0
        nextButton.isEnabled = num != img.count - 1
    }
    
    
}

