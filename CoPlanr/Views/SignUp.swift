//
//  SignUp.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 7/28/25.
//

import SwiftUI

struct SignUp: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @State var isLoading = false
    @State var showErrorAlert = false
    @State private var errorMessage: String = ""
    
    @State private var showHomeView = false
    
    @State private var emailError: String?
    @State private var passwordError: String?

    
    var body: some View {
        NavigationStack{
            ZStack {
                RadialGradient(stops: [
                    .init(color: Welcome.orangeButtonColor, location: 0.3),
                    .init(color: .white, location: 0.3)
                ], center: .top, startRadius: 150, endRadius: 700)
                .ignoresSafeArea()
                
                VStack {
                    Image("signup")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    Text("Create A New Account")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Please enter your information to create an account.")
                        .font(.system(size: 18))
                        .padding(.all)
                        .multilineTextAlignment(.center)
                    
                    TextField("Full Name", text: $name)
                        .textFieldStyle(IconTextField(icon: Image(systemName: "person")))
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .padding(.horizontal, 30)
                        .cornerRadius(20)
                        .padding(.bottom, 10)
                        .textInputAutocapitalization(.words)
                    
                  
                   
                        TextField("Email", text: $email)
                            .textFieldStyle(IconTextField(icon: Image(systemName: "envelope")))
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 30)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                            .onChange(of: email, initial: false) {
                                validateEmail()
                            }
                            
                        
                        if let emailError = emailError {
                            Text(emailError)
                                .font(.caption)
                                .padding(.horizontal)
                                .foregroundStyle(.red)
                        }
                    
                    
                    TextField("Password", text: $password)
                        .textFieldStyle(IconTextField(icon: Image(systemName: "lock")))
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .padding(.horizontal, 30)
                        .padding(.bottom, 10)
                        .onChange(of: password, initial: false) {
                            validatePassword()
                        }
                    
                    if let passwordError = passwordError {
                        Text(passwordError)
                            .font(.caption)
                            .padding(.horizontal)
                            .foregroundStyle(.red)
                    }
                    
                        
                    
                    if isLoading {
                        ProgressView()
                    } else {
                        Button {
                            createAccount()
                        }label: {
                            Text("Sign Up")
                                .frame(width: 320)
                                .padding()
                                .background(Welcome.orangeButtonColor)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.top)
                        .disabled(!isFormValid)
                    }
                    
                    Spacer()
                    
                }
            }
            .navigationDestination(isPresented: $showHomeView){TabHolderView()}
            .alert("Error", isPresented: $showErrorAlert) {
                Button("OK") {
                    
                }
            } message: {
                Text(errorMessage)
            }
        }
      
       
       
    }
    
    func createAccount() {
        isLoading = true
        errorMessage = ""
        
        Task {
            do {
                let result = try await Authentication.shared.createNewAccount(name: name, email: email, password: password)
                if result == "Success" {
                    showHomeView = true
                }
            } catch let error as AuthError {
                switch error {
                case .missingToken :
                    print("Error: Missing token in response")
                    errorMessage = "Missing token in response"
                    showErrorAlert = true
                    
                case .serverError(let message):
                    print(("Error: \(message)"))
                    errorMessage = message
                    showErrorAlert = true
                   
                }
            } catch {
                print("Unexpected error: \(error.localizedDescription)")
                errorMessage = error.localizedDescription

                showErrorAlert = true
            }
            isLoading = false
        }
        
        
        
    }
    
    private var isFormValid: Bool {
        !name.isEmpty && isEmailValid(email) && isValidPassword(password: password) && !isLoading
    }
    
    func validateEmail() {
        emailError = isEmailValid(email) ? nil : "Invalid email format."
        
    }
    
    func isEmailValid(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func validatePassword() {
        passwordError = isValidPassword(password: password) ? nil : "Password must be at least 8 characters, with uppercase, lowercase, number, and special character (!@#$%^&*)."
        
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,})"
        return password.range(of: passwordRegex, options: .regularExpression) != nil
    }
}

#Preview {
    SignUp()
}
