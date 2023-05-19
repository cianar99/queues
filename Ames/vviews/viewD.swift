//
//  viewD.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

import SwiftUI

struct viewD: View {
    var body: some View {
        ZStack{
            Color.gray
            
            Image(systemName: "house")
                .background(.thinMaterial)
                .font(.system(size:200))
        }.frame(width: 500)
    }
}

struct viewD_Previews: PreviewProvider {
    static var previews: some View {
        viewD()
    }
}
