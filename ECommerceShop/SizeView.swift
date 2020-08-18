//
//  SizeView.swift
//  ECommerceShop
//
//  Created by Raphael Cerqueira on 17/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct SizeView: View {
    @Binding var selectedIndex: Int
    let sizes = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Size")
                .font(.system(size: 18, weight: .bold))
            
            HStack {
                ForEach(0 ..< self.sizes.count) { i in
                    Button(action: {
                        self.selectedIndex = i
                    }) {
                        Text(self.sizes[i])
                            .fontWeight(.medium)
                            .frame(width: 35, height: 35)
                            .foregroundColor(self.selectedIndex == i ? .white : .black)
                            .background(self.selectedIndex == i ? Color(#colorLiteral(red: 0.2587976158, green: 0.2588401437, blue: 0.258788228, alpha: 1)) : Color.white)
                    }
                }
            }
            .padding(.top)
        }
    }
}

struct SizeView_Previews: PreviewProvider {
    static var previews: some View {
        SizeView(selectedIndex: .constant(2))
    }
}
