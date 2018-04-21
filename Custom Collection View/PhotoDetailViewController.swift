//
//  PhotoDetailViewController.swift
//  Custom Collection View
//
//  Created by Farid Qanbarov on 4/21/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit



class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    var detailedImage: UIImage?
    var detailedText : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = detailedText
        self.imageView.image = detailedImage
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
