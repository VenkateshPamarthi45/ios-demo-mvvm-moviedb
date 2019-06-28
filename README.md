# ios-demo-mvvm-moviedb

This repo is demo of implementing mvvm architecture in IOS. This project is simple demo for listing movies fetching
from remote server.

<b>Dependiences:</b>
<li>Alamofire: 4.8.2</li>
<li>RxSwift : 5</li>
<li>RxCocoa : 5</li>
<li>Swinnjet</li><br>
  
  <b>Alamofire:</b>
  <p>This is used to make api network calls from remote server.</p>
  
<b>RxSwift:</b>
<p>This is used to make reactive interaction between view, viewmodel and repository using Observables</p><br>

<b>Swinnjet:</b>
<p>This is used to create dependiences at assembly</p><br>

<b>MovieListingViewController</b>
  <p>This view controller has collection view with two columns for showing movie listing. This class request view model for movies. The only interaction from view controller is view model and when item is clicked from collection view it is redirected to detail view controller</p>
  
  <b>MovieListingViewModel</b>
  <p>This class is bridge between view and repository. It takes user requests and passing it to repository(data layer)</p><br>
  
<b>MovieListingRepository</b>
  <p>This class is communicates with local cache data(core data) and with API layer and fetches data to view layer</p>
  
  <p>By following this approach(protocals) I am able to write unit testing for individual layers/classes.
