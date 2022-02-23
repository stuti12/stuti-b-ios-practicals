
import UIKit
import WebKit
class WebViewController: UIViewController {
    
    //MARK: IBOutlet
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        load()
    }
    
    //MARK: IBAction
}
extension WebViewController: WKNavigationDelegate {
    func load() {
        let url = URL (string: "https://www.google.com")
        let requestObj = URLRequest(url: url!)
        self.webView.load(requestObj)
        activityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
