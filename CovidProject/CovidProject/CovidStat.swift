//
//  CovidStat.swift
//  CovidProject
//
//  Created by Stephen Thompson on 4/18/21.
//

import Foundation

struct CovidStat: Codable {
    //JSON KEYS
    var zipCd: String
    var geo: Geo
    var countries: [Country]
}

struct Geo: Decodable,Encodable {
    
    var rightTopLatLong: Float
    var leftBottomLatLong: Float
    var leftTopLatLong: Float
    var rightBottomLatLong: Float
}

struct Country: Decodable,Encodable {
    
    var countyName: String
    var deathCt: Int
    var positiveCt: Float
    var recoveredCt: Float
}
