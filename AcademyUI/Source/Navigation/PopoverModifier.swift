import SwiftUI

public struct PopoverModifier<Item: Identifiable, Destination: View>: ViewModifier {
    private let item: Binding<Item?>
    private let destination: (Item) -> Destination

    init(item: Binding<Item?>,
         @ViewBuilder content: @escaping (Item) -> Destination) {

        self.item = item
        self.destination = content
    }

    public func body(content: Content) -> some View {
        content.popover(item: item, content: destination)
    }
}
