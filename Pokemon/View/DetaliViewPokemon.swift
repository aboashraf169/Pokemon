//
//  DetaliViewPokemon.swift
//  Pokemon
//
//  Created by Ahmed Mohna on 30/08/2022.
//

import SwiftUI
import Kingfisher

struct DetaliViewPokemon: View {
    
    @StateObject var vm  = DataViewModel()
    let Pokemon : Pokemon
    
    var body: some View {
        ZStack{
            Color(uiColor: vm.getColorFromType(type: Pokemon.type))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                DetailItem
                
              
                progressView
                
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
            .background(Color.white.cornerRadius(12).offset(x: 0, y: 100))
        
            
        }
    }
}

struct DetaliViewPokemon_Previews: PreviewProvider {
    
    static var vm = DataViewModel()
    
    static var previews: some View {
        DetaliViewPokemon(Pokemon: vm.Pokemons.first!)
    }
}

extension DetaliViewPokemon {
    var progressView : some View {
        VStack{  HStack{
            Text("Heght :")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .foregroundColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .padding(.leading,30)
            
            Text("\(Pokemon.height)")
                .font(.system(size: 20, weight: .bold, design: .serif))
            Spacer()
            
            ProgressView(value: 10, total: 100)
                .accentColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .frame(width: UIScreen.main.bounds.width/2.2, alignment: .center)
                .scaleEffect(x: 1, y: 1.8, anchor: .center)
                .padding(.trailing,30)
            
            
            
            
        }
        .padding(.vertical,15)
        HStack{
            Text("Attack :")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .foregroundColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .padding(.leading,30)
            
            Text("\(Pokemon.attack)")
                .font(.system(size: 20, weight: .bold, design: .serif))
            Spacer()
            
            ProgressView(value: 10, total: 100)
                .accentColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .frame(width: UIScreen.main.bounds.width/2.2, alignment: .center)
                .scaleEffect(x: 1, y: 1.8, anchor: .center)
                .padding(.trailing,30)
            
            
            
            
        }.padding(.vertical,15)
        HStack{
            Text("Defence:")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .foregroundColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .padding(.leading,20)
            
            Text("\(Pokemon.defense)")
                .font(.system(size: 20, weight: .bold, design: .serif))
            Spacer()
            
            ProgressView(value: 10, total: 100)
                .accentColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .frame(width: UIScreen.main.bounds.width/2.2, alignment: .center)
                .scaleEffect(x: 1, y: 1.8, anchor: .center)
                .padding(.trailing,30)
            
            
            
            
        }.padding(.vertical,15)
        HStack{
            Text("Weight :")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .foregroundColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .padding(.leading,25)
            
            Text("\(Pokemon.weight)")
                .font(.system(size: 20, weight: .bold, design: .serif))
            Spacer()
            
            ProgressView(value: 10, total: 100)
                .accentColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .frame(width: UIScreen.main.bounds.width/2.2, alignment: .center)
                .scaleEffect(x: 1, y: 1.8, anchor: .center)
                .padding(.trailing,30)
            
            
            
            
        }.padding(.vertical,15)
      
        
        }}
    }
    

extension DetaliViewPokemon {
    var DetailItem :some View {
        VStack{
            KFImage(URL(string: Pokemon.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150, alignment: .center)
            
            Text(Pokemon.name)
                .font(.system(size: 25, weight: .semibold, design: .serif))
            
            
            Text(Pokemon.type)
                .font(.system(size: 20, weight: .bold, design: .serif))
                .padding()
                .background(Color(uiColor: vm.getColorFromType(type: "poison")))
                .cornerRadius(20)
            
            Text(Pokemon.description)
                .font(.callout)
                .padding()
                .multilineTextAlignment(.leading)
            
            Text("Status :")
                .font(.system(size: 20, weight: .semibold, design: .serif))
                .foregroundColor(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
                .padding()
                .frame(width: UIScreen.main.bounds.width , alignment: .leading)
        }
    }
}
