//
//  SavedTimersVC.swift
//  Timery
//
//  Created by Leo on 6/2/24.
//

import UIKit
import UIFusionKit

final class SavedTimersVC: UIViewController {
    
    let titleLabel = UILabel().then {
        $0.text = "Saved Timers"
        $0.textColor = .lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func configure() {
        view.backgroundColor = .black
        
        [titleLabel].forEach(view.addSubview)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
