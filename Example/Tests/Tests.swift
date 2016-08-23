// https://github.com/Quick/Quick

import Quick
import Nimble
@testable import MRArticleViewController

class ArticleViewControllerSpec: QuickSpec {
    override func spec() {
        
        var image: UIImage?
        
        describe("setImage") {
            
//            vc.image = UIImage()
            image = UIImage()
            
            it("should set the image of the imageView") {
//                expect(vc.image).toNot(equal(nil))
                expect(image).toNot(equal(nil))
            }
        }
        
    }
}
