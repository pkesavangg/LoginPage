//
//  form 2.swift
//  LoginPage
//
//  Created by Kesavan Panchabakesan on 24/11/22.
//

import SwiftUI

struct form_2: View {
    @State var receiptAmount = ""
    var body: some View {
        NavigationView {
            
            VStack{
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Text("Left")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width * 0.33)
                            .background(.yellow)
                        Text("Right")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width * 0.67)
                            .background(.orange)
                    }
                
                    Button("Testing") {
                        print("h")
                    }
                }.frame(height: 50)
                
            }
            
          Text("HII")
        }
        .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
    }
    
}

struct form_2_Previews: PreviewProvider {
    static var previews: some View {
        form_2()
    }
}
