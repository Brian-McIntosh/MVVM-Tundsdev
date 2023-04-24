//
//  ContentView.swift
//  MVVM-Tundsdev
//
//  Created by Brian McIntosh on 4/23/23.
//

import SwiftUI

final class CounterViewModel: ObservableObject {
    
    @Published private(set) var val: Int = 0
    //if i don't need to write to this val from my view
    //instead, the view tells the viewmodel to handle it
    
    func increment() {
        val += 1
    }
}

struct ContentView: View {
    
//    @StateObject private var vm = CounterViewModel()
    @EnvironmentObject private var vm: CounterViewModel
    
    var body: some View {
        VStack {
            Text("\(vm.val)")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .padding()
            Button("Increase") {
                vm.increment()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CounterViewModel())
    }
}
