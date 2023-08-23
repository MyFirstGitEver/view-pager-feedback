//
//  CustomizationView.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import SwiftUI

struct CustomizationView: View {
    @Binding var isLight : Bool
    @Binding var languageChoice: String
    
    var customizationTitle : String {
        return LanguageGetter.getter.getCustomizationPageTitleIn(languageChoice: languageChoice)
    }
    
    var lightDarkTitle : String {
        return LanguageGetter.getter.getDarkLightModeTitleIn(languageChocie: languageChoice)
    }
    
    var languageTitle: String {
        return LanguageGetter.getter.getLanguageTitleIn(languageChoice: languageChoice)
    }
    
    var body: some View {
        VStack {
            Text(customizationTitle)
                .bold()
                .font(.system(size: 30))
            
            Toggle(lightDarkTitle, isOn: $isLight)
                .padding([.horizontal], 15)
            
            HStack {
                Text(languageTitle)
                Spacer()
                
                Picker("", selection: $languageChoice) {
                    ForEach(["Tiếng việt", "Tiếng anh"], id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(.menu)
            }
            .padding([.horizontal], 15)
            .padding([.top], 40)
            Spacer()
        }
    }
}

struct CustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizationView(
            isLight: .constant(true),
            languageChoice: .constant("Tiếng việt"))
    }
}
