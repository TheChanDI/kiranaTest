//
//  Button.swift
//  kirana
//
//  Created by ENFINY INNOVATIONS on 4/7/20.
//  Copyright © 2020 ENFINY INNOVATIONS. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(bgColor: UIColor, title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        setTitle(title, for: .normal)
        layer.cornerRadius = 6
      
    }
}
