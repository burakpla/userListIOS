//
//  UsersListViewController.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//

import UIKit

class UsersListViewController: UIViewController, LoadingProtocol, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var usersListTableView: UITableView!
    
    private var viewModel = UsersListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Setup Methods
        setupSearchBar()
        setupTableView()
        setupTapGesture()
        setupViewModel()
        self.title = "User List"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: - Fetch Users Data
        viewModel.getUsers()
    }
    
    // MARK: - Setup Methods
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        viewModel.setupTableView(usersListTableView)
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.usersListTableView.reloadData()
            }
        }
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupViewModel() {
        viewModel.loadingDelegate = self
        viewModel.goDetailPage = { [weak self] indexPath in
            self?.goDetail(for: indexPath)
        }
    }
    
    // MARK: - Actions
    
    @objc private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterUsers(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // MARK: - Navigation
    
    private func goDetail(for indexPath: IndexPath) {
        let selectedUser = viewModel.filteredUsers[indexPath.row]
        
        UserDefaults.userName = selectedUser.name
        UserDefaults.userMail = selectedUser.email
        UserDefaults.userPhone = selectedUser.phone
        UserDefaults.userWebsite = selectedUser.website
        
        navigateToUserDetail(with: selectedUser)
    }
    
    private func navigateToUserDetail(with selectedUser: Users) {
        let storyboard = UIStoryboard(name: "Users", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController else { return }
        let detailViewModel = UserDetailViewModel(user: selectedUser)
        detailVC.viewModel = detailViewModel
        navigationController?.pushViewController(detailVC, animated: true)
    }
}





