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
    
    
}
