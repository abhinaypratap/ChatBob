//
//  ChatViewController.swift
//  ChatBob
//
//  Created by Abhinay Pratap on 08/07/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
  
  let db = Firestore.firestore()
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var messageTextField: UITextField!
  
  var messages: [Message] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cell1)
    
    tableView.delegate = self
    tableView.dataSource = self
    navigationItem.hidesBackButton = true
    title = K.appName
    
    loadMessages()
  }
  
  func loadMessages() {
    db.collection(K.FireStore.collectionName)
      .order(by: K.FireStore.dateField)
      .addSnapshotListener { querySnapshot, e in
        self.messages = []
        if let e = e {
          print("Error getting documents: \(e)")
        } else {
          if let snapshotDocuments = querySnapshot?.documents {
            for document in snapshotDocuments {
              let data = document.data()
              if let messageSender = data[K.FireStore.senderField] as? String,
                 let messageBody = data[K.FireStore.bodyField] as? String {
                let newMessage = Message(sender: messageSender, body: messageBody)
                self.messages.append(newMessage)
                
                DispatchQueue.main.async {
                  self.tableView.reloadData()
                  let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                  self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                }
              }
            }
          }
        }
      }
  }
  
  @IBAction func sendPressed(_ sender: UIButton) {
    if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
      db.collection(K.FireStore.collectionName).addDocument(data: [
        K.FireStore.senderField: messageSender,
        K.FireStore.bodyField: messageBody,
        K.FireStore.dateField: Date().timeIntervalSince1970
      ]) { e in
        if let e = e {
          print("There was an issue saving data to firestore, \(e)")
        } else {
          print("Successfully saved data.")
          DispatchQueue.main.async {
            self.messageTextField.text = ""
          }
        }
      }
    }
  }
  
  @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
    do {
      try Auth.auth().signOut()
      navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  }
}

// MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    messages.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let message = messages[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: K.cell1, for: indexPath) as! MessageCell
    cell.label.text = message.body
    
    // Current User
    if message.sender == Auth.auth().currentUser?.email {
      cell.leftImageView.isHidden = true
      cell.rightImageView.isHidden = false
      cell.messageBubble.backgroundColor = UIColor(named: K.currentUserCellColor)
    } else {
      cell.leftImageView.isHidden = false
      cell.rightImageView.isHidden = true
      //            cell.messageBubble.backgroundColor = UIColor(named: K.otherUserCellColor)
    }
    return cell
  }
}


// MARK: - UITableViewDelegate
extension ChatViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
