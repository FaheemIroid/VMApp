//
//  VMAppTests.swift
//  VMAppTests
//
//  Created by Faheem Hussain on 02/08/22.
//

import XCTest
@testable import VMApp


class VMAppTests: XCTestCase {
    
    var viewControllerUnderTest: PeopleViewController!

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "PeopleViewController") as? PeopleViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }

    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.tvList)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.tvList.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.tvList.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.tvList, cellForRowAt: IndexPath(row: 0, section: 0)) as? TblListCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "TblListCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    
    func testTableCellHasCorrectLabelText() {
        let cell0 = viewControllerUnderTest.tableView(viewControllerUnderTest.tvList, cellForRowAt: IndexPath(row: 0, section: 0)) as? TblListCell
        XCTAssertEqual(cell0?.lbName.text, "one")
        
        let cell1 = viewControllerUnderTest.tableView(viewControllerUnderTest.tvList, cellForRowAt: IndexPath(row: 1, section: 0)) as? TblListCell
        XCTAssertEqual(cell1?.lbName.text, "two")
        
        let cell2 = viewControllerUnderTest.tableView(viewControllerUnderTest.tvList, cellForRowAt: IndexPath(row: 2, section: 0)) as? TblListCell
        XCTAssertEqual(cell2?.lbName.text, "three")
    }

    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
