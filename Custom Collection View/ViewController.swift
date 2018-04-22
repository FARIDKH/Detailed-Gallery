//
//  ViewController.swift
//  Custom Collection View
//
//  Created by Farid Qanbarov on 4/20/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit
import CoreData

extension UINavigationItem {
    open override func awakeFromNib() {
        super.awakeFromNib()
        let backItem = UIBarButtonItem()
        backItem.title = " "
        self.backBarButtonItem = backItem
    }
}

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var images = [Data]()
 
    @IBOutlet weak var photosCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
    }
    
    func getDataFromDatabase() {
        print("getDataFromDatabase is Called")
        let fetchRequest = NSFetchRequest<Photo>.init(entityName: "Photo")
        do {
            let results = try DatabaseController.persistentContainer.viewContext.fetch(fetchRequest)
            self.images = [Data]()
            for result in results {
                let image = result.name! as Data
                images.append(image)
                
                if image.count == results.count {
                    break
                }
            }
            
        } catch {
            print("Error : \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataFromDatabase()
        photosCollectionView.reloadData()
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = round((view.bounds.size.width)/3)
        let height = round((view.bounds.size.height)/4)
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        getDataFromDatabase()
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PhotosCollectionViewCell
        cell.imageView.image = UIImage(data: images[indexPath.item])
        return cell
    }
    
    @IBAction func goToAddPhotos(_ sender: Any) {
        performSegue(withIdentifier: "goToAddPhoto", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPhotoDetail" {
            var destinationVC = segue.destination
            if let navVC = destinationVC as? UINavigationController {
                destinationVC = navVC.visibleViewController ?? navVC
            }
            if let detailedPhotoVC = destinationVC as? PhotoDetailViewController {
                let indexPath = photosCollectionView.indexPathsForSelectedItems![0]
                let fetchRequest = NSFetchRequest<Photo>.init(entityName: "Photo")
                do {
                    let results = try DatabaseController.persistentContainer.viewContext.fetch(fetchRequest)
                    detailedPhotoVC.detailedText  = results[indexPath.item].photoDescription
                    detailedPhotoVC.navigationItem.title = results[indexPath.item].title
                } catch {
                    print(error)
                }
                detailedPhotoVC.detailedImage = UIImage(data : images[indexPath.item])
               
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToPhotoDetail", sender: self)
    }
    
}

