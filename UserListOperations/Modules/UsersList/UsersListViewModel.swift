//
//  UsersListViewModel.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//
import UIKit

class UsersListViewModel: NSObject {
    
    // MARK: - Properties
    
    var users: [Users] = [] {
        didSet {
            filteredUsers = users
            reloadData()
        }
    }
    
    private(set) var filteredUsers: [Users] = [] {
        didSet {
            reloadData()
        }
    }
    
    var reloadData: () -> Void = {}
    var loadingDelegate: LoadingProtocol?
    var goDetailPage: (IndexPath) -> Void = { _ in }
    
    // MARK: - Methods
    
    func getUsers() {
        loadingDelegate?.showLoading()
        NetworkManager.shared.fetchUsers { [weak self] result in
            self?.loadingDelegate?.hideLoading()
            self?.handleFetchResult(result)
        }
    }
    
    private func handleFetchResult(_ result: Result<[Users], Error>) {
        switch result {
        case .success(let users):
            self.users = users
            print(users)
        case .failure(let error):
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
    
    func filterUsers(with query: String) {
        filteredUsers = query.isEmpty ? users : users.filter {
            $0.name.lowercased().contains(query.lowercased()) ||
            $0.email.lowercased().contains(query.lowercased())
        }
    }
}

// MARK: - TableView DataSource & Delegate

extension UsersListViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        cell.data = filteredUsers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goDetailPage(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}


