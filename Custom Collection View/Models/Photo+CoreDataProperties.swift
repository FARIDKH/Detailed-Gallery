//
//  Photo+CoreDataProperties.swift
//  Custom Collection View
//
//  Created by Farid Qanbarov on 4/20/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var name: NSData?
    @NSManaged public var title: String?
    @NSManaged public var photoDescription: String?

}
