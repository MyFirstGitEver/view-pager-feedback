//
//  LanguageGetter.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import Foundation

class LanguageGetter {
    static let getter = LanguageGetter()
    static let VNChoice = "Tiếng việt"
    
    func getProductsPageTitleIn(languageChoice: String) -> String {
        if languageChoice == LanguageGetter.VNChoice {
            return "Sản phẩm của chúng tôi"
        }
        
        return "Our products"
    }
    
    func getCustomizationPageTitleIn(languageChoice: String) -> String {
        if languageChoice == LanguageGetter.VNChoice {
            return "Tuỳ chỉnh"
        }
        
        return "Settings"
    }
    
    func getDarkLightModeTitleIn(languageChocie: String) -> String {
        if languageChocie == LanguageGetter.VNChoice {
            return "Sáng/tối"
        }
        
        return "Light/Dark"
    }
    
    func getLanguageTitleIn(languageChoice: String) -> String {
        if languageChoice == LanguageGetter.VNChoice {
            return "Ngôn ngữ"
        }
        
        return "Languages"
    }
}
