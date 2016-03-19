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
    
    //*******更新箇所*******//
    //タイマーのインスタンス
    var timer: NSTimer!
    
    //1枚目の写真
    var h: Int! = 1

    
    //画像の配列
    let images = [
        UIImage(named: "image1.jpg")!,
        UIImage(named: "image2.jpg")!,
        UIImage(named: "image3.jpg")!,
        UIImage(named: "image4.jpg")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //タップした時の動作設定
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tappedSingle:"))

    }
    
    //スタートボタンを押すと自動再生する
    @IBAction func startButton(sender: AnyObject) {
        
        //*******更新箇所*******//
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
    
    
    //*******更新箇所*******//
    //進むボタンを押すと一つ進む
    @IBAction func proceedButton(sender: AnyObject) {
        
        h = h + 1
        if h == images.count + 1 {
            h = 1
        }
        let src: String = "image" + String(h) + ".jpg"
        imageView.image = UIImage(named: src)
    }

    
    //*******更新箇所*******//
    //戻るボタンを押すと一つ戻る
    @IBAction func backButton(sender: AnyObject) {
        
        h = h - 1
        if h == 0 {
            h = 4
        }
        let src: String = "image" + String(h) + ".jpg"
        imageView.image = UIImage(named: src)

    }
    


    //画像をタップすると同じ画像が次の画面に移る
    func tappedSingle(sender: UITapGestureRecognizer!) {

        if h == 1 {
            selectedImage = "image1.jpg"
        }else if h == 2 {
            selectedImage = "image2.jpg"
        }else if h == 3 {
            selectedImage = "image3.jpg"
        }else{
            selectedImage = "image4.jpg"
        }
        
            performSegueWithIdentifier("next",sender: nil)
    }
    
    
    //セグエの設定
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "next") {
            let svc:SecondViewController = segue.destinationViewController as! SecondViewController
            svc.number = selectedImage

        }
    }
    
    //*******更新箇所*******//
    func slideShow() {
        
        h = h + 1
        if h == images.count + 1 {
            h = 1
        }
        let src: String = "image" + String(h) + ".jpg"
        imageView.image = UIImage(named: src)
}
}

