//
//  LoadingView.swift
//  Weatherr
//
//  Created by I9orila T on 07.12.2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .center)
        
        
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
