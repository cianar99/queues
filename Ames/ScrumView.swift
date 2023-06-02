//
//  ScrumView.swift
//  Ames
//
//  Created by Ciana on 03/06/23.
//

import SwiftUI

struct ScrumView: View {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some View {
        ScrumsView(scrums: $store.scrums) {
            Task {
                do {
                    try await store.save(scrums: store.scrums)
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Try again later.")
                }
            }
        }
        .task {
            do {
                try await store.load()
            } catch {
                errorWrapper = ErrorWrapper(error: error,
                                            guidance: "Scrumdinger will load sample data and continue.")
            }
        }
        .sheet(item: $errorWrapper) {
            store.scrums = DailyScrum.sampleData
        } content: { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }
}

struct ScrumView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumView()
    }
}
