//
//  ViewController.swift
//  Day3-Slider
//
//  Created by iMac_15 on 2020. 7. 15..
//  Copyright © 2020년 KPU ios app dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadColor()
        ChangeViewColor()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        saveColor()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var onLabel1: UILabel!
    @IBOutlet weak var onLabel2: UILabel!
    @IBOutlet weak var onLabel3: UILabel!
    @IBOutlet weak var VofSlider1: UISlider!
    @IBOutlet weak var VofSlider2: UISlider!
    @IBOutlet weak var VofSlider3: UISlider!
    @IBOutlet weak var JustView: UIView!
    @IBOutlet weak var StatusSwitch: UISwitch!
    
    @IBAction func onSlider1(_ sender: Any) {
        onLabel1.text = "\(Int(VofSlider1.value * 255))"
        ChangeViewColor()
    }
    @IBAction func onSlider2(_ sender: Any) {
        onLabel2.text = String(Int(VofSlider2.value * 255))
        ChangeViewColor()
    }
    @IBAction func onSlider3(_ sender: Any) {
        onLabel3.text = String(Int(VofSlider3.value * 255))
        ChangeViewColor()
    }
    
    @IBAction func onSwitch(_ sender: Any) {
        if(StatusSwitch.isOn){
            ChangeViewColor()
        }
        else{
            return
        }
    }
    
    
    
    func ChangeViewColor(){
        if(StatusSwitch.isOn){
            let red = CGFloat(VofSlider1.value)
            let green = CGFloat(VofSlider2.value)
            let blue = CGFloat(VofSlider3.value)
            JustView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            onLabel1.textColor = UIColor(red: CGFloat(VofSlider1.value), green: 0, blue: 0, alpha: 1.0)
            onLabel2.textColor = UIColor(red: 0, green: CGFloat(VofSlider2.value), blue: 0, alpha: 1.0)
            onLabel3.textColor = UIColor(red: 0, green: 0, blue: CGFloat(VofSlider3.value), alpha: 1.0)
            VofSlider1.tintColor = UIColor(red: CGFloat(VofSlider1.value), green: 0, blue: 0, alpha: 1.0)
            VofSlider2.tintColor = UIColor(red: 0, green: CGFloat(VofSlider2.value), blue: 0, alpha: 1.0)
            VofSlider3.tintColor = UIColor(red: 0, green: 0, blue: CGFloat(VofSlider3.value), alpha: 1.0)
        }
    }
    
    func saveColor(){
        let defs = UserDefaults.standard
        defs.set(VofSlider1.value, forKey: "red")
        defs.set(VofSlider2.value, forKey: "green")
        defs.set(VofSlider3.value, forKey: "blue")
        //defs.synchronize() //싱크를 너무 자주 하지 않게 주석처리 해놓음
    }
    
    func loadColor(){
        let defs = UserDefaults.standard
        VofSlider1.value = defs.float(forKey: "red")
        VofSlider2.value = defs.float(forKey: "green")
        VofSlider3.value = defs.float(forKey: "blue")
    }

}

