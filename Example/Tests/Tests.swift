// https://github.com/Quick/Quick

import Quick
import Nimble
import MRArticleViewController

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("ArticleViewController", {
            
            let articleVC = ArticleViewController()
            
            describe("image") {
                context("before setting") {
                    it("is nil") {
                        expect(articleVC.image) == nil
                    }
                }
                context("after setting") {
                    articleVC.image = UIImage()
                    it("is not nil") {
                        expect(articleVC.image) != nil
                    }
                }
            }
            
        })
        
        describe("these will pass") {

            it("can do maths") {
                expect(24) == 23
            }

            it("can read") {
                expect("🐮") == "🐮"
            }

            it("will eventually pass") {
                var time = "passing"

                dispatch_async(dispatch_get_main_queue()) {
                    time = "done"
                }

                waitUntil { done in
                    NSThread.sleepForTimeInterval(0.5)
                    expect(time) == "done"

                    done()
                }
            }
        }
    }
}
