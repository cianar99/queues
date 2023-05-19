//
//  viewC.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

import SwiftUI

struct viewC: View {
    var body: some View {
        ZStack{
            Color.gray
            
            Image(systemName: "mic")
                .background(.thinMaterial)
                .font(.system(size:200))
        }.frame(width: 500, height: 900)
    }
}

struct viewC_Previews: PreviewProvider {
    static var previews: some View {
        viewC()
    }
}
