//
//  Login.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 7/28/25.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Welcome.orangeButtonColor, location: 0.3),
                .init(color: .white, location: 0.3)
            ], center: .top, startRadius: 150, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                
                Image("login")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300
                    )
    
                
                Text("Welcome Back")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                
                Text("Please enter your information to create an account.")
                    .font(.system(size: 18))
                    .padding(.all)
                    .multilineTextAlignment(.center)
                
                TextField("Email", text: $email)
                    .textFieldStyle(IconTextField(icon: Image(systemName: "envelope")))
                    .keyboardType(.emailAddress)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .padding(.horizontal, 30)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                
                TextField("Password", text: $password)
                    .textFieldStyle(IconTextField(icon: Image(systemName: "lock")))
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .padding(.horizontal, 30)
                    .padding(.bottom, 10)
                
                Button {
                    
                }label: {
                    Text("Sign Up")
                        .frame(width: 320)
                        .padding()
                        .background(Welcome.orangeButtonColor)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.top)
                
                Spacer()
            }
            
            
        }
  
    }
}

#Preview {
    Login()
}
