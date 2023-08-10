//
//  ItemCardView.swift
//  Pokemon
//
//  Created by Ahmed Mohna on 29/08/2022.
//

import SwiftUI
import Kingfisher

struct ItemCardView: View {
    let Pokemon : Pokemon
    @StateObject var vm = DataViewModel ()
    
    var body: some View {
        HStack{
            VStack{
                Text(Pokemon.name)
                    .font(.footnote)
                    .fontWeight(.medium)
                
                
                Text(Pokemon.type)
                    .font(.system(size: 15, weight: .semibold, design: .serif))
                    .padding()
                    .background(.white.opacity(0.5))
                    .cornerRadius(25)
                
            }.padding(.horizontal,10)
            KFImage(URL(string: Pokemon.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.trailing)
        }
        .foregroundColor(.white)
        .padding(.vertical)
        .background(Color(uiColor: vm.getColorFromType(type: Pokemon.type)))
        .cornerRadius(12)
        
    }
}

struct ItemCardView_Previews: PreviewProvider {
    static var vm =  DataViewModel()
    static var previews: some View {
        ItemCardView(Pokemon: vm.Pokemons.first!)
    }
}
