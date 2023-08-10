//
//  DataViewModel.swift
//  Pokemon
//
//  Created by Ahmed Mohna on 29/08/2022.
//

import Foundation
import UIKit

class DataViewModel:ObservableObject{
   
    @Published var Pokemons :[Pokemon] = []
    
    init(){
        getPost()
    }
    
    
    
    func getPost (){
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else {
            
            
            print("theres error with Url Parsing")
            return
  
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                
                print("error From Completion Handler")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("error from response")
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode <= 300 else {
                print("error from status code")
                return
            }

            guard let data = data?.jsonparsing(letters: "null,") else {
                
                print("error with Data")
                return
            }
            
            guard let jsondata = try? JSONDecoder().decode([Pokemon].self, from: data)
            else{
                print("error from decoder")
                return
            }
            DispatchQueue.main.async {
                self.Pokemons=jsondata
               
            }
            
            
            
            
            
            
            
        }.resume()
        
        
        
    }
    
    func getColorFromType(type:String) ->UIColor {
        
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "psychic":return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemPink
            
        default: return .systemIndigo
            
            
        }
        
        
    }
}
