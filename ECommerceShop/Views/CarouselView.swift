//
//  CarouselView.swift
//  ECommerceShop
//
//  Created by Raphael Cerqueira on 17/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct CarouselView<Page: View>: View {
    @State var currentPage = 0
    var viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page]) {
        self.viewControllers = views.map({ (view) -> UIHostingController<Page> in
            UIHostingController(rootView: view)
        })
    }
    
    var body: some View {
        VStack {
            PageViewController(viewControllers: self.viewControllers, currentPage: $currentPage)
                .frame(height: 300)
            
            PageControl(numberOfPages: self.viewControllers.count, currentPage: $currentPage)
        }
    }
}

struct CarouselPageView: View {
    @Binding var colorName: String
    var imageSufix: String
    
    var body: some View {
        VStack {
            Image("\(colorName)-\(imageSufix)")
                .resizable()
                //.aspectRatio(contentMode: .fit)
                //.frame(height: 250)
                .scaledToFit()
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView([
            CarouselPageView(colorName: .constant("rosa"), imageSufix: "m")
        ])
    }
}
