//
//  ViewController.swift
//  Custom Collection View
//
//  Created by Farid Qanbarov on 4/20/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var images = [Data]()

    @IBOutlet weak var photosCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func getDataFromDatabase() {
        print("getDataFromDatabase is Called")
        let fetchRequest = NSFetchRequest<Photo>.init(entityName: "Photo")
        do {
            let results = try DatabaseController.persistentContainer.viewContext.fetch(fetchRequest)
            for result in results {
                let image = result.name! as Data
                images.append(image)
                print("\(result.title!)")
            }
        } catch {
            print("Error : \(error)")
        }
    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("didAppear")
//    }
    
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
    

}

