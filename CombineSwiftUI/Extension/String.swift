//
//  String.swift
//  CombineSwiftUI
//
//  Created by HardiB.Salih on 6/15/24.
//

import Foundation

extension String {
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
