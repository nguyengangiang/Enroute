//
//  EnrouteApp.swift
//  Enroute
//
//  Created by Giang Nguyenn on 1/30/21.
//

import SwiftUI

@main
struct EnrouteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        let context = persistenceController.container.viewContext
        let airport = Airport.withICAO("KSFO", context: context)
        airport.fetchIncomingFlights()
        let contentView = FlightsEnrouteView(flightSearch: FlightSearch(destination: airport)).environment(\.managedObjectContext, context)
        return WindowGroup {
            contentView
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
