//
//  ProtocolMarvelHeroes.swift
//  MarvelListHeroes
//
//  Created by Felipe Moura Soares on 04/04/19.
//  Copyright © 2019 Felipe Moura Soares. All rights reserved.
//

import Foundation


struct Marvel: Decodable {
    var marvel = [ListOfHeroes]()
    enum CodingKeys: String, CodingKey {
        case marvel = "marvel"
    }
}

extension Marvel {
    static func parse(_ data: Data) -> Marvel{
        var marvel = Marvel(marvel: [ListOfHeroes]())
        do {
            marvel = try JSONDecoder().decode(Marvel.self, from: data)
        } catch let error  {
            print(error)
        }
        
        return marvel
        
    }
}

struct ListOfHeroes: Decodable {
    let heroes: [Heroes]
    let villains: [Villains]
    let teams: [Teams]
    
    
    enum CodingKeys: String, CodingKey {
        case heroes
        case villains
        case teams
    }
    
}

struct Heroes: Decodable {
    var hero: String
    var name: String
    var link: String
    var img: String
    var size: Int
    
    enum CodingKeys: String, CodingKey {
        case hero
        case name
        case link
        case img
        case size
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        hero = try value.decodeIfPresent(String.self, forKey: .hero)!
        name = try value.decodeIfPresent(String.self, forKey: .name)!
        link = try value.decodeIfPresent(String.self, forKey: .link)!
        img = try value.decodeIfPresent(String.self, forKey: .img)!
        size = try value.decodeIfPresent(Int.self, forKey: .size)!
        
    }
}
struct Villains: Decodable {
    var hero: String
    var name: String
    var link: String
    var img: String
    var size: Int
    
    enum CodingKeys: String, CodingKey {
        case hero
        case name
        case link
        case img
        case size
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        hero = try value.decodeIfPresent(String.self, forKey: .hero)!
        name = try value.decodeIfPresent(String.self, forKey: .name)!
        link = try value.decodeIfPresent(String.self, forKey: .link)!
        img = try value.decodeIfPresent(String.self, forKey: .img)!
        size = try value.decodeIfPresent(Int.self, forKey: .size)!
        
    }
}

struct Teams: Decodable {
    var hero: String
    var name: String
    var link: String
    var img: String
    var size: Int
    
    enum CodingKeys: String, CodingKey {
        case hero
        case name
        case link
        case img
        case size
    }
    
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        hero = try value.decodeIfPresent(String.self, forKey: .hero)!
        name = try value.decodeIfPresent(String.self, forKey: .name)!
        link = try value.decodeIfPresent(String.self, forKey: .link)!
        img = try value.decodeIfPresent(String.self, forKey: .img)!
        size = try value.decodeIfPresent(Int.self, forKey: .size)!
        
    }
}

