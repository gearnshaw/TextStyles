//
//  ViewController.swift
//  TextStyles
//
//  Created by Gabrielle Earnshaw on 30/04/2018.
//  Copyright © 2018 Gabrielle Earnshaw. All rights reserved.
//

import UIKit

/// Example view controller showing how TextStyle can be used to style text elements
class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1 - call the code to configure the styles
        configureStyles()
    }
}

// MARK: - Styling
private extension ViewController {

    /// 2 - configure text styles. Call from viewDidLoad()
    func configureStyles() {
        let displayStyle = TextStyle(style: .display, color: .primary, emphasis: .style1, alignment: .center)
        displayLabel.style(with: displayStyle)

        let titleStyle = TextStyle(style: .title, color: .accent1, emphasis: .style2, alignment: .left)
        titleLabel.style(with: titleStyle)

        let bodyStyle = TextStyle(style: .body, color: .accent2, emphasis: .style1, alignment: .left)
        bodyLabel.style(with: bodyStyle)

        let captionStyle = TextStyle(style: .caption, color: .accent3, emphasis: .style2, alignment: .center)
        captionLabel.style(with: captionStyle)

        let buttonStyle = TextStyle(style: .body, color: .black, emphasis: .style1, alignment: .center)
        button.setTitle("My button text", with: buttonStyle, for: .normal)
    }
}
