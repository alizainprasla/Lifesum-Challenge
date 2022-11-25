//
//  FoodInfoMapper.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 24/11/2022.
//

import Foundation

// MARK: - FoodInfoMapper
public struct FoodInfoMapper: Codable {
    let meta: Meta
    let response: FoodInfo?

    public static func map(data: Data) throws -> FoodInfoMapper {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(FoodInfoMapper.self, from: data)
        } catch {
            throw error
        }
    }
}

// MARK: - Meta
public struct Meta: Codable {
    let code: Int
}

// MARK: - Response
public struct FoodInfo: Codable {
    let title: String
    let calories: Int
    let carbs, protein, fat, saturatedfat: Double?
    let unsaturatedfat: Double?
    let fiber: Double?
    let cholesterol, sugar, sodium, potassium: Double?
    let gramsperserving: Double?
    let pcstext: String?
}
