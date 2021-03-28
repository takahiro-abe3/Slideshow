//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Takahiro Abe on 3/6/21.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!

    var image: UIImage? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        ImageView.image = self.image
            }
    
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

