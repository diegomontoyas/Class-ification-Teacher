//
//  System.swift
//  Class-ification
//
//  Created by Diego on 4/14/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

let system = System()

class System: NSObject, GCDAsyncSocketDelegate
{
    var socket: GCDAsyncSocket!
    
    override init()
    {
        super.init()
        
        socket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        
        var error:NSError?
        let connected = socket.connectToHost("192.168.0.14", onPort: UInt16(8282), error: &error)
  
    }
    
    func throwChallengeWithCost(cost:Int, prize:Int)
    {
        if socket.isDisconnected
        {
            socket.connectToHost("192.168.0.14", onPort: UInt16(8282), error: nil)
        }
        
        let request = "THROW CHALLENGE:\(cost):\(prize)\n"
        
        socket.writeData(request.dataUsingEncoding(NSUTF8StringEncoding), withTimeout: 1, tag: 0)
    }
    
    func throwQuestionWithQuestion(question:String, answers:[String])
    {
        if socket.isDisconnected
        {
            socket.connectToHost("192.168.0.14", onPort: UInt16(8282), error: nil)
        }
        
        var request = "THROW QUESTION:\(question)"
        
        for answer in answers
        {
            request += ":\(answer)"
        }
        
        socket.writeData((request+"\n").dataUsingEncoding(NSUTF8StringEncoding), withTimeout: 1, tag: 0)
    }
    
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16)
    {
     
    }
    
    func socket(sock: GCDAsyncSocket!, shouldTimeoutWriteWithTag tag: Int, elapsed: NSTimeInterval, bytesDone length: UInt) -> NSTimeInterval
    {
        return 0
    }
}
