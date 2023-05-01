# Tundsdev: MVVM, ViewModel, EnvironmentObject, DetailView in a TabView

| <img src="https://github.com/Brian-McIntosh/MVVM-Tundsdev/blob/main/images/1.png" width="250"/>        | <img src="https://github.com/Brian-McIntosh/MVVM-Tundsdev/blob/main/images/2.png" width="250"/>           |
| ------------- |:-------------:|


MVVM_TundsdevApp.swift
```swift
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
```

ContentView.swift
```swift
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
```

CounterDetailView.swift
```swift
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
```
