//
//  ContentView.swift
//  ECommerceShop
//
//  Created by Raphael Cerqueira on 17/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var sizeSelectedIndex = 2
    @State var colorSelectedIndex = 3
    @State var colorName = "rosa"
    
    let colorNames = ["verde", "amarelo", "vermelho", "rosa", "preto"]
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBarView()
            
            VStack(alignment: .leading) {
                CarouselView([
                    CarouselPageView(colorName: self.$colorName, imageSufix: "m"),
                    CarouselPageView(colorName: self.$colorName, imageSufix: "f")
                ])
                
                Text("SUPREME MICHAEL JACKSON\nHOODED SWEATSHIRT")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                Text("Supreme")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                
                Text("$50,000")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .padding(.top, 8)
                
                Text("Collaboration item of Supreme and the King of Pop, Michael Jackson. It is a limited item only sold in the US.")
                    .font(.system(size: 16))
                    .padding(.top)
                
                Button(action: {
                    
                }) {
                    Text("Read more")
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.992659986, green: 0.8670999408, blue: 0.4730576277, alpha: 1)))
                }
                
                SizeView(selectedIndex: self.$sizeSelectedIndex)
                    .padding(.top)
                
                ColorView(selectedIndex: self.$colorSelectedIndex, onSelectColor: self.onSelectColor)
                    .padding(.top)
                
                Button(action: {
                    
                }) {
                    Text("Add to cart")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(#colorLiteral(red: 1, green: 0.806197226, blue: 0.2333956957, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(.top, 24)
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 32)
    }
    
    func onSelectColor(selectedIndex: Int) {
        self.colorName = self.colorNames[selectedIndex]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
