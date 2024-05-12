//
//  UnitTestForNetworkingClass.swift
//  UnitTestingAssignment.Tests
//
//  Created by valeri mekhashishvili on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

class NetworkManagerTests: XCTestCase {

    func testFetchProducts() {
        let expectation = self.expectation(description: "Fetching products from API")

        let apiUrl = URL(string: "https://dummyjson.com/products")!

        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            XCTAssertNil(error, "მოხდა შეცდომა: \(error?.localizedDescription ?? "")")
            XCTAssertNotNil(data, "არ გვაქვს დატა")
            
            do {
                let decoder = JSONDecoder()
                let productsResponse = try decoder.decode(Sasass.self, from: data!)
                
                XCTAssertFalse(productsResponse.products.isEmpty, "არ გვაქვს პროდუქტები")

                for product in productsResponse.products {
                    print(product.id as Any, "xxxx")
                    XCTAssertNotNil(product.id, "id არ უნდა იყოს nil")
                }
                
                expectation.fulfill()
            } catch {
                XCTFail("ვერ მოხდა დეკოდირება: \(error.localizedDescription)")
            }
        }.resume()

        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
