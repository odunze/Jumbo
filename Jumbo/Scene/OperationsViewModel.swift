//
//  OperationsViewModel.swift
//  Jumbo
//
//  Created by Lotanna Igwe-Odunze on 1/31/20.
//  Copyright © 2020 Lotanna Odunze. All rights reserved.
//

import Foundation
import WebKit

class OperationsViewModel {
    
    //Stores all operations.
    var operations: [Operation] = []
    
    //Creates a random ID.
    func randomise() -> String {
        let alphanumeric = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomised = (0 ..< 26).compactMap{_ in alphanumeric.randomElement()}
        let randomString = String(randomised)
        return randomString
    }
    
    //Creates an HTML file to load the web view.
    func createHTMLFile() -> URL? {
        let jsLink = "https://jumboassetsv1.blob.core.windows.net/publicfiles/interview_bundle.js"
        
        let html = "<html><head><script src=\"\(jsLink)\"></script></head><body></body></html>"
        
        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let file = docDir.appendingPathComponent("js.html")
        
        try! html.write(to: file, atomically: true, encoding: String.Encoding.utf8)
        
        let htmlLink = URL(string: "\(docDir)js.html")
        
        return htmlLink
    }
    
    //Processes the Javascript message into Operation data.
    func receiveMessage(message: WKScriptMessage, completion: @escaping (Status) -> () ) {
        
        //Converts the Message to a String
        let messageBody = message.body as! String
        
        //Converts the message string to data.
        guard let messageData = messageBody.data(using: .utf8) else {
            print("Couldn't create data from message body string.")
            return
        }
        
        do {
            //Converts the data.
            if let operationDetails = try JSONSerialization.jsonObject(with: messageData, options: .mutableContainers) as? [String : Any] {
                
                let id = operationDetails["id"] as! String
                let message = operationDetails["message"] as! String
                let progress = operationDetails["progress"] as? Int
                let state = operationDetails["state"] as? String
                
                //Creates a new operation from the message data
                let operation = Operation(id: id, message: message, progress: progress, state: state)
                
                //Checks if an Operation with the same ID already exists.
                if let index = operations.firstIndex(where: {$0.id == operation.id}) {
                    
                    //If it exists updates the operation found.
                    operations[index] = operation
                    completion(.success)
                    
                } else {
                    //Appends the new operation to the array.
                    operations.append(operation)
                    completion(.success)
                }
            }
            
        } catch { //Handling errors.
            completion(.failure)
            print(error)
        }
    }
    
    //Jumbo Logo Image
    lazy var logo: UIImageView = {
        let view = UIImageView(frame: .zero)
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "jumbo-logo")
        return view
    }()
}
