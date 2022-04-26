
import UIKit
import WebKit
class WebViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        load()
        }
    }


extension WebViewController: WKNavigationDelegate {
    func load() {
        let url = URL (string: Constants.urls)
        let requestObj = URLRequest(url: url!)
        self.webView.load(requestObj)
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
    
}
