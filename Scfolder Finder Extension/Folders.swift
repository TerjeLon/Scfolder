//
//  Folders.swift
//  Scfolder Finder Extension
//
//  Created by Terje Lønøy on 21/03/2022.
//

import Foundation

enum Folders: String, CaseIterable {
    case sceltoDark = "Scelto dark"
    case sceltoDarkLogo = "Scelto dark logo"
    case sceltoLight = "Scelto light"
    case sceltoLightLogo = "Scelto light logo"
    case sceltoGreen = "Scelto green"
    case sceltoGreenLogo = "Scelto green logo"
    
    var imageName: String {
        get {
            switch self {
            case .sceltoDark: return "scelto_dark"
            case .sceltoDarkLogo: return "scelto_dark_logo"
            case .sceltoLight: return "scelto_light"
            case .sceltoLightLogo: return "scelto_light_logo"
            case .sceltoGreen: return "scelto_green"
            case .sceltoGreenLogo: return "scelto_green_logo"
            }
        }
    }
    
    var iconName: String {
        get {
            return "\(imageName)_ico"
        }
    }
}
