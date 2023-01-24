import SwiftUI



@available(iOS 15.0.0, *)
struct BetterPreferenceKey : PreferenceKey {
   internal typealias Value = [BetterTabItem]

   static var defaultValue: Value {
      return []
   }

   static func reduce(value: inout Value, nextValue: () -> Value) {
      value += nextValue()
   }

}


@available(iOS 15.0.0, *)
struct BetterTabModifier : ViewModifier {

   @Binding var selection : BetterTabItem
   let tabBarItem : BetterTabItem

   func body(content: Content) -> some View {
      content
         .opacity(tabBarItem == selection ? 1 : 0)
         .preference(key: BetterPreferenceKey.self, value: [tabBarItem])
   }
   
}

@available(iOS 15.0.0, *)
public extension View {
    func betterTabItem(selection : Binding<BetterTabItem>,   _ item: @escaping ()-> BetterTabItem) -> some View {
      self
         .modifier(BetterTabModifier(selection:selection,tabBarItem: item()))
   }
}
