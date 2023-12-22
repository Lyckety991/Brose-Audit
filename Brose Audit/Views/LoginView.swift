//
//  LoginView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 08.02.23.
//

import SwiftUI

struct LoginView: View {
    
    
    @State private var personalnummer: String = ""
    @State private var passwort: String = ""
    
    @State private var toggleButton = true
    
    var body: some View {
        
       
            VStack(alignment: .center) {
                Spacer()
                
               
                
                // MARK: Text
                Text("Brose Audit")
                    .bold()
                    .foregroundColor(.red)
                    .font(.system(size: 35))
                Text("Technik für Automobile")
                    .font(.system(size: 20))
                    .padding(.bottom, 50)
                
                // MARK: Login
                TextField("Personalnummer", text: $personalnummer)
                    .frame(maxWidth: 250, maxHeight: 50)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    .cornerRadius(5)
                    .keyboardType(.numberPad)
                    .shadow(color: .gray, radius: 2, x: 0.5, y: 2)
                    .onTapGesture {
                       
                        self.hideKeyboard()
                    }
                    
                   
                    
                SecureField("Passwort", text: $passwort)
                    .frame(maxWidth: 250, maxHeight: 50)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    .cornerRadius(5)
                    .keyboardType(.default)
                    .autocorrectionDisabled(true)
                    .shadow(color: .gray, radius: 2, x: 0.5, y: 2)
                    .onTapGesture {
                        self.hideKeyboard()
                    }
               
                
               
                
                // MARK: LoginButton
                NavigationLink {
                    
                    WelcomeView()
                   
                    
                } label: {
                    CustomButton(text: "Login")
                }
                .padding(.top, 30)
                .disabled(personalnummer.isEmpty || passwort.isEmpty)
                .onTapGesture {
                    self.hideKeyboard()
                }
                Spacer()
                
            }
        // MARK: -> Toolbar
        
            .toolbar {
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Image(systemName: "bell.badge")
                            .foregroundStyle(Color("Button"))
                            
                    }
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        }
        
    
    
    
    // MARK: Funktion -> Login
    private func checkLogin() {
        
        if passwort.isEmpty && personalnummer.isEmpty {
            toggleButton = true
        } else {
            toggleButton = false
        }
        
    }
    
   
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
