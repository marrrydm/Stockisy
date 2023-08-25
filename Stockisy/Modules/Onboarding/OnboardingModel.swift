import UIKit

struct OnboardingModel {
    var title: String
    var content: String
    var comment1: String?
    var comment2: String?
    var name1: String?
    var name2: String?
    var images: [UIImage?]
}

struct OnboardingViewModel {
    var items: [OnboardingModel]?
    
    init() {
        items = [
        OnboardingModel(title: "title.onboarding1".localize(), content: "content.onboaring1".localize(), images: [UIImage(named: "onboarding1")]),
        OnboardingModel(title: "title.onboarding2".localize(), content: "content.onboaring2".localize(), comment1: "comment1".localize(), comment2: "comment2".localize(), name1: "name1".localize(), name2: "name2".localize(), images: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "stars")]),
        OnboardingModel(title: "title.onboarding3".localize(), content: "content.onboaring3".localize(), images: [UIImage(named: "onboarding3")])
        ]
    }
}
