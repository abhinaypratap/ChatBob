//
//  MessageCell.swift
//  ChatBob
//
//  Created by Abhinay Pratap on 08/07/22.
//

import UIKit

class MessageCell: UITableViewCell {
  
  @IBOutlet weak var messageBubble: UIView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var rightImageView: UIImageView!
  @IBOutlet weak var leftImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
