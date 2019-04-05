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

struct ListOfHeroes: Decodable{
    var heroes: [Heroes]?
    var villains: [Villains]?
    var teams: [Teams]?
    
   
    enum CodingKeys: String, CodingKey {
        case heroes
        case villains
        case teams
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        heroes = try v
        
    }
}

struct Heroes {
    var hero: String
    var name: String
    var link: String
    var img: String
    var size: Int
}
struct Villains {
    var hero: String
    var name: String
    var link: String
    var img: String
    var size: Int
}

struct Teams {
    var hero: String
    var name: String
    var link: String
    var img: String
    var size: Int
}

