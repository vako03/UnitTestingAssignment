//
//  UnitTestingAssignment_Tests.swift
//  UnitTestingAssignment.Tests
//
//  Created by valeri mekhashishvili on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignment_Tests: XCTestCase {
    
    var cart: CartViewModel!
    
    
    override func setUpWithError() throws {
        
        cart = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        
        cart = nil
        
    }
    
    func testSelectedItemsQuantity() {
        let product1 = Product(id: 1, title: "Product 1", price: 15.50, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", price: 19.0, selectedQuantity: 1)
        cart.selectedProducts = [product1, product2]
        XCTAssertEqual(cart.selectedItemsQuantity, 3)
    }
    
    func testTotalPrice() {
        let product1 = Product(id: 1, title: "Product 1", price: 15.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", price: 22.0, selectedQuantity: 1)
        cart.selectedProducts = [product1, product2]
        XCTAssertEqual(cart.totalPrice, 52.0)
    }
    
    
    func testAddProductByID() {
        cart.allproducts = [Product(id: 1, title: "Product 1", price: 10.0)]
        cart.addProduct(withID: 1)
        XCTAssertEqual(cart.selectedProducts.count, 1)
    }
    
    func testAddProduct() {
        let productToAdd = Product(id: 2, title: "Product 2", price: 20.0)
        cart.addProduct(product: productToAdd)
        XCTAssertEqual(cart.selectedProducts.count, 1)
    }
    
    func testAddRandomProduct() {
        cart.allproducts = [Product(id: 1, title: "Product 1", price: 13.0)]
        cart.addRandomProduct()
        XCTAssertEqual(cart.selectedProducts.count, 1)
    }
    
    func testRemoveProduct() {
        let productToRemove = Product(id: 1, title: "Product 1", price: 6.0)
        cart.selectedProducts = [productToRemove]
        cart.removeProduct(withID: 1)
        XCTAssertEqual(cart.selectedProducts.count, 0)
    }
    
    func testClearCart() {
        cart.selectedProducts = [Product(id: 1, title: "Product 1", price: 20.0)]
        cart.clearCart()
        XCTAssertEqual(cart.selectedProducts.count, 0)
    }
    
}
