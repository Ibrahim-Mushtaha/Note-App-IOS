//
//  Line+CoreDataProperties.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 25/04/2021.
//
//

import Foundation
import CoreData


extension Line {
	
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Line> {
        return NSFetchRequest<Line>(entityName: "Line")
    }

    @NSManaged public var name: String?
    @NSManaged public var note: String?

}

extension Line : Identifiable {

}
