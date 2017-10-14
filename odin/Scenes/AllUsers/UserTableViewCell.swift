//
//  UserTableViewCell.swift
//  odin
//
//  Created by Ignacio Giagante on 12/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import UIKit


final class UserTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var passwordLabel: UILabel!
  @IBOutlet weak var usernameLabel: UILabel!
  
  func bind(_ viewModel: UserItemViewModel ) {
    
    self.usernameLabel.text = viewModel.title
    self.passwordLabel.text = viewModel.subtitle
  }
  
}
