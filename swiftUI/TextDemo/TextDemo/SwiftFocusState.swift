//
//  SwiftFocusState.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

enum OnboardingField {
    case username
    case password
}

struct SwiftFocusState: View {
    @FocusState private var usernameInFocus: Bool
//    @FocusState private var passwordInFocus: Bool
    @FocusState private var submitButton: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    
//    @FocusState private var focusedTextField: Int?
    @FocusState private var focusedTextField: OnboardingField?
    
    var body: some View {
        VStack {
            TextField("Add your name here...", text: $username)
//                .focused($focusedTextField, equals: 0)
                .focused($focusedTextField, equals: .username)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color.gray.brightness(0.28))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onSubmit {
//                    self.focusedTextField = 1
                    self.focusedTextField = .password
                }
            
//            TextField("Add your password here...", text: $password)
            SecureField("Add your password here...", text: $password)
//                .focused($focusedTextField, equals: 1)
                .focused($focusedTextField, equals: .password)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color.gray.brightness(0.28))
                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .onSubmit {
//                    self.submitButton.toggle()
//                }
                .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
//                    if password.isEmpty && focusedTextField == 1 {
                    if password.isEmpty && focusedTextField == .password {
//                        focusedTextField = 0
                        focusedTextField = .username
                    }
                }

            
//            Button("Toggle Focus Here") {
//                usernameInFocus.toggle()
//            }
//            .focused($submitButton)
//            .frame(height: 40)
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//            .background(.yellow)
            
//            Button("Sign Up 🚀") {
//                let usernameIsValid = !username.isEmpty
//                let passwordIsValid = !password.isEmpty
//                
//                if usernameIsValid && passwordIsValid {
//                    print("Sign Up")
//                } else if usernameIsValid {
//                    focusedTextField = 1
//                    print("password is a required field")
//                } else if passwordIsValid {
//                    focusedTextField = 0
//                    print("username is a required field")
//                } else {
//                    print("Fill all the fields")
//                }
//            }
            
            Button("Sign Up 🚀") {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("Sign Up")
                } else if usernameIsValid {
                    focusedTextField = .password
                    print("password is a required field")
                } else if passwordIsValid {
                    focusedTextField = .username
                    print("username is a required field")
                } else {
                    print("Fill all the fields")
                }
            }
        }
        .padding(40)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.usernameInFocus = true
//                self.focusedTextField = 0
                self.focusedTextField = .username
            }
        }
    }
}

#Preview {
    SwiftFocusState()
}
