//
//  CircularLinkedList.swift
//  DSA
//
//  Created by Anup Harbade on 2/2/20.
//  Copyright © 2020 Anup Harbade. All rights reserved.
//

import Foundation

struct CircularLinkedList <T: Equatable> {
    
    var head: Node<T>?
    
    
    var size: Int {
        var length = 0
        if var node = head {
            repeat {
                length += 1
                node = node.next!
            } while node !== head
        }
        return length
    }
    
    mutating func insert(value: T) {
        
        let newNode = Node(value: value, next: nil)
        
        if var node = head {
            repeat {
                node = node.next!
            } while node.next !== head
            
            newNode.next = head
            node.next = newNode
        } else {
            //Linked List is empty, this would be the first node in the list
            head = newNode
            newNode.next = head
        }
    }
    
    mutating func deleteLast() -> T? {
        guard size != 1 else {
            let value = head?.value
            head = nil
            return value
        }
        
        if var node = head {
            var prevNode: Node<T>? = node
            while node.next !== head {
                prevNode = node
                node = node.next!
            }
            
            prevNode?.next = head
            return node.value
        }
        
        return nil
    }
    
    mutating func delete(value: T) -> T? {
        if var node = head?.next, var previous = head {
            var found = false
            
            repeat {
                if node.value == value {
                    // This is the node to delete.
                    found = true
                    break
                }
                
                previous = node
                node = node.next!
            } while node !== head?.next
            
            if found {
                if size == 1 {
                    head = nil
                } else {
                    previous.next = node.next
                    if node === head {
                        head = node.next
                    }
                }
            } else {
                print("\n\(value) doesn't exist in the linked list.")
            }
        }
        return nil
    }
    
    func printCircularLinkedList() {
        
        if var node = head {
            repeat {
                print("\(node.value) -> ", terminator: "")
                node = node.next!
            } while node !== head
        } else {
            print("Circular Linked List is empty.")
        }
    }
}
