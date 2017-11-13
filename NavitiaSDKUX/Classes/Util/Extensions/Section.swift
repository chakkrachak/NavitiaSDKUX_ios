import Foundation

import NavitiaSDK

extension Section {
    public func getMatchingDisruptions(from disruptions: [Disruption]?, for date: Date?) -> [Disruption] {
        if (disruptions == nil) {
            return []
        }

        let linkIdsWithDisruption: [String] = self.displayInformations!.links!.filter { link in
            return (link.type == "disruption" && link.id != nil)
        }.map { link -> String in
            return link.id!
        }

        return disruptions!.filter { disruption in
            if (disruption.id != nil && linkIdsWithDisruption.contains(disruption.id!) && disruption.applicationPeriods != nil) {
                return (disruption.applicationPeriods!.filter { period in
                    return period.contains(date != nil ? date! : Date())
                }.count > 0)
            }

            return false
        }
    }
}
