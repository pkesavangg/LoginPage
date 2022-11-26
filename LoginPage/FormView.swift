//
//  FormView.swift
//  LoginPage
//
//  Created by Kesavan Panchabakesan on 24/11/22.
//

import SwiftUI

enum FocusText {
    case emailField , passwordField
}




struct FormView: View {
    @FocusState private var focusField : FocusText?
    @State var emailFieldValue : String = ""
    @State var password : String = ""
    @State var isPasswordFieldTouched : Bool = false
    @State var emailFieldNotFocused = false
    @State var isEmailFieldTouched : Bool = false
    @State var passwordErrorMsg = ""
    
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
        UIToolbar.appearance().barTintColor = UIColor.red
        
    }
    
    
    var emailErrorMessage : String{
        
        if( self.emailFieldNotFocused && self.isEmailFieldTouched && self.emailFieldValue.count > 0){
            if(!textFieldValidatorEmail(emailFieldValue)){
                return "Must use a valid email"
            }else{
                return ""
            }
        }
        
        if (self.emailFieldNotFocused && self.emailFieldValue.isEmpty && self.isEmailFieldTouched ) {
            return "Must not left blank"
        }
        return  ""
    }
    
    
    var passwordErrorMessage : String {
        if(self.isPasswordFieldTouched &&  !self.password.isEmpty && password.count < 6){
            return "Password must be 6 characters long"
        }
        if ( self.password.isEmpty && self.isPasswordFieldTouched ) {
            return "Must not left blank"
        }
        return  ""
    }
    
    
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                Text("")
                    .navigationTitle("LOG IN")
                    .navigationBarTitleDisplayMode(.inline)
                    
                
                Form{
                    VStack(alignment: .leading, spacing: 20)  {
                        VStack(alignment: .leading){
                            Text("Email").font(.callout).foregroundColor(Color("secondary-color"))
                            TextField("greater@goods.com" ,text: $emailFieldValue,onEditingChanged: { edit in
                                if edit == false {
                                    self.emailFieldNotFocused = true
                                }
                            } )
                            .focused($focusField , equals: .emailField)
                            .submitLabel(.next)
                            .onSubmit() {
                                focusField = .passwordField
                            }.onTapGesture {
                                self.isEmailFieldTouched  = true
                            }
                            Divider().padding(.trailing, 20)
                            
                            Text( self.emailErrorMessage ).font(.caption).foregroundColor(.red)
                        }
                        
                        VStack(alignment: .leading){
                            
                            VStack(alignment: .leading){
                                Text("Password").font(.callout).foregroundColor(Color("secondary-color"))
                                SecureField("7845*wdK" , text: $password)
                                .focused($focusField , equals: .passwordField)
                                .submitLabel(.done)
                                .onSubmit() {
                                    print("Log in \(self.emailFieldValue) \(password)")
                                }
                                .onTapGesture {
                                    self.isPasswordFieldTouched = true
                                }
                                Divider().padding(.trailing, 20)
                                
                                Text( self.passwordErrorMessage ).font(.caption).foregroundColor(.red)
                            }
                            
                        }
                        
                     
                        HStack(alignment: .center) {
                            Text("Forgot your password?").foregroundColor(Color("primaryColor")).font(.footnote)
                        }
                        Spacer()
                    }.padding(.leading, 20 ).padding(.top, 30)
                }
                Spacer()
                
                
                HStack{
                    Button {
                        print("Pressed")
                    } label: {
                        Text(Image(systemName: "arrow.left")) + Text("BACK")
                    }.foregroundColor(Color(.white)).padding(.leading)
                    Spacer()
                    Button {
                        focusField = nil
                        print("Pressed")
                        print("Log in \(self.emailFieldValue) \(password)")
                    } label: {
                        Text("LOG IN") + Text(Image(systemName: "arrow.right"))
                    }.foregroundColor(Color(.white)).padding(.trailing)
                } .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("primaryColor").ignoresSafeArea(edges: .bottom))
                    .frame(maxWidth: .infinity)
                
            }.gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)}).navigationBarBackButtonHidden(true)
            
        }
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}



