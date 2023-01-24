import SwiftUI

@available(iOS 15.0.0, *)
struct BetterTabBar : View {
   // Properties

   let selectedTint : Color
   let unselectedTint : Color
   let betterTabItems : [BetterTabItem]
   @Binding var selection : BetterTabItem
   let backgroundColor : Color
   let cornerRadius : CGFloat?
   let selectedTabBackgroundColor : Color?
   let unSelectedTabBackgroundColor : Color?

   // body
   var body: some View {
      HStack {
         ForEach(betterTabItems) { tab in
            tabView(item: tab,isSelected: tab == selection)
               .onTapGesture {
                  switchTab(tab)
               }
         }
      }
      .padding(.horizontal)
      .frame(minHeight: 50 + (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? CGFloat.zero))
      .background(backgroundColor)
     
   }

}

@available(iOS 15.0.0, *)
extension BetterTabBar {

private func switchTab(
      _ tab : BetterTabItem)
   {
      withAnimation(.easeInOut) {
            selection = tab
         }
   }

private func tabView(
      item : BetterTabItem,
      isSelected : Bool
   ) -> some View {
     AnyView(item.icon())
      .foregroundColor(isSelected ? selectedTint : unselectedTint)
      .padding(.vertical,8)
      .frame(maxWidth: .infinity)
      .background(
         isSelected ?  selectedTabBackgroundColor : unSelectedTabBackgroundColor
      )
      .cornerRadius(cornerRadius ?? 0)
      .padding(.bottom)

   }

}
