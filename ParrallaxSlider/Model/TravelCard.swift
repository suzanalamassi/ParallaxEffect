//
//  CarCard.swift
//  ParrallaxSlider
//
//  Created by Suzan Amassy on 15/08/2023.
//

import Foundation


struct TravelCard: Identifiable, Hashable {
	var id: UUID = .init()
	var title: String
	var subTitle: String
	var image: String
}

var travelCard: [TravelCard] = [
	.init(title: "Santorini", subTitle: "Greece", image: "Pic 1"),
	.init(title: "Maldives", subTitle: "Archipelagic", image: "Pic 2"),
	.init(title: "Cappadocia", subTitle: "Turkey", image: "Pic 3"),
]
