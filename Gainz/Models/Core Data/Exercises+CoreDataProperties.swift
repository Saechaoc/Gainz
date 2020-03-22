//
//  Exercises+CoreDataProperties.swift
//  Gainz
//
//  Created by Chris on 3/19/20.
//  Copyright © 2020 Chris Saechao. All rights reserved.
//
//

import Foundation
import CoreData


extension Exercises {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercises> {
        return NSFetchRequest<Exercises>(entityName: "Exercises")
    }

    @NSManaged public var name: String?
    @NSManaged public var muscleUsed: String?
    @NSManaged public var rating: String?
    @NSManaged public var muscleChartImg: String?
    @NSManaged public var level: String?
    @NSManaged public var equipment: String?
    @NSManaged public var imgs: [String]?
    @NSManaged public var type: String?
    @NSManaged public var instructions: [String]?
    
    public var getName : String {
        name ?? "Unknown Exercise"
    }
    
    public var getMuscleUsed : String {
        muscleUsed ?? "Other"
    }
    
    public var getRtg:Double {
        Double(rating!) ?? 0.0
    }
    
    public var getMuscleImg:String {
        muscleChartImg ?? "Unknown Image"
    }
    
    public var getLevel: String {
        level ?? "Unknown"
    }
    
    public var getEquipment: String {
        equipment ?? "Other"
    }
    
    public var getImgs: [String] {
        imgs ?? []
//        let imgSet = imgs as! Set<String>
//
//        return Array(imgSet)
    }
    
    public var getType: String {
        type ?? "Unknown Type"
    }
    
    public var getInstructions: [String] {
        instructions ?? []
//        let instructionSet = instructions as! Set<String>
//
//        return Array(instructionSet)
    }
}
