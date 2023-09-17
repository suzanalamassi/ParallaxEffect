//
//  CarCard.swift
//  ParrallaxSlider
//
//  Created by Suzan Amassy on 15/08/2023.
//

import Foundation


protocol CardItem: Identifiable {
    var image: String { get }
    var title: String { get }
    var subTitle: String { get }
}
struct TravelCard: CardItem {
    let id = UUID()
    let image: String
    let title: String
    let subTitle: String
}

//sideNote: I removed the spaces 
var travelCards: [TravelCard] = [
    .init(image: "Pic1", title: "Toronto", subTitle: "Ontario"),
    .init(image: "Pic2", title: "Hamilton", subTitle: "Ontario"),
    .init(image: "Pic3", title: "London", subTitle: "Ontario"),
]
