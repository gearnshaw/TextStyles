//
//  TextStyle.swift
//  TextStyles
//
//  Created by Gabrielle Earnshaw on 02/05/2018.
//  Copyright © 2018 Gabrielle Earnshaw. All rights reserved.
//

import Foundation
import UIKit

class TextStyle {
    enum Style: CGFloat {
        case small = 10
        case caption = 12
        case body = 14
        case subheader = 17
        case title = 20
        case headline = 24
        case display = 32
    }

    enum Emphasis {
        case style1
        case style2
    }

    enum Color {
        case primary
        case accent1
        case accent2
        case accent3
        case black
    }

    enum Alignment {
        case left
        case center
        case right
    }

    private let opacity: CGFloat = 0.9

    // State
    private let style: Style
    private let emphasis: Emphasis
    let color: Color
    let alignment: Alignment

    init(style: Style, color: Color, emphasis: Emphasis, alignment: Alignment) {
        self.style = style
        self.color = color
        self.emphasis = emphasis
        self.alignment = alignment
    }
}

// MARK: - text style accessors
extension TextStyle {
    /// Get the colour that should be used, taking into account both the colour and the opacity
    ///
    /// - Returns: the colour of the font
    var colorWithAlpha: UIColor {
        // Get the base colour
        let baseColor: UIColor
        switch color {
        case .primary:
            baseColor = UIColor(red: 64/255, green: 0/255, blue: 255/255, alpha: 100/100)
        case .accent1:
            baseColor = UIColor(red: 0/255, green: 211/255, blue: 167/255, alpha: 100/100)
        case .accent2:
            baseColor = UIColor(red: 255/255, green: 192/255, blue: 0/255, alpha: 100/100)
        case .accent3:
            baseColor = UIColor(red: 255/255, green: 0/255, blue: 72/255, alpha: 100/100)
        case .black:
            baseColor = UIColor(red: 12/255, green: 0/255, blue: 51/255, alpha: 100/100)
        }

        // Combine with the opacity
        return baseColor.withAlphaComponent(opacity)
    }

    /// Get the font object that should be used for this text style
    ///
    /// - Returns: a UIFont, based on the style and the emphasis
    var font: UIFont {
        let weight: UIFont.Weight
        switch emphasis {
        case .style1:
            weight = UIFont.Weight.regular
        case .style2:
            weight = UIFont.Weight.semibold
        }

        return UIFont.systemFont(ofSize: style.rawValue, weight: weight)
    }

    /// Gets attributes for the styled font
    ///
    /// - Returns: the font and colour attributes
    var attributes: [NSAttributedStringKey: Any] {
        return [NSAttributedStringKey.font: font,
                NSAttributedStringKey.foregroundColor: colorWithAlpha]
    }

    /// Get an attributed string based on the styled font
    ///
    /// - Parameter string: the string
    /// - Returns: an attributed string
    func getAttributedString(string: String) -> NSAttributedString {
        return NSAttributedString(string: string, attributes: attributes)
    }
}

// MARK: - UIButton extension to add styling
extension UIButton {
    func setTitle(_ title: String, with textStyle: TextStyle, for controlState: UIControlState) {
        setAttributedTitle(textStyle.getAttributedString(string: title), for: controlState)
    }
}

// MARK: - UILabel extension to add styling
extension UILabel {
    func style(with textStyle: TextStyle) {
        font = textStyle.font
        textColor = textStyle.colorWithAlpha

        let textAlignment: NSTextAlignment
        switch textStyle.alignment {
        case .center:
            textAlignment = .center
        case .left:
            textAlignment = .left
        case.right:
            textAlignment = .right
        }
        self.textAlignment = textAlignment
    }
}

// MARK: - UIBarButtonItem extension to add styling
extension UIBarButtonItem {
    func style(with textStyle: TextStyle, for controlState: UIControlState) {
        self.setTitleTextAttributes(textStyle.attributes, for: controlState)
    }
}
