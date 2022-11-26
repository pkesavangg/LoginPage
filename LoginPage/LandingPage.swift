//
//  LandingPage.swift
//  LoginPage
//
//  Created by Kesavan Panchabakesan on 26/11/22.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        
        NavigationView {
            ZStack{
                
                Color("primaryColor").edgesIgnoringSafeArea(.all)
                VStack{
                   
                        Image("icon").resizable().frame( width: UIScreen.screenSize.width * 0.8, height: UIScreen.screenSize.height * 0.35)
                        .aspectRatio(contentMode: .fit).padding(.trailing).padding(.trailing)
                        
                   
                   
                    VStack(spacing: 20){
                        Button("SIGN UP") {
                            //self.signUpNavigated = true
                            print("Button pressed!")
                        }
                        .foregroundColor(Color("primaryColor"))
                        .clipShape(Capsule())
                        .frame(width: UIScreen.screenSize.width * 0.8, height: UIScreen.screenSize.height * 0.103)
                        .background(.white).cornerRadius(45)
                        .font(.largeTitle)
                        
                        
                        
                        Button("LOG IN") {
                            print("Log In pressed!")
                        }
                        .foregroundColor(Color(.white))
                        .clipShape(Capsule())
                        .frame(width: UIScreen.screenSize.width * 0.8, height: UIScreen.screenSize.height * 0.103)
                        .background(Color("secondary-color")).cornerRadius(45)
                        .font(.largeTitle).padding(.trailing).padding(.leading)
                    }.padding(.top).padding(.top)
                    
                    
                    Spacer()
                    Button("Version 2.0.0-dev | PRIVACY POLICY QUESTIONS ?") {
                        
                    }.font(.callout)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.all).navigationBarHidden(true)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage().previewDevice("iPhone 12")
        LandingPage().previewDevice("iPhone 13")
    }
}
