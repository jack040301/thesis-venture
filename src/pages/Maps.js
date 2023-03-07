import React, { useState, useEffect } from "react";
import customMarker from '../Assets/x.png';
import { GoogleMap, LoadScript, Marker } from "@react-google-maps/api";
import { db, addDoc, collection, GeoPoint, updateDoc, deleteDoc, doc, getDocs, query,onSnapshot, getMarkers } from "../firebase";

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
  const [basicModal2, setBasicModal2] = useState(false);

  const api = process.env.REACT_APP_GOOGLE_MAPS_API_KEY; //insert the api key of the google map
  const [coorlat, setCoorlat] = useState('');
  const [coorlong, setCoorlong] = useState('');
  const [coorname, setCoorname] = useState('');
  const [coorland, setCoorLand] = useState('');
  const [coorlandSize, setCoorlandSize] = useState('');
  const [coorPopulation, setCoorPopulation] = useState('');
  const [coorRevenue, setCoorRevenue] = useState('');
  const [coorID, setCoorID] = useState('');
  let markers = [ ]


  const [data, setData] = useState(markers);


  

  function resetAllFilters() {
    setCoorPopulation("");
    setCoorlandSize("");
    setCoorLand("");
    setCoorRevenue("");
  }

  const handleMapClick = (e,name) => {
    resetAllFilters();

    setCoorlat(e.latLng.lat())
    setCoorlong(e.latLng.lng())
    setCoorID(name);



    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${e.latLng.lat()},${e.latLng.lng()}&key=${api}`;
    fetch(url)
      .then(response => response.json())
      .then(data => {
       // console.log(data);
        let parts = data.results[0].address_components;

        setCoorname(data.results[0].formatted_address)

      })
      .catch(err => console.warn(err.message));

    return setBasicModal(!basicModal); //triggering the modal
  };


  const handleMapClick2 = (e) => {

    resetAllFilters();

    setCoorlat(e.latLng.lat())
    setCoorlong(e.latLng.lng())



    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${e.latLng.lat()},${e.latLng.lng()}&key=${api}`;
    fetch(url)
      .then(response => response.json())
      .then(data => {
       // console.log(data);
        let parts = data.results[0].address_components;

        setCoorname(data.results[0].formatted_address)

      })
      .catch(err => console.warn(err.message));

    return setBasicModal2(!basicModal2); //triggering the modal
  };

  const containerStyle = {
    width: "1550px",
    height: "500px",
  };


  const addMarkers = async (e) => {


    try {
      const docRef = await addDoc(collection(db, "testmarkers"), {
        coords: new GeoPoint(coorlat, coorlong),
        place: coorname,
        land: coorland,
        landsize: coorlandSize,
        population: coorPopulation,
        revenue: coorPopulation,

      });
     alert("Successful Adding Marker")

      //success
    } catch (e) {
      //error
      alert("Error adding Marker : " , e)


      console.error("Error adding document: ", e);
    }
  }

  const updateMarkers = async (e) => {
    const docRef = doc(db, 'testmarkers', coorID);

    try {
      const updateMarker = await updateDoc(docRef, {
        coords: new GeoPoint(coorlat, coorlong),
        place: coorname,
        land: coorland,
        landsize: coorlandSize,
        population: coorPopulation,
        revenue: coorPopulation,
      });

        alert("Successful update Marker")
      //success
    } catch (e) {
      //error
      alert("Error updating marker : " , e)

    }
  }

  const deleteMarkers = async (e) => {

    try {

      const delMark = await deleteDoc(doc(db, "testmarkers", coorID));
      //success

      alert("Successful delete Marker")

    } catch (e) {
      //error
      alert("Error deleting marker : " , e)

    }
  }

   
  
 




  const fetchPost = async () => {
       
    await getDocs(collection(db, "testmarkers"))
        .then((querySnapshot)=>{               
            const newData = querySnapshot.docs
                .map((doc) => ({...doc.data(), id:doc.id}));
              const newxx = querySnapshot.docs.map((doc)=>
              ({ lat : doc.data().coords._lat, lng: doc.data().coords._long, name:doc.id}));

            setData(newxx);

        })

       
        return () => fetchPost();

  }

  function createKey(marker) {
   return marker.lat + marker.lng

  }
   

  useEffect(()=>{
    const collect = collection(db,"testmarkers")
    const unsub = onSnapshot(collect, snapshot =>{

      const markreal = snapshot.docs.map(doc=> ({ lat : doc.data().coords._lat, lng: doc.data().coords._long, name:doc.id}
      ))
    //  console.log(markreal)

     setData(markreal)

    })

    return () =>{
        unsub()
    }
  },[]) 

  return (
    <>
      <div className="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header">
                <h3 className="card-title">Map Markers</h3>
                <div className="card-tools">
           
                </div>
              </div>
              <div className="card-body table-responsive p-0">
                <LoadScript googleMapsApiKey={api}>
                  <GoogleMap
                    class="map"
                    onClick={(e) => handleMapClick2(e)}
                    mapContainerStyle={containerStyle}
                    center={center}
                    zoom={14.4746}
                    onLoad={fetchPost}

                  >
                    
               { 
              data.map( (mark) => (
                                        
                       <Marker options={{icon:customMarker}}    onClick={(e) => handleMapClick(e,mark.name)}
                        key={createKey(mark)} position={mark} />
                    ))}   

                    <></>
                  </GoogleMap>
                </LoadScript>
              </div>
            </div>
          </div>
        </div>
      </div>


        <MDBModal show={basicModal2} setShow={setBasicModal2} tabIndex="-1">
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
                value={coorland} onChange={(e) => setCoorLand(e.target.value)}

                required
              />
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Land size"
                id="formControlLg"
                type="text"
                value={coorlandSize} onChange={(e) => setCoorlandSize(e.target.value)}

                required
              />
       
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Total Population "
                id="formControlLg"
                type="text"
                value={coorPopulation} onChange={(e) => setCoorPopulation(e.target.value)}

                required
              />
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Revenue"
                id="formControlLg"
                type="text"
                value={coorRevenue} onChange={(e) => setCoorRevenue(e.target.value)}
                required

              />

            </MDBModalBody>

            <MDBModalFooter>
              <MDBBtn onClick={addMarkers}  color="success">Add Place</MDBBtn>
            </MDBModalFooter>
          </MDBModalContent>
        </MDBModalDialog>
      </MDBModal>
    

      <MDBModal show={basicModal} setShow={setBasicModal} tabIndex="-1">
        <MDBModalDialog>
          <MDBModalContent>
            <MDBModalHeader>
              <MDBModalTitle>Existing Markers Business</MDBModalTitle>
            </MDBModalHeader>
            <MDBModalBody>
            <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Coordinates Latitude"
                id="formControlLg"
                type="text"
                value={coorID} onChange={(e) => setCoorID(e.target.value)}
                hidden
                required
              />

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
                value={coorland} onChange={(e) => setCoorLand(e.target.value)}

                required
              />
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Land size"
                id="formControlLg"
                type="text"
                value={coorlandSize} onChange={(e) => setCoorlandSize(e.target.value)}

                required
              />
             
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Total Population "
                id="formControlLg"
                type="text"
                value={coorPopulation} onChange={(e) => setCoorPopulation(e.target.value)}

                required
              />
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Revenue"
                id="formControlLg"
                type="text"
                value={coorRevenue} onChange={(e) => setCoorRevenue(e.target.value)}
                required

              />

            </MDBModalBody>

            <MDBModalFooter>
              <MDBBtn onClick={updateMarkers}  color="warning">Update Place</MDBBtn>
              <MDBBtn onClick={deleteMarkers} color="danger">Delete Place</MDBBtn>
            </MDBModalFooter>
          </MDBModalContent>
        </MDBModalDialog>
      </MDBModal>
    </>
  );
}

export default MapPage;

