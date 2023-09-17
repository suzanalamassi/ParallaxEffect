//
//  SliderView.swift
//  ParrallaxSlider
//
//  Created by Suzan Amassy on 15/08/2023.
//

import SwiftUI

/// `SliderView` is a horizontal scrolling view displaying a collection of travel cards.
/// Each card has a parallax effect and overlay information.
struct SliderView: View {	
    var items: [T]
    init(items: [T]) {
        self.items = items
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            let size = geometry.size
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(items) { item in
                        GeometryReader(content: { proxy in
                            let cardSize = proxy.size
                            let minX = min((proxy.frame(in: .global).minX - 30.0) * 1.4, size.width * 1.2)
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .scaleEffect(1.3)
                                .offset(x: -minX)
                                .frame(width: cardSize.width )
                                .frame(height: cardSize.height)
                                .overlay {
                                    OverlayView(item)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(color: Color.black.opacity(0.25), radius: 8, x: 5, y: 10)
                        })
                        .frame(width: size.width - 60, height: size.height - 50)
                        .frame(maxHeight: .infinity) // Expand the height to fill ScrollView
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .frame(height: size.height, alignment: .top)
        })
        .frame(height: 500)
    }
	
	/// Creates an overlay for the given travel card. The overlay contains the title and subtitle of the card.
	/// The overlay also has a gradient background that gets darker at the bottom to ensure text readability.
	///
	/// - Parameter card: The `TravelCard` object which contains the details to be displayed.
	/// - Returns: A `View` with the overlay content.
    @ViewBuilder
    func OverlayView(_  item: T) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                Color(red: 0.10, green: 0.10, blue: 0.10).opacity(0.1),
                Color(red: 0.10, green: 0.10, blue: 0.10).opacity(0.7),
            ], startPoint: .top, endPoint: .bottom)

            VStack(alignment: .leading, spacing: 4, content: {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(.bottom, 4)

                Text(item.subTitle)
                    .font(.callout)
                    .foregroundColor(.white)
            })
            .padding(20)
        })
    }
}

#Preview {
	SliderView()
}












