//
//  OtherExtension.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//

import Foundation

extension Collection {
    func toJSONString() -> String {
        let rawData = try! JSONSerialization.data(withJSONObject: self, options: [])
        let jsonData = String(data: rawData, encoding: String.Encoding.utf8)!
        return jsonData
    }
}
