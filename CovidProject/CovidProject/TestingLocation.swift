//
//  TestingLocation.swift
//  CovidProject
//
//  Created by Donnell Debnam on 4/12/21.
//

import Foundation

struct TestingLocation: Codable {
    
    // JSON keys
    var id: String
    var organization_id: String
    var name: String
    var alternate_name: String
    var description: String
    var transportation: String
    var updated: String
    var featured: String
    
    var physical_address: [PhysicalAddress]
    var phones: [Phone]
    var regular_schedule: [DailySchedule]
    
}


struct PhysicalAddress: Decodable, Encodable {
    var id: String
    var location_id: String
    var address_1: String
    var city: String
    var region: String
    var state_province: String
    var postal_code: String
    var country: String
}

struct Phone: Decodable, Encodable {
    var id: String
    var location_id: String
    var number: String
    var num_extension: String
    var type: String
    var language: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case location_id
        case number
        case type
        case language
        case description
        
        case num_extension = "extension"
    }
    
    init(from decoder: Decoder ) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        location_id = try container.decode(String.self, forKey: .location_id)
        number = try container.decode(String.self, forKey: .number)
        type = try container.decode(String.self, forKey: .type)
        language = try container.decode(String.self, forKey: .language)
        description = try container.decode(String.self, forKey: .description)
        num_extension = try container.decode(String.self, forKey: .num_extension)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(num_extension, forKey: .num_extension)
    }
}

struct DailySchedule: Decodable, Encodable {
    var id: String
    var location_id: String
    var weekday: String
    var opens_at: String
    var closes_at: String
}
