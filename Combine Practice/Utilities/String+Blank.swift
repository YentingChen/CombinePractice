//
//  String+Blank.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/23.
//

import Foundation

extension String {
    /// A Boolean value indicating whether a String is blank.
    /// The string is blank if it is empty or only contains whitespace.
    var isBlank: Bool {
        return allSatisfy { $0.isWhitespace }
    }
}

extension Optional where Wrapped == String {
    /// A Boolean value indicating whether an Optional String is blank.
    /// The optional string is blank if it is nil, empty or only contains whitespace.
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
}
