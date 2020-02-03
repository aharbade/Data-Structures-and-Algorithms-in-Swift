//
//  ViewController.swift
//  DSA
//
//  Created by Anup Harbade on 1/19/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testDecimalToBinaryUsingStack()
//        testDoublyLinkedList()
//        testStack()
//        testLinkedList()
        testCircularLinkedList()
    }
    
    func testCircularLinkedList() {
        
        var circLinkedList: CircularLinkedList<Int> = CircularLinkedList()
        print("Initial size of the list \(circLinkedList.size)")
        
        circLinkedList.insert(value: 5)
        circLinkedList.insert(value: 6)
        circLinkedList.insert(value: 7)
        circLinkedList.insert(value: 8)
        circLinkedList.insert(value: 9)
        
        print("After insertion - ")
        circLinkedList.printCircularLinkedList()
        
        
        _ = circLinkedList.deleteLast()
        _ = circLinkedList.deleteLast()
        
        print("\nAfter deletion - ")
        circLinkedList.printCircularLinkedList()
        
        _ = circLinkedList.delete(value: 6)
        print("\nAfter deletion - ")
        circLinkedList.printCircularLinkedList()
        
        _ = circLinkedList.delete(value: 8)
        print("\nAfter deletion - ")
        circLinkedList.printCircularLinkedList()
        
        _ = circLinkedList.delete(value: 5)
        print("\nAfter deletion - ")
        circLinkedList.printCircularLinkedList()
        
        _ = circLinkedList.delete(value: 7)
        print("\nAfter deletion - ")
        circLinkedList.printCircularLinkedList()
        
        _ = circLinkedList.delete(value: 9)
        print("\nAfter deletion - ")
        circLinkedList.printCircularLinkedList()
        
    }
    
    /**
     Applications of STACK
     */
    func convertDecimalToBinary(decimalNumber: Int) {
        
        let startTimestamp = Date().timeIntervalSince1970
        var decimal = decimalNumber
        
        var stack: StackLL<Int> = StackLL()
        while decimal != 0 {
            let remainder = decimal%2
            stack.push(item: remainder)
            decimal /= 2
        }
        
        var binaryString = ""
        while !stack.isEmpty() {
            if let item = stack.pop() {
                binaryString.append(String(item))
            }
        }
        
        let endTimestamp = Date().timeIntervalSince1970
        
        print("Binary form of the \(decimalNumber) is \(binaryString)")
        print("Time to execute the algo: \(endTimestamp-startTimestamp) seconds")
    }
    
    fileprivate func testDecimalToBinaryUsingStack() {
        convertDecimalToBinary(decimalNumber: 4) //100
        convertDecimalToBinary(decimalNumber: 23) //10111
        convertDecimalToBinary(decimalNumber: 197) //11000101
        convertDecimalToBinary(decimalNumber: 1254) //10011100110
        convertDecimalToBinary(decimalNumber: 1254675834543) //10010010000100000100000011110011010101111
    }
    
    fileprivate func testStack() {
        var stack: StackLL<String> = StackLL()
        stack.push(item: "A")
        stack.push(item: "N")
        stack.push(item: "U")
        stack.push(item: "P")
        
        stack.printStack()
        
        _ = stack.pop()
        stack.printStack()
    }
    
    fileprivate func testLinkedList() {
        var list: LinkedList<Int> = LinkedList()
        
        // insert 5
        list.insert(value: 5)
        list.printLinkedList()
        
        // delete 5
        _ = list.delete(value: 5)
        list.printLinkedList()
        
        list.insert(value: 2)
        list.insert(value: 5)
        list.insert(value: 6)
        list.printLinkedList()
        
        // delete 5
        _ = list.delete(value: 5)
        list.printLinkedList()
        
        list.insert(value: 2)
        list.insert(value: 6)
        list.insert(value: 5)
        list.printLinkedList()
        
        // delete 5
        _ = list.delete(value: 5)
        list.printLinkedList()
        
        list.insert(value: 2)
        list.insert(value: 6)
        list.insert(value: 5)
        list.printLinkedList()
    }
    
    fileprivate func testDoublyLinkedList() {
        var doubly = DoublyLinkedList<Int>()
        
        doubly.insert(value: 5)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insert(value: 7)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insertAtHead(value: 9)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insert(value: 6, after: 5)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insert(value: 8, after: 7)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insert(value: 10, after: 9)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insert(value: 4, afterIndex: 0)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insert(value: 11, afterIndex: 6)
        doubly.printDoublyLinkedList()
        print("")
        doubly.insert(value: 12, afterIndex: 2)
        doubly.printDoublyLinkedList()
    }
    
}

