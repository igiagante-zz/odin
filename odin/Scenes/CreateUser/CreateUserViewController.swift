//
//  CreateUserViewController.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class CreateUserViewController: UIViewController {
  
  private let disposeBag = DisposeBag()

  var viewModel: CreateUserViewModel!
  
  @IBOutlet weak var usernameTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var registerButton: UIButton!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let input = CreateUserViewModel.Input(registerUserTrigger: registerButton.rx.tap.asDriver(),
                                          username: usernameTextField.rx.text.orEmpty.asDriver(),
                                          password: passwordTextField.rx.text.orEmpty.asDriver())
    
    let output = viewModel.transform(input: input)
    
    output.showDialog.drive().addDisposableTo(disposeBag)
    
    output.saveEnabled.drive(registerButton.rx.isEnabled)
      .addDisposableTo(disposeBag)

  }
}
