//
//  AddPhotoViewController.swift
//  Custom Collection View
//
//  Created by Farid Qanbarov on 4/20/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit
import CoreData


class AddPhotoViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var newDescription: UITextView!
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addImage))
        newImage.isUserInteractionEnabled = true
        newImage.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

    @objc func addImage() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        newImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNewPhoto(){
        let photo : Photo = NSEntityDescription.insertNewObject(forEntityName: "Photo", into: DatabaseController.persistentContainer.viewContext) as! Photo
        if let image = newImage.image,
            let title = newTitle.text,
            let description = newDescription.text {
            let imageData = UIImagePNGRepresentation(image)
            photo.name = NSData(data: imageData!)
            photo.title = title
            photo.photoDescription = description
            DatabaseController.saveContext()
        }
    }
    
    @IBAction func addNewPhoto(_ sender: UIButton) {
        self.addNewPhoto()
        dismiss(animated: true, completion: nil)
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
