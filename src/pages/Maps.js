import React, { useState } from "react";

import { GoogleMap, LoadScript } from "@react-google-maps/api";

import {
  MDBModal,
  MDBModalDialog,
  MDBModalContent,
  MDBModalHeader,
  MDBBtn,
  MDBModalTitle,
  MDBModalBody,
  MDBInput,
  MDBModalFooter,
} from "mdb-react-ui-kit";

function MapPage() {
  const center = { lat: 14.774477, lng: 121.04483 };
  const [basicModal, setBasicModal] = useState(false);
  const api = process.env.REACT_APP_GOOGLE_MAPS_API_KEY; //insert the api key of the google map
  const [coorlat, setCoorlat] = useState('');
  const [coorlong, setCoorlong] = useState('');
  const [coorname, setCoorname] = useState('');



  const handleMapClick = (e) => {
    // when admin click on the map
    //alert("click on the map")

  
    setCoorlat(e.latLng.lat())
    setCoorlong(e.latLng.lng())
    

    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${e.latLng.lat()},${e.latLng.lng()}&key=${api}`;
    fetch(url)
    .then(response => response.json())
    .then(data => {
      console.log(data);
      let parts = data.results[0].address_components;
     
      setCoorname(data.results[0].formatted_address)
    
    })
    .catch(err => console.warn(err.message));
    
    return setBasicModal(!basicModal); //triggering the modal
  };

  const containerStyle = {
    width: "1550px",
    height: "500px",
  };

  return (
    <>
      <div class="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header">
                <h3 className="card-title">Map Markers</h3>
                <div className="card-tools">
                  <div
                    className="input-group input-group-sm"
                    style={{ width: 300 }}
                  >
                    <input
                      type="text"
                      name="table_search"
                      className="form-control float-right"
                      placeholder="Search"
                    />
                    <div className="input-group-append">
                      <button type="submit" className="btn btn-default">
                        <i className="fas fa-search" />
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div className="card-body table-responsive p-0">
                <LoadScript googleMapsApiKey={api}>
                  <GoogleMap
                    class="map"
                    onClick={(e) => handleMapClick(e)}
                    //trigger the function
                    mapContainerStyle={containerStyle}
                    center={center}
                    zoom={10}
            
                
                  >
                    <></>
                  </GoogleMap>
                </LoadScript>
              </div>
            </div>
          </div>
        </div>
      </div>

      <MDBModal show={basicModal} setShow={setBasicModal} tabIndex="-1">
        <MDBModalDialog>
          <MDBModalContent>
            <MDBModalHeader>
              <MDBModalTitle>Adding Markers Business</MDBModalTitle>
            </MDBModalHeader>
            <MDBModalBody>

            <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Coordinates Latitude"
                id="formControlLg"
                type="text"
                value={coorlat} onChange={(e) => setCoorlat(e.target.value)}
             
                required
              />
                <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Coordinates Longtitude"
                id="formControlLg"
                type="text"
                value={coorlong} onChange={(e) => setCoorlong(e.target.value)}
             
                required
              />
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Place"
                id="formControlLg"
                type="text"
                value={coorname} onChange={(e) => setCoorname(e.target.value)}
              
              required
              />
                      <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Land"
                id="formControlLg"
                type="text"
               
              required
              />
                         <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Land size"
                id="formControlLg"
                type="text"
               
              required
              />
        {/*           <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Population Future"
                id="formControlLg"
                type="text"
               
              required
              />
                  <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Population Present"
                id="formControlLg"
                type="text"
               
              required
              />
                  <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Population Past"
                id="formControlLg"
                type="text"
               
              required
              /> */}
                      <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Total Population "
                id="formControlLg"
                type="text"
               
              required
              />
                   <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Revenue"
                id="formControlLg"
                type="text"
               
              required
              />

            </MDBModalBody>

            <MDBModalFooter>
              <MDBBtn>Add Place</MDBBtn>
            </MDBModalFooter>
          </MDBModalContent>
        </MDBModalDialog>
      </MDBModal>
    </>
  );
}

export default MapPage;
