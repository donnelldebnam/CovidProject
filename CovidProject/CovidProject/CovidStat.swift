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
    var counties: [County]
}

struct Geo: Decodable, Encodable {
    var rightTopLatLong: Float
    var leftBottomLatLong: Float
    var leftTopLatLong: Float
    var rightBottomLatLong: Float
}

struct County: Decodable, Encodable {
    var countyName: String
    var deathCt: Int
    var positiveCt: Int
    var recoveredCt: Int?
    
    enum CodingKeys: String, CodingKey {
        case countyName = "countyName"
        case deathCt = "deathCt"
        case positiveCt = "positiveCt"
        case recoveredCt = "recoveredCt"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        countyName = try container.decode(String.self, forKey: .countyName)
        deathCt = try container.decode(Int.self, forKey: .deathCt)
        positiveCt = try container.decode(Int.self, forKey: .positiveCt)
        recoveredCt = try container.decodeIfPresent(Int.self, forKey: .recoveredCt)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(countyName, forKey: .countyName)
        try container.encode(deathCt, forKey: .deathCt)
        try container.encode(positiveCt, forKey: .positiveCt)
        try container.encode(recoveredCt, forKey: .recoveredCt)
    }
    
}
