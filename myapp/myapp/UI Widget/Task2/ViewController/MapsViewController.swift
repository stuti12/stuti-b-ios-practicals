
import UIKit
import MapKit
class MapsViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var mapView: MKMapView!
    var locationmanager = CLLocationManager()
    var initLocation = CLLocation(latitude: 23.08368496286138, longitude:   72.58057333076279)
    
    var location = LocationModel.getLocations()
    let annotation = MKPointAnnotation()
    
    //MARK: -Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuth()
        mapView.delegate = self
    }
    
    //MARK: Functions for Authenticate location
    func checkLocationAuth() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            locationmanager.requestAlwaysAuthorization()
            mapView.showsUserLocation = true
            break
        default:
            break
        }
        locationmanager.delegate = self
        locationmanager.startUpdatingHeading()
    }
    
    func addCustomAnnotation(longitude: Double,latitude: Double) {
        let customA = customAnnotation()
        customA.title = "Simform"
        let coordinate = CLLocationCoordinate2D(latitude: longitude, longitude: latitude)
        customA.coordinate = coordinate
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(customA)
    }
    //MARK: -IBAction
}

//MARK: -Extentions for MAPView, CLLocation, UIPickerview Delegates
extension MapsViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "XcustomAnnotation"
        if annotation is customAnnotation {
            var aView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
            if aView == nil {
                aView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                aView!.canShowCallout = true
                aView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                
            } else {
                aView?.annotation = annotation
            }
            
            return aView
        } else {
            return nil
        }
    }
}

extension MapsViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}

extension MapsViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return location.count
    }
}

extension MapsViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return location[row].title
    }
    func addAnnotation(longitude : Double, latitude: Double) {
        mapView.removeAnnotation(annotation)
        let coordinate = CLLocationCoordinate2D(latitude: longitude, longitude: latitude)
        
        annotation.title = "Annotation"
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
        mapView.setRegion(region, animated: true)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pos : String = location[row].title
        switch pos {
        case "New Delhi":
            addAnnotation(longitude: 28.632780332334686,latitude: 77.19415505318165)
            break
        case "Ahmedabad":
            addAnnotation(longitude: 23.08368496286138,latitude: 72.58057333076279)
            break
        case "Goa":
            addAnnotation(longitude: 15.47434396393431, latitude: 74.00783974265859)
            break
        case "Shimla":
            addAnnotation(longitude: 31.194735457417313,latitude:77.23420689469604)
            break
            
        default:
            print("No Dest")
        }
        
    }
    class customAnnotation : MKPointAnnotation {
        var imageName: UIImage? = UIImage(named: "apple-black-logo")
    }
}
