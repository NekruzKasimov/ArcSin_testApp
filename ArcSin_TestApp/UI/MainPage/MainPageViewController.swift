//
//  ViewController.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/18/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import UIKit
import RxSwift
import SwinjectStoryboard

class MainPageViewController: UIViewController {
    
    var users = [User]()
    
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel: MainPageViewModel?
    var disposable = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreTableView()
        _ = viewModel?.events.subscribe { event in
            switch event.element {
            case .USER(let users)?:
                self.users = users
                self.tableView.reloadData()
            case .ERROR(let error)?:
                self.tableView.reloadData()
                self.showError(error)
            default: break
            }
            }.disposed(by: disposable)
    }
    
    func showError(_ error: CommonError) {
        let alert = UIAlertController(title: "Ошибка", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func configreTableView() {
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = UITableView.automaticDimension
        setSearchController()
    }
    
    func setSearchController() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search user"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }

}

extension MainPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        self.viewModel?.saveUser(user)
        let vc = DetailedPageViewController()
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MainPageViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel?.searchUser(name: searchBar.text ?? "")
    }
}
