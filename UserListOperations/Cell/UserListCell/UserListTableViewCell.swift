//
//  UserListTableViewCell.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
    var data: Users? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Methods
    
    private func updateUI() {
        guard let data = data else { return }
        DispatchQueue.main.async { [weak self] in
            self?.nameLabel.text = data.name
            self?.emailLabel.text = data.email
        }
    }
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

