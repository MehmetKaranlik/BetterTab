//
//  ContentView.swift
//  Example
//
//  Created by mehmet karanlık on 24.01.2023.
//

import SwiftUI
import BetterTab

struct ContentView: View {
   @State var selection : BetterTabItem = DataProvider.items[0]
    var body: some View {
       BetterTabView(
         selectedTint: .yellow,
         unselectedTint: .white,
         selection: $selection, backgroundColor: .red,
         cornerRadius: nil, selectedTabBackgroundColor: nil,
         unSelectedTabBackgroundColor: nil
       ) {
          Color.blue
             .onAppear(perform: {
                print("view 1 is initialized")
             })
             .betterTabItem(selection: $selection) {
                DataProvider.items[0]
             }
          Color.yellow
             .onAppear(perform: {
                print("view 2 is initialized")
             })
             .betterTabItem(selection: $selection) {
                DataProvider.items[1]
             }
          Color.cyan
             .onAppear(perform: {
                print("view 3 is initialized")
             })
             .betterTabItem(selection: $selection) {
                DataProvider.items[2]
             }
            
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DataProvider {
   static let items = [
      BetterTabItem{
         VStack {
            Image(systemName: "house")
            Text("hello")
         }
      },
      BetterTabItem{
         VStack {
            Image(systemName: "car")
            Text("hello")
         }
      },
      BetterTabItem{
         VStack {
            Image(systemName: "person")
            Text("hello")
         }
      },
   ]
}
