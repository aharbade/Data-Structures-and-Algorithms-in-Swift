//
//  Queue.swift
//  DSA
//
//  Created by Anup Harbade on 1/29/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import Foundation


struct Queue <T: Equatable> {
    private var linkedList: LinkedList<T> = LinkedList()
    
    var size: Int {
        return linkedList.size
    }
    
    mutating func enqueue(item: T) {
        // This will add item at the end of the list
        linkedList.insert(value: item)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.deleteAtBeginning()
    }
    
    func isEmpty() -> Bool {
        return size <= 0 ? true : false
    }
    
    func printQueue() {
        linkedList.printLinkedList()
    }
}
