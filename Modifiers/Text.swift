//
//  Text.swift
//  Todo
//
//  Created by Flávio  Nascimento on 22/12/21.
//

import SwiftUI

extension Text {
    func active(
        _ active: Bool,
        _ modifier: (Text) -> Text
    ) -> Text {
        guard active else { return self }
        return modifier(self)
    }
}
