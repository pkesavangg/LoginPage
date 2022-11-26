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
            
           Text("Nothing")
        }
        .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
    }
    
}

struct form_2_Previews: PreviewProvider {
    static var previews: some View {
        form_2()
    }
}
