//
//  ReportsVC.swift
//  Timery
//
//  Created by Leo on 6/2/24.
//

import UIKit
import UIFusionKit

final class ReportsVC: UIViewController {
    
    let titleLabel = UILabel().then {
        $0.text = "Reports"
        $0.textColor = .lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .black
        
        [titleLabel].forEach(view.addSubview)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
