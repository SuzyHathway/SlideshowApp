//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 椎葉寛子 on 2016/03/15.
//
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var number:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if number == "image4.jpg" {
            imageView.image = UIImage(named: "image4.jpg")!
        }else if number == "image3.jpg" {
            imageView.image = UIImage(named: "image3.jpg")!
        }else if number == "image2.jpg" {
            imageView.image = UIImage(named: "image2.jpg")!
        }else{
            imageView.image = UIImage(named: "image1.jpg")!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
