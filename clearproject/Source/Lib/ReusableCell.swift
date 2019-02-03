//
//  ReusableCell.swift
//  compot2
//
//  Created by Alexey Khomych on 2/26/18.
//  Copyright © 2018 About the code. All rights reserved.
//

import Foundation

public protocol FillCellType: class {
    /**
     Do not implement this method to prevent overriding of default realization
     */
    func tryFill(with model: Any)
}

protocol ReusableCellType: FillCellType {
    associatedtype Model
    static var reuseIdentifier: String { get }
    func fill(with model: Model)
}

extension ReusableCellType {

    func tryFill(with model: Any) {
        if let castedModel = model as? Model {
            self.fill(with: castedModel)
        } else {
            print("Cannot fill cell: \(self). Expected model type is \(Model.self)," +
                " but received \(type(of: model))")
        }
    }

    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
