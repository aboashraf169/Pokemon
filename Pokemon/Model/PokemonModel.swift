//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Ahmed Mohna on 29/08/2022.
//

import Foundation

struct Pokemon:Identifiable,Codable {
    let attack : Int
    let defense : Int
    let description : String
    let evolutionChain : [evolutionChain]?
    let height : Int
    let id:Int
    let imageUrl : String
    let name : String
    let type : String
    let weight : Int
    
    
}


struct evolutionChain:Codable {
    let id : String
    let name : String
    
}
