//
//  CounterDetailView.swift
//  MVVM-Tundsdev
//
//  Created by Brian McIntosh on 4/23/23.
//

import SwiftUI

struct CounterDetailView: View {
    
    @EnvironmentObject private var vm: CounterViewModel
    
    var body: some View {
        VStack {
            Text("\(vm.val)")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .padding()
            Text("Number of taps")
        }
    }
}

struct CounterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CounterDetailView()
            .environmentObject(CounterViewModel())
    }
}
