//
//  Goal+CoreDataProperties.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 30.07.2023.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var goalCompletionCount: Int32
    @NSManaged public var goalDescription: String?
    @NSManaged public var goalType: String?
    @NSManaged public var validGoalCount: Int32
    @NSManaged public var goalDetails: String?
    @NSManaged public var goalcontent: GoalContent?
}

extension Goal : Identifiable {
    
}
