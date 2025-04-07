//
//  Font+Extension.swift
//  AuctionWidgetExtension
//
//  Created by Sarvesh Doshi on 11/11/24.
//

import Foundation
import SwiftUI

extension Font {
    enum FontType: String {
       
        case HNBold = "HelveticaNeue-Bold"
        case HNBoldItalic = "HelveticaNeue-BoldItalic"
        case HNHeavy = "HelveticaNeue-Heavy"
        case HNHeavyItalic = "HelveticaNeue-HeavyItalic"
        case HNItalic = "HelveticaNeue-Italic"
        case HNLight = "HelveticaNeue-Light"
        case HNLightItalic = "HelveticaNeue-LightItalic"
        case HNMedium = "HelveticaNeue-Medium"
        case HNMediumItalic = "HelveticaNeue-MediumItalic"
        case HNRoman = "HelveticaNeue-Roman"
        case HNThin = "HelveticaNeue-Thin"
        case HNThinItalic = "HelveticaNeue-ThinItalic"
        case HNUltraLight = "HelveticaNeue-UltraLight"
        case HNUltraLightItalic = "HelveticaNeue-UltraLightItalic"
        case HN = "HelveticaNeue"
    }

    static func custom(type: FontType, size: CGFloat) -> Font {
        return Font.custom(type.rawValue, size: isIpad() ? size * 1.2 : size)
    }
}

// Helper function to detect iPad
func isIpad() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}
