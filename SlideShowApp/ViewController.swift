//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 両川昇 on 2019/06/30.
//  Copyright © 2019 両川昇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer:Timer!
    var timer_sec:Float = 0
    var image:UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startStopbutton: UIButton!
    @IBOutlet weak var Foward: UIButton!
    @IBOutlet weak var Back: UIButton!
    
   
  
    @IBAction func tapAction(_ sender: Any) {
        if self.timer != nil {
            Foward.isEnabled = true
            Back.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
            self.startStopbutton.setTitle("再生", for: .normal)
        }
        self.performSegue(withIdentifier: "GoResult", sender: nil)
    }
    
    @IBAction func tapFoward(_ sender: Any) {
        if imageView.image == images[0]{
            imageView.image = images[1]
        }else if imageView.image == images[1]{
            imageView.image = images[2]
        }else if imageView.image == images[2]{
            imageView.image = images[0]
        }
    }
    
    @IBAction func tapBack(_ sender: Any) {
        if imageView.image == images[0]{
            imageView.image = images[2]
        }else if imageView.image == images[2]{
            imageView.image = images[1]
        }else if imageView.image == images[1]{
            imageView.image = images[0]
        }
    }
    
    @IBAction func slideStart(_ sender: Any) {
        if self.timer == nil{
            Foward.isEnabled = false
            Back.isEnabled = false
           self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
           self.startStopbutton.setTitle("停止" , for: .normal)
        }else{
        if self.timer != nil {
            Foward.isEnabled = true
            Back.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
            self.startStopbutton.setTitle("再生", for: .normal)
            }
    }
    }
    
    @objc func updateTimer(_ timer:Timer){
        self.timer_sec += 2
        if imageView.image == images[0]{
            imageView.image = images[1]
        }else if imageView.image == images[1]{
            imageView.image = images[2]
        }else if imageView.image == images[2]{
            imageView.image = images[0]
        }
    }
    
    let images = [UIImage(named: "pet_cat_thirsty"),UIImage(named: "pet_cat_omoi_sleep_man"),UIImage(named: "pet_cat_hakai")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    imageView.image = images[0]
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! ResultViewController
        nextView.images = imageView.image!
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
}

