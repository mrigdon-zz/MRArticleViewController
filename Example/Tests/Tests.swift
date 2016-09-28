// https://github.com/Quick/Quick

import Quick
import Nimble
@testable import MRArticleViewController

class ArticleViewControllerSpec: QuickSpec {
    override func spec() {
        
        let vc = ArticleViewController()
        
        describe("setImage") {
            vc.image = UIImage()
            it("should set the image of the imageView") {
                expect(vc.image).toNot(equal(nil))
            }
        }
        
        vc.image = nil
        
        describe("getImage") {
            context("when nil") {
                it("should return nil") {
                    expect(vc.image).to(beNil())
                }
            }
        }
        
    }
}
