//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takahiro Abe on 3/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    //配列に指定するIndex 番号を宣言
    var nowIndex:Int = 0
    
    //スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    //スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "img1.jpeg")!,
        UIImage(named: "img2.jpeg")!,
        UIImage(named: "img3.jpeg")!,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[0]
    }
    
    //再生ボタンを押した時の処理
    @IBAction func slideshowButton(_ sender: Any) {
        //再生中か停止しているかを判定
        if (timer == nil){
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            forwardButton.isEnabled = false
            backButton.isEnabled = false
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
        } else {
            stopTimer()
            
        }
    }
    func stopTimer() {
        //To do timer がnilだったらすぐリターンする
        if timer == nil {
            return
        }
        
        //停止時の処理を実装
        //タイマーを停止する
        timer.invalidate()
        
        //タイマーを削除しておく（timer.invalidateだけだとtimerがnilにならないため）
        timer = nil
        
        //ボタンの名前を再生に直しておく
        startButton.setTitle("再生", for: .normal)
        
        forwardButton.isEnabled = true
        backButton.isEnabled = true
        
    }
    
    
    @objc func changeImage(){
        nextImage()
    }
    func nextImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count){
            // index を一番最初の数字に戻す
            nowIndex = 0
        }
        //indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    
    @IBAction func forward(_ sender: Any) {
        stopTimer()
        nextImage()
        
    }
    
    func backImage() {
        // indexを減らして表示する画像を切り替える
        nowIndex -= 1
        
        // nowIndexが0より小さくなった時
        if (nowIndex < 0){
            // index を一番最後の番号にする
            nowIndex = 2
        }
        //indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func back(_ sender: Any) {
        stopTimer()
        backImage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        stopTimer()
        // segueから遷移先のNexttViewControllerを取得する
        let nextViewController:NextViewController = segue.destination as! NextViewController
        // 遷移先のNextViewControllerで宣言しているimageを代入して渡す
        nextViewController.image = imageArray[nowIndex]
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
