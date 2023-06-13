//
//  RegisterView.swift
//  projekt
//
//  Created by student on 06/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username = ""
    @State private var password = ""
    @State private var usernameValidate = ""
    @State private var passwordValidate = ""
    private var isUsernameValid: Bool {
        return username.count >= 6
    }
    private var isPasswordValid: Bool {
        let passwordRegex = "(?=.*[A-Z])(?=.*[0-9]).{7,}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }

    var body: some View {
        VStack {
            Spacer()
            Text("Register")
                .font(.system(size: 48))
           
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
            
            if usernameValidate != "" {
                Text(usernameValidate)
                    .foregroundColor(.red)
            }
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if passwordValidate != "" {
                Text(passwordValidate)
                    .foregroundColor(.red)
            }

            Button(action: {
                if isUsernameValid && isPasswordValid {
                    usernameValidate = ""
                    passwordValidate = ""
                    
                } else if !isUsernameValid {
                    usernameValidate = "Your Username must include at least 6 characters."
                }
                else if !isPasswordValid {
                    passwordValidate = "Your password must include at least 7 characters, one digit and one capital letter."
                }
        
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.green)
                    .cornerRadius(8.0)
                    .padding()
            }

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back")
                    .foregroundColor(Color.blue)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
