//
//  ViewController.swift
//  Day6
//
//  Created by iMac_15 on 2020. 7. 17..
//  Copyright © 2020년 KPU ios app dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum BalllType{
        case soccer, basketball, baseball
        mutating func next(){
            switch self{
            case .soccer:
                self = .basketball
            case .basketball:
                self = .baseball
            case .baseball:
                self = .soccer
            }
        }
        var imageName: String{
            switch self{
            case .soccer: return "soccer"
            case .basketball: return "basketball"
            case .baseball: return "baseball"
            }
        }
    }
    var ballType = BalllType.soccer{
        didSet{
            let imageName = ballType.imageName
            ballImageView.image = UIImage(named: imageName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var ballImageView: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapView(_ gr: UITapGestureRecognizer) {
        let pt = gr.location(in: self.view)
        UIView.animate(withDuration: 0.3){
            self.ballImageView.center = pt
        }
    }
    
    @IBAction func onTapBall(_ gr: UITapGestureRecognizer) {
        UIView.transition(with: ballImageView, duration: 0.3, options:.transitionFlipFromLeft, animations: {
                self.ballType.next()
            }, completion: nil)

    }
    @IBAction func onPinchView(_ gr: UIPinchGestureRecognizer) {
        switch gr.state{
        case .changed:
            let tr = ballImageView.transform
            let tr2 = tr.scaledBy(x: gr.scale, y: gr.scale)
            ballImageView.transform = tr2
            gr.scale = 1.0
        default:
            break
        }
    }
    
    @IBAction func onRotateView(_ gr: UIRotationGestureRecognizer) {
        switch gr.state{
        case .changed:
            let tr = ballImageView.transform
            let tr2 = tr.rotated(by: gr.rotation)
            ballImageView.transform = tr2
            gr.rotation = 1.0
        default:
            break
        }
    }
}

