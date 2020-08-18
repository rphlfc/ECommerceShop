//
//  ColorView.swift
//  ECommerceShop
//
//  Created by Raphael Cerqueira on 17/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    @Binding var selectedIndex: Int
    let colors = [Color(#colorLiteral(red: 0.005219751969, green: 0.4495956302, blue: 0.09810454398, alpha: 1)), Color(#colorLiteral(red: 0.9860567451, green: 0.7618407607, blue: 0.0283093527, alpha: 1)), Color(#colorLiteral(red: 0.9684166312, green: 0.06235774606, blue: 0.1955967247, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8941623569, blue: 0.9047875404, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]
    var onSelectColor: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Color")
                .font(.system(size: 18, weight: .bold))
            
            HStack {
                ForEach(0 ..< self.colors.count) { i in
                    Button(action: {
                        self.selectedIndex = i
                        self.onSelectColor(i)
                    }) {
                        Text("")
                            .frame(width: 35, height: 35)
                            .background(self.colors[i])
                            .cornerRadius(3)
                            .overlay(RoundedRectangle(cornerRadius: 3).stroke(self.selectedIndex == i ? Color.black : Color.clear, lineWidth: 2))
                    }
                }
            }
            .padding(.top)
        }
    }
}
