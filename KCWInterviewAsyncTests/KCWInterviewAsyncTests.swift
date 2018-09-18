//
//  KCWInterviewAsyncTests.swift
//  KCWInterviewAsyncTests
//
//  Created by Kerry Washington on 8/31/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import XCTest
@testable import KCWInterview
class KCWInterviewAsyncTests: XCTestCase {
    
    let testBadURL = "https://itunes.apple.com/search?media=music&entity=song&term=abba"
    let testGoodURL = "https://api.myjson.com/bins/d7wgd"
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetPizzaData() {
        
        let urlRequest = URL(string: testGoodURL)
        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                let zumePizzaData = try JSONDecoder().decode([PizzaModel].self, from: data)
                DispatchQueue.main.async {
                    XCTAssertEqual(zumePizzaData.count, 4, "Count of datgrams should be 4")
                }
            } catch let jsonError {
                print("JSON Error \(jsonError)")
            }
        }.resume()
            
    }
    
    func testGetBadPizzaData() {
        
        let urlRequest = URL(string: testBadURL)
        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                let zumePizzaData = try JSONDecoder().decode([PizzaModel].self, from: data)
                DispatchQueue.main.async {
                    XCTFail("No data should be found")
                }
            } catch let jsonError {
                print("JSON Error \(jsonError)")
            }
            }.resume()
        
    }
 
    
}
