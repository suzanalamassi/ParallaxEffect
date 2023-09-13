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
	var body: some View {
		GeometryReader(content: { geometry in
			let size = geometry.size
			
			ScrollView(.horizontal) {
				HStack(spacing: 5) {
					ForEach(travelCard) { card in
						GeometryReader(content: { proxy in
							let cardSize = proxy.size
							let minX = min((proxy.frame(in: .scrollView).minX - 30.0) * 1.4, size.width * 1.2)
							
							// Card image with parallax effect.
							Image(card.image)
								.resizable()
								.aspectRatio(contentMode: .fill)
								.scaleEffect(1.3)
								.offset(x: -minX)
								.frame(width: proxy.size.width * 2.5)
								.frame(width: cardSize.width, height: cardSize.height)
								.overlay {
									OverlayView(card)
								}
								.clipShape(.rect(cornerRadius: 30))
								.shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
						})
						.frame(width: size.width - 60, height: size.height - 50)
						// Interactive transition when scrolling.
						.scrollTransition(.interactive, axis: .horizontal) { view, phase in
							view
								.scaleEffect(phase.isIdentity ? 1 : 0.95)
						}
					}
				}
				.padding(.horizontal, 20)
				.padding(.vertical, 5)
				.scrollTargetLayout()
				.frame(height: size.height, alignment: .top)
			}
			.scrollTargetBehavior(.viewAligned)
			.scrollIndicators(.hidden)
		})
		.frame(height: 500)
	}
	
	/// Creates an overlay for the given travel card. The overlay contains the title and subtitle of the card.
	/// The overlay also has a gradient background that gets darker at the bottom to ensure text readability.
	///
	/// - Parameter card: The `TravelCard` object which contains the details to be displayed.
	/// - Returns: A `View` with the overlay content.
	@ViewBuilder
	func OverlayView(_ card: TravelCard) -> some View {
		ZStack(alignment: .bottomLeading, content: {
			LinearGradient(colors: [
				.clear,
				.clear,
				.clear,
				Color(red: 0.10, green: 0.10, blue: 0.10).opacity(0.1),
				Color(red: 0.10, green: 0.10, blue: 0.10).opacity(0.7),
			], startPoint: .top, endPoint: .bottom)
			
			VStack(alignment: .leading, spacing: 4, content: {
				Text(card.title)
					.font(.title)
					.fontWeight(.black)
					.foregroundStyle(.white)
				
				Text(card.subTitle)
					.font(.callout)
					.foregroundStyle(.white)
			})
			.padding(20)
		})
	}
}

#Preview {
	SliderView()
}












