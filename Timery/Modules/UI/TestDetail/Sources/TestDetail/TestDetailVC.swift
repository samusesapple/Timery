import UIKit
import UIFusionKit

public final class TestDetailVC: UIViewController {
    
    private let reactor: TestDetailReactor

    private var testLabel: UILabel!
    private var finishButton: UIButton!
    
    public init(reactor: TestDetailReactor) {
        self.reactor = reactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        buildComponents()
        configureUI()
    }
    
    private func buildComponents() {
        testLabel = UILabel().then {
            $0.text = "Detail VC"
        }
        
        finishButton = UIButton().then {
            $0.setTitle("VC 종료", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
        
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        [testLabel, finishButton].forEach(view.addSubview)
        
        testLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        finishButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(testLabel.snp.bottom).inset(-12)
        }
    }
    
    @objc private func finishButtonTapped() {
        reactor.finish()
    }
    
}

#if DEBUG
struct MockTestDetailFlowCoordinator: TestDetailFlowCoordinatorProtocol {
    func start() {}
    func finish() {}
}

#Preview {
    TestDetailVC(reactor: .init(coordinator: MockTestDetailFlowCoordinator()))
}

#endif
