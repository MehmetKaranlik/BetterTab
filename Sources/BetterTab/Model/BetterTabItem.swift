//
//  File.swift
//  
//
//  Created by mehmet karanlık on 24.01.2023.
//

import Foundation
import SwiftUI

@available(iOS 15.0.0, *)
public struct BetterTabItem {
   public let id : UUID = UUID()
   @ViewBuilder let icon : () -> any View

   public init( _ icon: @escaping ()-> any View) {
      self.icon = icon
   }
}

@available(iOS 15.0.0, *)
extension BetterTabItem : Hashable,Equatable,Identifiable  {
   public func hash(into hasher: inout Hasher) {
      hasher.combine(id)
   }
 public  static func == (lhs: BetterTabItem, rhs: BetterTabItem) -> Bool {
      lhs.id == rhs.id
   }

}


