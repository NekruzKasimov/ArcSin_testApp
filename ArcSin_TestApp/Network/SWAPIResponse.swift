//
//  SWAPIResponse.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation

class SWAPIResponse<T: Decodable>: Decodable {
    var results: [T]? = nil
    var next: String? = nil
    var previous: String? = nil
    var count: Int = 0
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.results = try? container.decode([T].self, forKey: .results)
        self.next = try? container.decode(String.self, forKey: .next)
        self.previous = try? container.decode(String.self, forKey: .previous)
        self.count = try container.decode(Int.self, forKey: .count)
    }
    
    enum CodingKeys: String, CodingKey {
        case results, next, previous, count
    }
}
