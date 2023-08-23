//
//  ProductView.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import SwiftUI

struct ProductView: View {
    @State private var showsMore = true
    let product : Product
    let isLight: Bool
    
    var backgroundColor : UIColor {
        ColorGetter.getter.getBackgroundColor(isLight: isLight)
    }
    
    var body: some View {
        HStack {
            ZStack {
                showsMoreContent
                firstContent
            }
            
            Spacer()
            Button(action: {
                withAnimation(.spring()) {
                    showsMore.toggle()
                }
            }) {
                if showsMore {
                    Image(systemName: "chevron.right")
                        .padding(10)
                }
                else {
                    Image(systemName: "info.circle.fill")
                        .padding(10)
                }
            }
        }
        .padding(30)
        .background(Color(uiColor: backgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
    
    var showsMoreContent: some View {
        VStack {
            Text(product.description)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(product.images, id: \.self) { imageLink in
                        AsyncImage(url: URL(string: imageLink)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(maxWidth: 100, maxHeight: 100)
                    }
                }
            }
        }
        .offset(x: showsMore ? 0 : -1000)
    }
    
    var firstContent: some View {
        HStack {
            AsyncImage(url: URL(string: product.images[0])) { image in
                       image
                           .resizable()
                           
                   } placeholder: {
                       Color.gray
                   }
                   .frame(maxWidth: 100, maxHeight: 100)
                   .padding([.leading], 10)
            VStack(alignment: .leading, spacing: 15){
                Text(product.title)
                Text("\(product.price) $")
                    .bold()
                    .font(.system(size: 20))
            }.padding([.leading], 10)
        }.opacity(showsMore ? 0 : 1)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(
            product: Product(),
            isLight: false)
    }
}
