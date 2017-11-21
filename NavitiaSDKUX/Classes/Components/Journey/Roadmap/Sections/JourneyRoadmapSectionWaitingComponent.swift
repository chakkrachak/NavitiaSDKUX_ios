import Foundation
import Render
import NavitiaSDK

extension Components.Journey.Roadmap.Sections {
    class WaitingComponent: ViewComponent {
        let DottedComponent:Components.Journey.Roadmap.Sections.LineDiagram.DottedComponent.Type = Components.Journey.Roadmap.Sections.LineDiagram.DottedComponent.self
        let SectionLayoutComponent:Components.Journey.Roadmap.Sections.SectionLayoutComponent.Type = Components.Journey.Roadmap.Sections.SectionLayoutComponent.self
        let StopPointComponent:Components.Journey.Roadmap.Sections.StopPointComponent.Type = Components.Journey.Roadmap.Sections.StopPointComponent.self
        let DescriptionComponent:Components.Journey.Roadmap.Sections.Transfer.DescriptionComponent.Type = Components.Journey.Roadmap.Sections.Transfer.DescriptionComponent.self
        let WaitingComponent:Components.Journey.Roadmap.Sections.Transfer.WaitingComponent.Type = Components.Journey.Roadmap.Sections.Transfer.WaitingComponent.self

        var section: Section?
        var waitingSection: Section?

        override func render() -> NodeType {
            var waitingSectionComponent: NodeType = ComponentNode(ViewComponent(), in: self)
            if waitingSection != nil {
                waitingSectionComponent = ComponentNode(self.WaitingComponent.init(), in: self, props: { (component: Components.Journey.Roadmap.Sections.Transfer.WaitingComponent, _) in
                    component.section = self.waitingSection
                })
            }

            return ComponentNode(ViewComponent(), in: self).add(children: [
                ComponentNode(self.DottedComponent.init(), in: self, props: { (component: Components.Journey.Roadmap.Sections.LineDiagram.DottedComponent, _) in
                    component.color = getUIColorFromHexadecimal(hex: "888888")
                }),
                ComponentNode(self.SectionLayoutComponent.init(), in: self, props: { (component: Components.Journey.Roadmap.Sections.SectionLayoutComponent, _) in
                    component.header = ComponentNode(self.StopPointComponent.init(), in: self, props: { (component: Components.Journey.Roadmap.Sections.StopPointComponent, _) in
                        component.section = self.section
                        component.sectionWay = SectionWay.departure
                        component.color = getUIColorFromHexadecimal(hex: "888888")
                    })
                    component.body = ComponentNode(ViewComponent(), in: self, props: { (component: ViewComponent, _) in

                    }).add(children: [
                        ComponentNode(self.DescriptionComponent.init(), in: self, props: { (component: Components.Journey.Roadmap.Sections.Transfer.DescriptionComponent, _) in
                            component.section = self.section
                        }),
                        waitingSectionComponent
                    ])
                    component.footer = ComponentNode(self.StopPointComponent.init(), in: self, props: { (component: Components.Journey.Roadmap.Sections.StopPointComponent, _) in
                        component.section = self.section
                        component.sectionWay = SectionWay.arrival
                        component.color = getUIColorFromHexadecimal(hex: "888888")
                    })
                }),
            ])
        }
    }
}
