//
//  ContentView.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import SwiftUI

@MainActor
class ContentViewModel : ObservableObject {
    @Published var isLight = true
    @Published var languageChoice : String = "Tiếng việt"
    @Published var data : [Product] = []
    
    func loadData() {
        if data.count != 0 {
            return
        }
        
        APICaller.caller.callWithResult(
            urlPath: "https://dummyjson.com/products",
            methodName: "GET",
            onComplete: { (data, response, err) in
                do {
                    let wrapper = try DataConverter<WrapperEntity>
                        .fromData(data!)
                    
                    self.data = wrapper.products.map {
                        Product(entity: $0)
                    }
                }
                catch let err {
                    print(err.localizedDescription)
                }
            })
    }
}

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var backgroundColor : UIColor {
        ColorGetter.getter.getBackgroundColor(isLight: contentViewModel.isLight)
    }
    
    var foregroundColor: UIColor {
        ColorGetter.getter.getForegroundColor(isLight: contentViewModel.isLight)
    }
    
    var body: some View {
        TabView {
            DataPageView(
                products: contentViewModel.data, languageChoice: contentViewModel.languageChoice, isLight: contentViewModel.isLight)
                .task {
                    contentViewModel.loadData()
                }
                
            CustomizationView(
                isLight: $contentViewModel.isLight,
                languageChoice: $contentViewModel.languageChoice)
            
        }
        .background(Color(uiColor: backgroundColor))
        .tabViewStyle(PageTabViewStyle())
        .foregroundColor(Color(uiColor: foregroundColor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
