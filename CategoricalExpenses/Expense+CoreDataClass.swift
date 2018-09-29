//
//  Expense+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by William Smith on 9/28/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date?{
        get{
            return rawDate as Date?
        }
        set{
            rawDate = newValue as NSDate?
        }
    }
    convenience init?(name: String, amount: Double, date: Date?) {
        let appDeligate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDeligate?.persistentContainer.viewContext
            else{
                return nil
        }
        self.init(entity: Expense.entity(), insertInto: context)
        self.name = name
        self.date = date
        self.amount = amount
        
    }
}
