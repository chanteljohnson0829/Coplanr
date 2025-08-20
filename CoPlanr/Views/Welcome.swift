//
//  Welcome.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 7/28/25.
//

import SwiftUI

struct Welcome: View {
    static let orangeButtonColor = Color(red: 233.0/255.0, green: 124.0/255.0, blue: 88.0/255.0)
    static let purpleButtonColor = Color(red: 137.0/255.0, green: 125.0/255.0, blue: 187.0/255.0)
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Coplanr")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    NavigationLink {
                        Login()
                    } label: {
                        Text("Login")
                            .frame(width: 250)
                            .padding()
                            .background(Welcome.orangeButtonColor)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    
                    NavigationLink {
                        SignUp()
                    }label: {
                        Text("Sign Up")
                            .frame(width: 250)
                            .padding()
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Welcome()
}
