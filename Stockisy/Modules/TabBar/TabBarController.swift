import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.tabBar.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.196, alpha: 1)
        self.tabBar.tintColor = UIColor(red: 0.102, green: 0.122, blue: 0.196, alpha: 1)
        self.tabBar.barTintColor = UIColor(red: 0.102, green: 0.122, blue: 0.196, alpha: 1)

        let appearance = UITabBarItem.appearance()
        let attributes = [
            NSAttributedString.Key.font:
                UIFont.systemFont(ofSize: 11, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        ]

        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

        let attributesSelected = [
            NSAttributedString.Key.font:
                UIFont.systemFont(ofSize: 11, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.047, green: 0.553, blue: 0.973, alpha: 1)
        ]

        appearance.setTitleTextAttributes(attributesSelected as [NSAttributedString.Key : Any], for: .selected)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let educationController = UINavigationController(rootViewController: EducationController())
        let educationControllerItem = UITabBarItem(title: "tabbar.edu".localize(), image: UIImage(named: "TabBaredu")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabBaredu_selected")?.withRenderingMode(.alwaysOriginal))

        educationController.tabBarItem = educationControllerItem

        let toolsController = ToolsController()
        let toolsControllerItem = UITabBarItem(title: "tabbar.tools".localize(), image: UIImage(named: "TabBartools")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabBartools_selected")?.withRenderingMode(.alwaysOriginal))

        toolsController.tabBarItem = toolsControllerItem

        let settingsController = SettingsController()
        let settingsControllerItem = UITabBarItem(title: "tabbar.settings".localize(), image: UIImage(named: "TabBarsettings")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabBarsettings_selected")?.withRenderingMode(.alwaysOriginal))

        settingsController.tabBarItem = settingsControllerItem

        self.viewControllers = [educationController, toolsController, settingsController]
    }
}
