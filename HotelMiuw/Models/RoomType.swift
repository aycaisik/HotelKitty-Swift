//
//  RoomType.swift
//  HotelMiuw
//
//  Created by Ayça Işık on 16.01.2023.
//

import Foundation

//MARK: - Properties
struct RoomType : Equatable{
    var id : Int
    var name : String
    var shortName : String
    var price : Int
    
//MARK: - Functions
    
     static func ==(lhs:RoomType,rhs:RoomType) -> Bool{
         return lhs.id == rhs.id
    }
    
    //Static bir şey oluşturucam çünkü ben struct veya class üzerinden tüm oda tiplerine ulaşmak //istiyorum. Static yaptığımızda instance değil de struct ve class tan çekebiliriz.
    //Static yazarsan classın yazmazsan objenin olur...
    
    static var all: [RoomType] {
        return [
            RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
            RoomType(id: 1, name: "One King", shortName: "K", price: 209),
            RoomType(id: 2, name: "Suit", shortName: "S", price: 309),
        ]
    }

    //RoomType.all
    
}
