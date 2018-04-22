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
    
    @IBAction func alertIsClicked(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let attributedText = NSAttributedString(string: "Report", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18),
            NSAttributedStringKey.foregroundColor : UIColor.red])
        let action = UIAlertAction(title: "Report", style: .destructive, handler: nil)
        
        alert.addAction(action)
        alert.addAction(
            UIAlertAction(title: "Share", style: .default, handler: nil)
        )
        alert.addAction(
            UIAlertAction(title: "Save Image", style: .default, handler: nil)
        )
        alert.addAction(
            UIAlertAction(title: "Copy Link", style: .default, handler: nil)
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            NSLog("The \"Cancel\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
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
