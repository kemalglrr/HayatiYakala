//
//  GoalContent+CoreDataProperties.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 30.07.2023.
//
//

import Foundation
import CoreData


extension GoalContent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalContent> {
        return NSFetchRequest<GoalContent>(entityName: "GoalContent")
    }
    
    @NSManaged public var content: String?
    @NSManaged public var goal: Goal?
}

extension GoalContent : Identifiable {

}
