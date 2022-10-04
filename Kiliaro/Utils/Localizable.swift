//
//  Localizable.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

extension String {
    public var localized: String {
        if let language = Locale.current.languageCode {
            let isEn = language.compare(Language.en.rawValue, options: .caseInsensitive) == .orderedSame
            if isEn {
                return NSLocalizedString(self, comment: "")
            }
            
            let defaultPath = Bundle.main.path(forResource: Language.en.rawValue, ofType: "lproj")
            var defaultValue: String {
                if let defaultPath = defaultPath {
                    return Bundle(path: defaultPath)!.localizedString(forKey: self, value: "", table: nil)
                } else {
                    return NSLocalizedString(self, comment: "")
                }
            }
                                    
            guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
                
                let basePath = Bundle.main.path(forResource: "Base", ofType: "lproj")!
                
                return Bundle(path: basePath)!.localizedString(forKey: self, value: defaultValue, table: nil)
            }
            
            return Bundle(path: path)!.localizedString(forKey: self, value: defaultValue, table: nil)
        }  else {
            return NSLocalizedString(self, comment: "")
        }
    }
}


enum Language: String {
    case en = "en"
}
