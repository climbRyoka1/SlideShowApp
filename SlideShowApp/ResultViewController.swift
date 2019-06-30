//
//  ResultViewController.swift
//  SlideShowApp
//
//  Created by 両川昇 on 2019/06/30.
//  Copyright © 2019 両川昇. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var expansionImage: UIImageView!
    
    var images:UIImage!
    var transScale = CGAffineTransform()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transScale = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.expansionImage.image = images
        self.expansionImage.transform = transScale
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
