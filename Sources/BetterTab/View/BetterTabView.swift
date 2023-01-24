import SwiftUI




@available(iOS 15.0.0, *)
public struct BetterTabView<Content :View> : View {

   let selectedTint : Color
   let unselectedTint : Color

   @State var betterTabItems: [BetterTabItem] = []
   @Binding var selection : BetterTabItem

   let backgroundColor: Color
   let cornerRadius : CGFloat?
   let selectedTabBackgroundColor: Color?
   let unSelectedTabBackgroundColor : Color?
   @ViewBuilder var content : Content

  public init(
   selectedTint: Color, unselectedTint: Color,
   selection: Binding<BetterTabItem>, backgroundColor: Color,
   cornerRadius: CGFloat?, selectedTabBackgroundColor: Color?,
   unSelectedTabBackgroundColor: Color?,@ViewBuilder content: () -> Content
  ) {
      self.selectedTint = selectedTint
      self.unselectedTint = unselectedTint
      self._selection = selection
      self.backgroundColor = backgroundColor
      self.cornerRadius = cornerRadius
      self.selectedTabBackgroundColor = selectedTabBackgroundColor
      self.unSelectedTabBackgroundColor = unSelectedTabBackgroundColor
      self.content = content()
   }

  public var body: some View {
      VStack(spacing:0) {
         ZStack {
            content
         }
         BetterTabBar(
            selectedTint: selectedTint, unselectedTint: unselectedTint,
            betterTabItems: betterTabItems, selection: $selection,
            backgroundColor: backgroundColor, cornerRadius: cornerRadius,
            selectedTabBackgroundColor: selectedTabBackgroundColor,
            unSelectedTabBackgroundColor: unSelectedTabBackgroundColor
         )
      }
      .onPreferenceChange(BetterPreferenceKey.self) { value in
         betterTabItems += value
      }
      .ignoresSafeArea(edges: .bottom)
      .onAppear {
         if let item = betterTabItems.first {
            selection = item
         }
      }
   }
}

