//
//  CircleImage.swift
//  Weatherr
//
//  Created by I9orila T on 08.12.2021.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("MCity")
        
        
            .frame(width: 340, height: 340)
            .clipShape(Circle())
            
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 9)
            
        
        
    }
    
    struct CircleImage_Previews: PreviewProvider {
        static var previews: some View {
            CircleImage()
        }
    }
}
