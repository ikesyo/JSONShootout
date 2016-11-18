//
//  Himotoki_Tests.swift
//  JSONShootout
//
//  Created by Syo Ikeda on 11/19/16.
//  Copyright © 2016 SwiftBit. All rights reserved.
//

import XCTest
import ModelObjects
import Himotoki

class Himotoki_Tests: XCTestCase {
    
    func testDeserialization() {
        self.measure {
            let d: NSDictionary = try! JSONSerialization.jsonObject(with: self.data, options: []) as! NSDictionary
            XCTAssert(d.count > 0)
        }
    }

    func testPerformance() {
        let json = try! JSONSerialization.jsonObject(with: self.data, options: [])

        self.measure {
            let programs: [Program] = try! decodeArray(json, rootKeyPath: [ "ProgramList", "Programs" ])
            XCTAssert(programs.count > 1000)
        }
    }


    private lazy var data: Data = {
        let path = Bundle(for: type(of: self)).url(forResource: "Large", withExtension: "json")
        let data = try! Data(contentsOf: path!)
        return data
    }()

}
