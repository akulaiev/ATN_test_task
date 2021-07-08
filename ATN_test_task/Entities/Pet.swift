//
//  Pet.swift
//  ATN_test_task
//
//  Created by Anna Kulaieva on 04.07.2021.
//

import Foundation

enum PetType: String {
    case turtle = "Turtle"
    case dog = "Dog"
    case cat = "Cat"
    case parrot = "Parrot"
    case pony = "Pony"
    case unicorn = "Unicorn"
    case unknown = "Your option"
    
    static let petTypeArray = ["Turtle", "Dog", "Cat", "Parrot", "Pony", "Unicorn", "Your option"]
}

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct Pet {
    let name: String
    let type: String
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "type": type
        ]
    }
}

extension Pet: DocumentSerializable {

    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
              let type = dictionary["type"] as? String else { return nil }

        self.init(name: name, type: type)
    }
}


struct PetViewData {
    var pets: [Pet]
}
