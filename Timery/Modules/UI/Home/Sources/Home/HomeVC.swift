//
//  HomeViewController.swift
//
//
//  Created by Leo on 5/25/24.
//

import UIKit
import UIFusionKit

public final class HomeVC: UITabBarController {
    
    private let viewModel: HomeVM
        
    public init(viewModel: HomeVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setAttribute()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setAttribute() {
        let appearanceTabbar = UITabBarAppearance()
        appearanceTabbar.configureWithOpaqueBackground()
        appearanceTabbar.backgroundColor = UIColor.white
        tabBar.standardAppearance = appearanceTabbar
        tabBar.tintColor = .systemRed
        tabBar.backgroundColor = .darkGray
    }
    
    private func setupTabBar() {
        viewControllers = viewModel.tabBarItems
    }
}

#if DEBUG
#Preview {
    
    HomeVC(viewModel: .init(coordinator: MockHomeFlowCoordinator()))
}


final class MockHomeFlowCoordinator: HomeFlowCoordinatorProtocol {
    func getSavedTimersVC() -> UIViewController {
        UIViewController()
    }
    
    func getTimeEntriesVC() -> UIViewController {
        UIViewController()
    }
    
    func getReportsVC() -> UIViewController {
        UIViewController()
    }
    
    func getSettingsVC() -> UIViewController {
        UIViewController()
    }
    
    func start() {}
    func showTestDetail() {}
}
#endif
