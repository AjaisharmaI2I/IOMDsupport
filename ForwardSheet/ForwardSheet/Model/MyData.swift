//
//  MyData.swift
//  ForwardSheet
//
//  Created by Ideas2IT on 10/08/23.
//

class MyData {
    var title: String
    var options: [[String: Any]]
    var isExpanded: Bool = false
    
    init(title: String, options: [[String : Any]], isExpanded: Bool = false) {
        self.title = title
        self.options = options
        self.isExpanded = isExpanded
    }
}
