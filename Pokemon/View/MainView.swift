//
//  MainView.swift
//  Pokemon
//
//  Created by Ahmed Mohna on 29/08/2022.
//

import SwiftUI

struct MainView: View {
    //proprerty
    var gridColumn : [GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
    @StateObject var vm = DataViewModel ()
    @State var IsFilterApplied = false
    
    @State var filterByType:String = ""
    
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical,showsIndicators: false){
                
                LazyVGrid(columns: gridColumn) {
                    
                    
                    ForEach(vm.Pokemons){ item in
                        
                        if filterByType != ""  {
                            if item.type == filterByType {
                                
                                NavigationLink(destination: {
                                    DetaliViewPokemon(Pokemon: item)
                                }, label: {
                                    ItemCardView(Pokemon: item)
                                        .padding(3)
                                        
                                }
                              
                                
                            )}
                          
                            
                        }
                        else{
                            NavigationLink(destination: {
                                DetaliViewPokemon(Pokemon: item)
                            }, label: {
                                ItemCardView(Pokemon: item)
                                    .padding(3)
                                    
                            }
                          
                            
                        )
                               
                            
                        }
                        
                       
                        
                    }
                    
                    
                }
                
                
            }
            .overlay(
               
                CustomButtonFilter
            
                ,alignment: .bottomTrailing)
            
            .navigationTitle("PoKemon")
            
        }
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView{
    var CustomButtonFilter : some View {
        VStack {
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25, alignment: .center)
                .padding(30)
                .background(Color(uiColor: vm.getColorFromType(type: "fire")).shadow(color: .black, radius:30, x: 0, y: 0))
                .cornerRadius(50)
                .shadow(color: .black, radius:30, x: 0, y: 0)
                .padding(.trailing)
                .opacity(IsFilterApplied ? 1 : 0 )
                .onTapGesture {
                    withAnimation {
                        filterByType = "fire"
                    }
                }
               
            
            
            Image(systemName: "drop.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25, alignment: .center)
                .padding(30)
                .background(Color(uiColor: vm.getColorFromType(type: "water")).shadow(color: .black, radius:30, x: 0, y: 0))
                .cornerRadius(50)
                .shadow(color: .black, radius:30, x: 0, y: 0)
                .padding(.trailing)
                .opacity(IsFilterApplied ? 1 : 0 )
                .onTapGesture {
                    withAnimation {
                        filterByType = "water"
                    }
                }
            
            Image(systemName: "bolt.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25, alignment: .center)
                .padding(30)
                .background(Color(uiColor: vm.getColorFromType(type: "electric")))
                .cornerRadius(50)
                .shadow(color: .black, radius:30, x: 0, y: 0)
                .padding(.trailing)
                .opacity(IsFilterApplied ? 1 : 0 )
                .onTapGesture {
                    withAnimation {
                        filterByType = "electric"
                    }
                }
            
            
            Image(systemName: "leaf.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25, alignment: .center)
                .padding(30)
                .background(Color(uiColor: vm.getColorFromType(type: "poison")))
                .cornerRadius(50)
                .shadow(color: .black, radius:30, x: 0, y: 0)
                .padding(.trailing)
                .opacity(IsFilterApplied ? 1 : 0 )
                .onTapGesture {
                    withAnimation {
                        filterByType = "poison"
                    }
                  
                }
            
            
            
            Image(systemName: filterByType == "" ? "line.3.horizontal.decrease" : "arrow.counterclockwise")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25, alignment: .center)
                .padding(30)
                .background(Color.cyan)
                .cornerRadius(50)
                .shadow(color: .black, radius:30, x: 0, y: 0)
                .rotationEffect(Angle(degrees: IsFilterApplied ? 0 : 180))
                .padding(.trailing)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        filterByType = ""
                        IsFilterApplied.toggle()
                    }
                   
                }
               
            
            
        } .foregroundColor(.white)
    }
}
