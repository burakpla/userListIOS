//
//  UserDetailViewController.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var inoformationView: UIView!
    
    // MARK: - Properties
    
    var viewModel: UserDetailViewModel?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCustomBackButton()
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        guard let viewModel = viewModel else { return }
        updateLabels(with: viewModel)
        updateNavigationTitle(with: viewModel)
        inoformationView.layer.cornerRadius = 8
    }
    
    private func updateLabels(with viewModel: UserDetailViewModel) {
        nameLabel.text = viewModel.userName
        emailLabel.text = viewModel.userEmail
        phoneLabel.text = viewModel.userPhone
        websiteLabel.text = viewModel.userWebSite
    }
    
    private func updateNavigationTitle(with viewModel: UserDetailViewModel) {
        self.navigationItem.title = viewModel.userName
    }
    
    private func setupCustomBackButton() {
        let backImage = UIImage(systemName: "arrow.backward")
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

