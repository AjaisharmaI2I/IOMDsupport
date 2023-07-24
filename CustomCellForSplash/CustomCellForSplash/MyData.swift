//
//  MyData.swift
//  CustomCellForSplash
//
//  Created by Ideas2IT on 24/07/23.
//

import Foundation

class MyData {
    var setupStep: String
    var imageName: String
    var titleMessage: String
    var subTitleMessage: String
    var isSelected: Bool
    
    init(setupStep: String = "", imageName: String, titleMessage: String, subTitleMessage: String, isSelected: Bool = false) {
        self.setupStep = setupStep
        self.imageName = imageName
        self.titleMessage = titleMessage
        self.subTitleMessage = subTitleMessage
        self.isSelected = isSelected
    }
}
