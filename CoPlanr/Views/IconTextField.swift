//
//  IconTextField.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/8/25.
//

import SwiftUI

struct IconTextField: TextFieldStyle {
    
    @State var icon: Image?
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            if icon != nil {
                icon
                    .foregroundStyle(Color(UIColor.systemGray4))
            }
            
            configuration
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color(UIColor.systemGray4), lineWidth: 2)
        }
    }
}
