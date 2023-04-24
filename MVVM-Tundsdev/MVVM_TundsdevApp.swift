//
//  MVVM_TundsdevApp.swift
//  MVVM-Tundsdev
//
//  Created by Brian McIntosh on 4/23/23.
//

import SwiftUI

@main
struct MVVM_TundsdevApp: App {
    
    @StateObject private var vm = CounterViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                CounterDetailView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
            .environmentObject(vm)
        }
    }
}
