//
//  Produto+CoreDataProperties.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 22/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//
//

import Foundation
import CoreData


extension Produto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Produto> {
        return NSFetchRequest<Produto>(entityName: "Produto")
    }

    @NSManaged public var nome: String?
    @NSManaged public var categoria: Int16
    @NSManaged public var dataValidade: NSDate?

}
