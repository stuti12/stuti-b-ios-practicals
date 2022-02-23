
import UIKit

class MainPageViewController: UIPageViewController {
    lazy var orderViewController : [UIViewController] = [viewControllerWith(name: "UIWidgetViewController"),viewControllerWith(name: "SignInTableViewController")]
    var isLoading : Bool = false
    var curIndex : Int = 0
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(!isLoading) {
            isLoading = true
            setUpController()
        }
    }
    
    //MARK: Extra Functions
    func viewControllerWith(name : String) -> UIViewController {
        return UIStoryboard(name: "UIWidget", bundle:  nil).instantiateViewController(withIdentifier: name)
    }
    func setUpController() {
        curIndex = 0
        let firstViewControllder = orderViewController[curIndex]
        setViewControllers([firstViewControllder], direction: .forward, animated: false, completion: nil)
    }
}

//MARK: Extentions for tableview Delegate
extension MainPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderViewController.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard orderViewController.count > previousIndex else {
            return nil
        }
        return orderViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderViewController.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderViewControllerCount = orderViewController.count
        
        guard orderViewControllerCount != nextIndex else {
            return nil
        }
        guard orderViewControllerCount > nextIndex else {
            return nil
        }
        return orderViewController[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let firstController = viewControllers?.first, let index = orderViewController.firstIndex(of: firstController) {
            print(index)
        }
    }
    
}
