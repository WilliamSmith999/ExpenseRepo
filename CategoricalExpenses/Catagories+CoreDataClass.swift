//
//  Catagories+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by William Smith on 9/28/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Catagories)
public class Catagories: NSManagedObject {
    var expenses: [Expense]?{
        return self.rawExpenses?.array as? [Expense]
    }
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDelegate?.persistentContainer.viewContext
                else{
                    return nil
            }
        self.init(entity: Catagories.entity(), insertInto: context)
        self.title = title
    }
}
