//
//  LoginView.swift
//  LoginPage
//
//  Created by Kesavan Panchabakesan on 23/11/22.
//

import SwiftUI
import Foundation
import Combine


class HelpAuth: ObservableObject {
    var didChange = PassthroughSubject<HelpAuth, Never>()
    
    @Published var authenticated = false {
        didSet{
            didChange.send(self)
        }
    }
    
    func checkDetails (userEmail: String, userPassword: String){
        guard let url = URL(string: "https://api.perfectportions.greatergoods.com/v1/account/login") else {return}
        let body: [String : String] = ["email" : userEmail, "password": userPassword]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("values")
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
//            print("JSON String: \(String(data: data, encoding: .utf8))")
      
            do{
                let finalData = try JSONDecoder().decode(responseData.self, from: data)
                DispatchQueue.main.async {
                    self.authenticated = true
                }
               print(finalData)
            }catch{
                print(error.localizedDescription, "Final data error")
            }
            
        }.resume()
    }
}
struct errorResponnse : Decodable{
    var error: String
}

struct responseData: Decodable{
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var  zipcode: String?
    var dob: String?
    var gender: String?
    var scale: String?
    var  token: String?
    var willReceiveEmails: Bool?
}


struct LoginView: View {
    
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
            if string.count > 100 {
                return false
            }
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: string)
    }
    
    
    @State var emailValue: String
    @State var email2: String = ""
    @State var password: String
    @State var loginClicked = false
    @ObservedObject var manager = HelpAuth()
    @State var isEmailValid = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            TextField("wwww", text: $emailValue).textFieldStyle(.roundedBorder).autocapitalization(.none)
            TextField("wwww", text: $password).textFieldStyle(.roundedBorder).autocapitalization(.none)
            
            
            TextField("Email", text: $email2, onEditingChanged: { (isChanged) in
                             if !isChanged {
                                  if self.textFieldValidatorEmail(self.email2) {
                                    self.isEmailValid = true
                                  } else {
                                    self.isEmailValid = false
                                    self.email2 = ""
                                  }
                            }
            })
            .autocapitalization(.none)

            if !self.isEmailValid && !self.email2.isEmpty {
                  Text("Email is not valid")
            }
            
            
            
            if manager.authenticated {
                
                Text("Logged In Successfully")
               
             }else{
                Text("Logged In Failed")
            }
            
            if(self.loginClicked){
                HStack{
                    Spacer()
                    ProgressView().padding()
                    Text("Loading")
                    Spacer()
                }
            }
            Button {
                self.manager.checkDetails(userEmail: self.emailValue, userPassword: self.password)
                if(!manager.authenticated){
                    self.loginClicked = true

                }
                
            } label: {
                Text("LOGIN")
            }
            
            
            
            
        }.padding()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    @State var values = "email"
    static var previews: some View {
        LoginView(emailValue: "kesavan792721@gmail.com", password: "kesavan31098")
    }
}
