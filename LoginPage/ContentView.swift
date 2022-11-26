//
//  ContentView.swift
//  LoginPage
//
//  Created by Kesavan Panchabakesan on 23/11/22.
//

import SwiftUI

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}


struct ContentView: View {
    
    @State var searchText = ""
    

    
    var body: some View {
        NavigationView {
        
            Text("Hello, World!")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack{
                            Button("BACK") {
                                print("Pressed")
                            }
                            Spacer()
                            ZStack{
                                HStack{
                                    Image(systemName: "magnifyingglass").frame(width: 50, height: 50).padding(.leading)
                                    TextField("Search", text: $searchText).textFieldStyle(.roundedBorder).font(.title)
                                    
                                    if(!searchText.isEmpty){
                                        Image(systemName: "xmark.circle")
                                            .frame(width: 50, height: 50)
                                            .padding(.leading)
                                            .foregroundColor(.green)
                                            .onTapGesture {
                                            self.searchText = ""
                                             }
                                         }
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 2))
                            }.frame(width: UIScreen.screenSize.width * 0.5)
                            Spacer()
                            Button("BACK") {
                                print("Pressed")
                            }
                        }
                    }
                }
            
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("BACK") {
                            print("Pressed")
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        TextField("Search", text: $searchText).textFieldStyle(.roundedBorder)
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button("LOG IN") {
                            print("Pressed")
                        }
                    }
                }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
        
    }
}
