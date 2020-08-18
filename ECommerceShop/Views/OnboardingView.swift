//
//  OnboardingView.swift
//  MobileAppUIExploration
//
//  Created by Raphael Cerqueira on 30/07/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct OnboardingView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        self.viewControllers = views.map({ (view) -> UIHostingController<Page> in
            UIHostingController(rootView: view)
        })
    }
    
    var body: some View {
        ZStack {
            Color("onboardingBackground").edgesIgnoringSafeArea(.all)
            
            PageViewController(viewControllers: self.viewControllers, currentPage: $currentPage)
            
            VStack {
                Spacer()
                
                HStack {
                    PageControl(numberOfPages: self.viewControllers.count, currentPage: $currentPage)
                    
                    Spacer()
                    
                    Button(action: {
                        self.handleButton(currentPage: self.currentPage)
                    }) {
                        Image(systemName: "chevron.right")
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .foregroundColor(Color("pink"))
                    }
                    .cornerRadius(15)
                }
                .padding(.horizontal, 30)
            }
        }
        //.offset(y: -50)
            .padding(.top, -50)
    }
    
    func handleButton(currentPage: Int) {
        if currentPage + 1 == self.viewControllers.count { // finish
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            if let windowSceneDelegate = scene?.delegate as? SceneDelegate {
                withAnimation {
                    let window = UIWindow(windowScene: scene!)
                    let contentView = ContentView()
                    window.rootViewController = UIHostingController(rootView: contentView.animation(.spring()))
                    windowSceneDelegate.window = window
                    window.makeKeyAndVisible()
                }
            }
        } else {
            self.currentPage += 1
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView([
            OnboardingPage(text: "Make it simple\nbut significant! 1"),
            OnboardingPage(text: "Make it simple\nbut significant! 2"),
            OnboardingPage(text: "Make it simple\nbut significant! 3")
        ])
    }
}

struct OnboardingPage: View {
    var text: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("onboardingBackground")
            
            VStack {
                Image("onboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(text)
                    .font(.system(size: 46, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

