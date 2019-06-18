//
//  ArrayExtension.swift
//  SGADatePicker
//
//  Created by Tam on 6/17/19.
//  Copyright © 2019 SaiGonApps Team. All rights reserved.
//

import UIKit
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
