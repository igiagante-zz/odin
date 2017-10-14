//
//  UsersViewController.swift
//  odin
//
//  Created by Ignacio Giagante on 5/10/17.
//  Copyright © 2017 Peryisa. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class UsersViewController : UIViewController {
  
  private let disposeBag = DisposeBag()
  var viewModel: UsersViewModel!
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    bindViewModel()
  }
  
  private func configureTableView() {
    tableView.refreshControl = UIRefreshControl()
    tableView.estimatedRowHeight = 64
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  private func bindViewModel() {
    
    assert(viewModel != nil)
    
    let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
      .mapToVoid()
      .asDriverOnErrorJustComplete()
    
    let pull = tableView.refreshControl!.rx
      .controlEvent(.valueChanged)
      .asDriver()
    
    let input = UsersViewModel.Input(trigger: Driver.merge(viewWillAppear, pull))
    
    let output = viewModel.transform(input: input)
    
    //Bind Users to UITableView
    output.users.drive(tableView.rx.items(cellIdentifier: UserTableViewCell.reuseID, cellType: UserTableViewCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
      
      }.addDisposableTo(disposeBag)
    
    //Connect Create Post to UI
    
    output.fetching
      .drive(tableView.refreshControl!.rx.isRefreshing)
      .disposed(by: disposeBag)
  }
  
}
