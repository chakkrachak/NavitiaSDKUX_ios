import Foundation
import Render
import NavitiaSDK

class JourneyRoadmapSectionPublicTransportComponent: ViewComponent {
    var section: Section?

    override func render() -> NodeType {
        return ComponentNode(ViewComponent(), in: self, props: { (component, hasKey: Bool) in
            component.styles = self.sectionStyles
        }).add(children: [
            ComponentNode(LabelComponent(), in: self, props: { (component, hasKey: Bool) in
                if (self.section!.type != nil) {
                    component.text = self.section!.type!
                    component.styles = self.typeStyles
                }
            })
        ])
    }

    let sectionStyles: [String: Any] = [
        "backgroundColor": config.colors.white,
        "padding": config.metrics.marginL,
        "paddingTop": 0,
        "paddingBottom": 10,
        "borderRadius": config.metrics.radius,
        "marginBottom": config.metrics.margin,
        "shadowRadius": 2.0,
        "shadowOpacity": 0.12,
        "shadowOffset": [0, 0],
        "shadowColor": UIColor.black,
    ]

    let typeStyles: [String: Any] = [
        "fontWeight": "bold",
        "paddingTop": 6,
        "paddingBottom": 6,
    ]

    let separatorStyles: [String: Any] = [
        "marginBottom": 10,
    ]
}