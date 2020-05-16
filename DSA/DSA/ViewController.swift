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
//        MARK: Activate these methods for the test
//        testDecimalToBinaryUsingStack()
//        testDoublyLinkedList()
//        testStack()
//        testLinkedList()
//        testCircularLinkedList()
//        testQueue()
//        testBinaryTree()
    }
    
    func testBinaryTree() {
        let btree: BinaryTree<Int> = BinaryTree()
        btree.insert(item: 20)
        btree.insert(item: 100)
        btree.insert(item: 3)
        btree.insert(item: 50)
        btree.insert(item: 15)
        btree.insert(item: 250)
        btree.insert(item: 35)
        btree.insert(item: 222)
        btree.insert(item: 588)
        
        print("In-Order")
        btree.inOrderTraversal(root: btree.rootNode)
        print("\nPre-Order")
        btree.preOrderTraversal(root: btree.rootNode)
        print("\n Post-Order")
        btree.postOrderTraversal(root: btree.rootNode)
        print("\n Level-Order")
        btree.levelOrderTraversal()
        
        print("\n Search an element")
        if let _ = btree.search(item: 250) {
            print("250 is available in the tree")
        }
        
        if let _ = btree.search(item: 20) {
            print("20 is available in the tree")
        }
        
        if let _ = btree.search(item: 68767) {
            print("68767 is available in the tree")
        } else {
            print("68767 is NOT available in the tree")
        }
        
        
        print("\n Deletion")
        btree.delete(item: 222)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 100)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 250)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 20)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 3)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 35)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 15)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 50)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 588)
        btree.levelOrderTraversal()
        
        print("\n Deletion")
        btree.delete(item: 56536)
        
        
    }
    
    func testQueue() {
        var queue: Queue<Int> = Queue()
        queue.enqueue(item: 5)
        queue.enqueue(item: 6)
        queue.enqueue(item: 7)
        queue.enqueue(item: 8)
        queue.enqueue(item: 9)
        queue.enqueue(item: 10)
        print("After insertion: ")
        queue.printQueue()
        
        _ = queue.dequeue()
        print("After deletion: ")
        queue.printQueue()
        
        _ = queue.dequeue()
        print("After deletion: ")
        queue.printQueue()
        
        _ = queue.dequeue()
        print("After deletion: ")
        queue.printQueue()
        
        _ = queue.dequeue()
        print("After deletion: ")
        queue.printQueue()
        
        _ = queue.dequeue()
        print("After deletion: ")
        queue.printQueue()
        
        _ = queue.dequeue()
        print("After deletion: ")
        queue.printQueue()
        
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

