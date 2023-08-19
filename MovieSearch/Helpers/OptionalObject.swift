//
//  OptionalObject.swift
//  MovieSearch
//
//  Created by Christopher Bonuel on 8/19/23.
//

import Foundation

// https://sarunw.com/posts/decode-array-with-corrupted-element/
public struct OptionalObject<Base: Decodable>: Decodable {
    public let value: Base?

    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(Base.self)
        } catch {
            self.value = nil
        }
    }
}
