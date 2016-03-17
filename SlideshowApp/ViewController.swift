//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 椎葉寛子 on 2016/03/15.
//
//

import UIKit

class ViewController: UIViewController ,UIGestureRecognizerDelegate {
    
    //画像を表示するイメージビュー
    @IBOutlet weak var imageView: UIImageView!
    
    //ボタンの設定
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    //次の画面への画像保存の変数
    var selectedImage:String!
    
    //*******更新箇所
    //タイマーのインスタンス
    var timer: NSTimer!
    var h: Int!
    
    //画像の配列
    let images = [
        UIImage(named: "image1.jpg")!,
        UIImage(named: "image2.jpg")!,
        UIImage(named: "image3.jpg")!,
        UIImage(named: "image4.jpg")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一枚目の写真
        h = 1
        
        //タップした時の動作設定
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tappedSingle:"))

    }
    
    //スタートボタンを押すと自動再生する
    @IBAction func startButton(sender: AnyObject) {
        
        //*******更新箇所
        //タイマーの設定
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("slideShow"), userInfo: nil, repeats: true)

        
        startButton.hidden = true
        stopButton.hidden = false
        proceedButton.hidden = true
        backButton.hidden = true
    }
    
    //自動再生を止める
    @IBAction func stopButton(sender: AnyObject) {
        //タイマー終了
        timer.invalidate()

        
        startButton.hidden = false
        stopButton.hidden = true
        proceedButton.hidden = false
        backButton.hidden = false
    }
    
    //進むボタンを押すと一つ進む
    @IBAction func proceedButton(sender: AnyObject) {
        
        if self.imageView.image == UIImage(named: "image1.jpg")! {
            self.imageView.image = images[1]
        }else if self.imageView.image == UIImage(named: "image2.jpg")!{
            self.imageView.image = images[2]
        }else if self.imageView.image == UIImage(named: "image3.jpg")!{
            self.imageView.image = images[3]
        }else{
            self.imageView.image = images[0]
        }
    }
    
    //戻るボタンを押すと一つ戻る
    @IBAction func backButton(sender: AnyObject) {
        
        if self.imageView.image == UIImage(named: "image4.jpg")! {
            self.imageView.image = images[2]
        }else if self.imageView.image == UIImage(named: "image3.jpg")!{
            self.imageView.image = images[1]
        }else if self.imageView.image == UIImage(named: "image2.jpg")!{
            self.imageView.image = images[0]
        }else{
            self.imageView.image = images[3]
        }
        
    }
    
    //画像をタップすると同じ画像が次の画面に移る
    func tappedSingle(sender: UITapGestureRecognizer!) {

        if self.imageView.image == UIImage(named: "image4.jpg")! {
            selectedImage = "image4.jpg"
        }else if self.imageView.image == UIImage(named: "image3.jpg")!{
            selectedImage = "image3.jpg"
        }else if self.imageView.image == UIImage(named: "image2.jpg")!{
            selectedImage = "image2.jpg"
        }else{
            selectedImage = "image1.jpg"
        }
        
            performSegueWithIdentifier("next",sender: nil)
        
            //タイマー終了
            timer.invalidate()
        
            startButton.hidden = false
            stopButton.hidden = true
            proceedButton.hidden = false
            backButton.hidden = false
        }
    
    
    //セグエの設定
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "next") {
            let svc:SecondViewController = segue.destinationViewController as! SecondViewController
            svc.number = selectedImage

        }
    }
    
    //*******更新箇所
    func slideShow() {
        let src: String = "image" + String(h) + ".jpg"
        imageView.image = UIImage(named: src)
        h = h + 1
        
        if h == 5 {
            h = 1
        }
    }
}

