//
//  User.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class User: Object, Decodable {
    dynamic var name: String = ""
    dynamic var height: String = ""
    dynamic var mass: String = ""
    dynamic var hairColor: String = ""
    dynamic var skinColor: String = ""
    dynamic var eyeColor: String = ""
    dynamic var birthYear: String = ""
    dynamic var gender: String = ""
    dynamic var homeworld: String = ""
    dynamic var created: String = ""
    dynamic var edited: String = ""
    dynamic var url: String = ""
    dynamic var compoundKey: String = ""
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.height = try  container.decode(String.self, forKey: .height)
        self.mass = try container.decode(String.self, forKey: .mass)
        self.hairColor = try container.decode(String.self, forKey: .hairColor)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.skinColor = try container.decode(String.self, forKey: .skinColor)
        self.birthYear = try container.decode(String.self, forKey: .birthYear)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.homeworld = try container.decode(String.self, forKey: .homeworld)
        self.created = try container.decode(String.self, forKey: .created)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.url = try container.decode(String.self, forKey: .url)
        self.compoundKey = self.name + self.height
    }
    
    override static func primaryKey() -> String? {
        return "compoundKey"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case gender
        case homeworld
        case created
        case edited
        case url
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
    }
}
