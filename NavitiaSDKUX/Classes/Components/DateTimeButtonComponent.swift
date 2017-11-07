//
//  DateTimeButtonComponent.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import Foundation
import Render

class DateTimeButtonComponent: ButtonComponent {
    var datetime: Date?
    
    override func render() -> NodeType {
        let computedStyles: [String: Any] = mergeDictionaries(dict1: listRowStyles, dict2: self.styles)
        return ComponentNode(ButtonComponent(), in: self, props: {(component, hasKey: Bool) in
            component.styles = computedStyles
        }).add(children: [
            ComponentNode(TextComponent(), in: self, props: {(component, hasKey: Bool) in
                component.text = NSLocalizedString("component.DateTimeButtonComponent.representation.departure", bundle: self.bundle, comment: "Datetime represent label") + longDateText(datetime: self.datetime!)
                component.styles = self.textStyles
            })
        ])
    }
    
    let listRowStyles: [String: Any] = [
        "paddingTop": config.metrics.marginL,
        "paddingLeft": 0,
        "paddingRight": 0,
        "paddingBottom": config.metrics.margin,
        "flexDirection": YGFlexDirection.row,
    ]
    let textStyles: [String: Any] = [
        "color": config.colors.tertiaryText,
        "fontWeight": "bold",
    ]
    let viewStyles: [String: Any] = [
        "alignItems": YGAlign.flexEnd,
        "flexGrow": 1,
    ]
    let iconStyles: [String: Any] = [
        "color": config.colors.tertiaryText,
        "fontSize": 16,
    ]
}
