import React, {useState} from "react";

import {
  useJsApiLoader,
  GoogleMap,
  Marker,LoadScript ,

  DirectionsRenderer,
} from '@react-google-maps/api'


function MapPage() {
  const center = { lat: 14.774477, lng:121.04483 }

const api = process.env.REACT_APP_GOOGLE_MAPS_API_KEY;


  const [map, setMap] = React.useState(null)

  

  const containerStyle = {
    width: '1550px',
    height: '500px'
  };
  

  

  return (
    <>
      <div class="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header">
                <h3 className="card-title">Rentals</h3>
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
              <LoadScript
      googleMapsApiKey={api}
    >
      <GoogleMap
        mapContainerStyle={containerStyle}
        center={center}
        zoom={10}
      >
        { /* Child components, such as markers, info windows, etc. */ }
        <></>
      </GoogleMap>
    </LoadScript>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default MapPage;
