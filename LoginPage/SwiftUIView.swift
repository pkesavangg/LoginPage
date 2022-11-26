//
//  SwiftUIView.swift
//  LoginPage
//
//  Created by Kesavan Panchabakesan on 23/11/22.
//

import SwiftUI
struct SwiftUIView: View {
    
    init(){
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(Color("primaryColor"))
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var phoneNumber = "9094544825"
    var email = "kesavan792721@gmail.com"
    var body: some View {
        NavigationView {
            VStack{
                Text("").navigationTitle("HELP").navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack{
                                Button {
                                    
                                } label: {
                                    Text(Image(systemName: "arrow.left")).foregroundColor(.white)
                                    
                                }
                            }
                        }
                    }
        
                Image("Pat_Ashley").resizable()
                    .aspectRatio(contentMode: .fit).edgesIgnoringSafeArea(.all)
               
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Have a question? we're here for you. Contact us and we'll be happy to help.")
                    
                    HStack{
                        Text("User Manual:").font(.body)
                        Button {
                            
                        } label: {
                            Text("greatergoods.com/")
                        }
                        Spacer()
                    }
                    HStack{
                        Text("Phone:").font(.body)
                        Link(phoneNumber, destination: URL(string: "tel:\(phoneNumber)")!).foregroundColor(Color("primaryColor"))
                        Spacer()
                    }
                    HStack{
                        Text("Email:").font(.body)
                        Link(email, destination: URL(string: "mailto:\(email)")!).foregroundColor(Color("primaryColor"))
                        
                        Spacer()
                        
                    }
                    Button(action: {
                        
                    }) {
                        Text("ABOUT US").padding(10).foregroundColor(.white)
                    }
                    .background(Color("primaryColor"))
                    .cornerRadius(10.0).padding(.top, 15)
                }.padding()
               
                .frame(maxWidth: .infinity, alignment: .leading)
              
                
                Spacer()
                Text("App Version: 2.0.0")
                Spacer()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
