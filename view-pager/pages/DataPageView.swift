//
//  DataPageView.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import SwiftUI

struct DataPageView: View {
    let products : [Product]
    let languageChoice: String
    let isLight : Bool
    
    var backgroundColor : UIColor {
        return ColorGetter.getter.getBackgroundColor(isLight: isLight)
    }
    
    var body: some View {
        VStack {
            Text(LanguageGetter.getter.getProductsPageTitleIn(languageChoice: languageChoice))
                .bold()
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
            
            List(products) { product in
                ProductView(
                    product: product,
                    isLight: isLight)
                    .listRowBackground(Color(uiColor: backgroundColor))
            }
        }
    }
}

struct DataPageView_Previews: PreviewProvider {
    static var previews: some View {
        DataPageView(
            products: [], languageChoice: "Tiếng việt", isLight: true)
    }
}
