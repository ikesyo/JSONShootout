//
//  Recording+Himotoki.swift
//  JSONShootout
//
//  Created by Syo Ikeda on 11/19/16.
//  Copyright © 2016 SwiftBit. All rights reserved.
//

import Foundation
import Himotoki

extension Recording : Decodable {
    public static func decode(_ e: Extractor) throws -> Recording {
        return try Recording(
            startTsStr: e <| "StartTs",
            status: (try? e <| "Status") ?? .Unknown,
            recordId: e <| "RecordId",
            recGroup: (try? e <| "RecGroup") ?? .Unknown
        )
    }
}

extension Recording.Status: Decodable {}
extension Recording.RecGroup: Decodable {}
