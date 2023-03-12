import React, { useState,useRef, useEffect } from "react";
import customMarker from '../Assets/x.png';
import { GoogleMap, LoadScript, Marker } from "@react-google-maps/api";
import { db, addDoc, collection, GeoPoint, updateDoc, deleteDoc, doc, getDocs, query,onSnapshot, getMarkers } from "../firebase";
import "./Maps.css"
import {
  MDBModal,
  MDBModalDialog,
  MDBModalContent,
  MDBModalHeader,
  MDBModalTitle,
  MDBModalBody,
  MDBInput,
  MDBModalFooter,
} from "mdb-react-ui-kit";
import ReactToast from "../components/Toast/toast"/* import Component of toast */


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
  const [coorPastpopu, setCoorPastpopu] = useState('');
  const [coorPresentpopu, setCoorPresentpopu] = useState('');


  const [coorID, setCoorID] = useState('');
  let markers = [ ]


  const [data, setData] = useState(markers);


  const toastRef = useRef()
  

  function resetAllFilters() {
    setCoorPopulation("");
    setCoorlandSize("");
    setCoorLand("");
    setCoorRevenue("");
    setCoorPastpopu("");
    setCoorPresentpopu("");
    setCoorPopulation("");
  }

  const handleMapClick = (e,name,land,land_size,popu_past,popu_present,population,revenue) => {

    
    resetAllFilters();

    setCoorlat(e.latLng.lat())
    setCoorlong(e.latLng.lng())
    setCoorID(name);
    setCoorLand(land);
    setCoorlandSize(land_size);
    setCoorPastpopu(popu_past);
    setCoorPresentpopu(popu_present);
    setCoorPopulation(population);
    setCoorRevenue(revenue);




    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${e.latLng.lat()},${e.latLng.lng()}&key=${api}`;
    fetch(url)
      .then(response => response.json())
      .then(data => {
       // console.log(data);
        let parts = data.results[0].address_components;

        setCoorname(data.results[0].formatted_address)

      })
      .catch(err => 
        
      toastRef.current.showToast(err.message)
      );

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
      .catch(err => 
      toastRef.current.showToast(err.message)
      );

    return setBasicModal2(!basicModal2); //triggering the modal
  };

  const containerStyle = {
    width: "1650px",
    height: "1000px",
  };


  const addMarkers = async (e) => {


    try {


      
          if(coorlat !== null && coorlat !==""
          && coorlong !== null && coorlong !==""
          && coorname !== null && coorname !==""
          && coorland !== null && coorland !==""
          && coorlandSize !== null && coorlandSize !==""
          && coorPopulation !== null && coorPopulation !==""
          && coorPastpopu !== null && coorPastpopu !==""
          && coorPresentpopu !== null && coorPresentpopu !==""


          ){
   
       
            const future = coorPresentpopu * 0.49;


      const docRef = await addDoc(collection(db, "testmarkers"), {
        coords: new GeoPoint(coorlat, coorlong),
        place: coorname,
        land: coorland,
        popu_present: coorPresentpopu,
        popu_future: future,
        popu_past: coorPastpopu,
        land_size: coorlandSize,
        population: coorPopulation,
        revenue: coorRevenue,

      });
      toastRef.current.showToast("Successful Adding Marker")

     //alert("")
      }
      else {

        toastRef.current.showToast("Please do not leave fields blank")
  
      }


      //alert("Please do not leave fields blank")


      //success
    } catch (e) {
      //error

      toastRef.current.showToast("Error adding Marker : " , e)

      //alert("Error adding Marker : " , e)


  //    console.error("Error adding document: ", e);
    }
  }

  const updateMarkers = async (e) => {
    const docRef = doc(db, 'testmarkers', coorID);

    try {

      if(coorlat !== null && coorlat !==""
      && coorlong !== null && coorlong !==""
      && coorname !== null && coorname !==""
      && coorland !== null && coorland !==""
      && coorlandSize !== null && coorlandSize !==""
      && coorPopulation !== null && coorPopulation !==""
      && coorPastpopu !== null && coorPastpopu !==""
      && coorPresentpopu !== null && coorPresentpopu !==""

      ){

        const future = coorPresentpopu * 0.49;

 /*        console.log(coorname,
          coorland,
          coorPastpopu, coorPresentpopu, 
           coorlandSize,coorPopulation,coorRevenue, 
           + "\n" + future)
 */

       const updateMarker = await updateDoc(docRef, {
        coords: new GeoPoint(coorlat, coorlong),
        place: coorname,
        land: coorland,
        popu_present:coorPresentpopu,
        popu_past: coorPastpopu,
        popu_future:future,
        land_size: coorlandSize,
        population: coorPopulation,
        revenue: coorRevenue,
      });
 
      toastRef.current.showToast("Successful update Marker")

//        alert("Successful update Marker")
        
    } else {

      toastRef.current.showToast("Please do not leave fields blank")

    }

    
    
  //  alert("Please do not leave fields blank")

      //success
    } catch (e) {

      toastRef.current.showToast("Error updating marker : " , e)

      //error
      //alert("Error updating marker : " , e)

    }
  }

  const deleteMarkers = async (e) => {

    try {

      if(coorID !== null && coorID !==""){
      const delMark = await deleteDoc(doc(db, "testmarkers", coorID));
      //success

      //alert("Successful delete Marker")

      toastRef.current.showToast("Successful delete Marker")

    }

    toastRef.current.showToast("Unable to delete Marker")

 //   alert("Unable to delete Marker")

    } catch (e) {
      //error

    toastRef.current.showToast("Error deleting marker : ", e)

     // alert("Error deleting marker : " , e)

    }
  }

   
  
 




  const fetchPost = async () => {
       
    await getDocs(collection(db, "testmarkers"))
        .then((querySnapshot)=>{               
            const newData = querySnapshot.docs
                .map((doc) => ({...doc.data(), id:doc.id}));
              const newxx = querySnapshot.docs.map((doc)=>
              ({ lat : doc.data().coords._lat, lng: doc.data().coords._long,
              name:doc.id,
              land:doc.data().land,
              land_size:doc.data().land_size,
              popu_past:doc.data().popu_past,
              popu_present:doc.data().popu_present,
              population:doc.data().population,
              revenue:doc.data().revenue}));

            setData(newxx);

        })

       
        return () => fetchPost();

  }

  function createKey(marker) {
   return marker.lat + marker.lng

  }

  function setmodalclose2(){

    return setBasicModal2(!basicModal2); //triggering the modal
    
  }
  function setmodalclose(){

    return setBasicModal(!basicModal); //triggering the modal
    
  }
   

  useEffect(()=>{
    const collect = collection(db,"testmarkers")
    const unsub = onSnapshot(collect, snapshot =>{

      const markreal = snapshot.docs.map(doc=> ({ lat : doc.data().coords._lat, lng: doc.data().coords._long, name:doc.id,
        land:doc.data().land,
        land_size:doc.data().land_size,
        popu_past:doc.data().popu_past,
        popu_present:doc.data().popu_present,
        population:doc.data().population,
        revenue:doc.data().revenue}
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
<ReactToast ref={toastRef} timeout={2000} />

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
                                        
                       <Marker options={{icon:customMarker}}    onClick={(e) => handleMapClick(e,mark.name,
                        mark.land,mark.land_size,mark.popu_past,mark.popu_present,
                        mark.popu_present,mark.population,mark.revenue)}
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

        <form>
        <MDBModal show={basicModal2} setShow={setBasicModal2} tabIndex="-1">
        <MDBModalDialog>
          <MDBModalContent>
            <MDBModalHeader>
              <MDBModalTitle>Adding Markers Business</MDBModalTitle>
            </MDBModalHeader>
            <MDBModalBody>
           
            <label className="labelLat">Coordinates Latitude</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Coordinates Latitude"
                id="formControlLg"
                type="text"
                value={coorlat}
                onChange={(e) => setCoorlat(e.target.value)}
                required
                disabled
              />
              <label className="labelLat">Coordinates Longitude</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Coordinates Longtitude"
                id="formControlLg"
                type="text"
                value={coorlong}
                onChange={(e) => setCoorlong(e.target.value)}
                required
                disabled
              />
              <label className="labelLat">Place</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Place"
                id="formControlLg"
                type="text"
                value={coorname}
                onChange={(e) => setCoorname(e.target.value)}
                required
                disabled
              />
              <label className="labelLat">Land</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Land"
                id="formControlLg"
                type="number"
                value={coorland}
                onChange={(e) => setCoorLand(e.target.value)}
                required
              />
              <label className="labelLat">Land Size</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Land size"
                id="formControlLg"
                type="number"
                value={coorlandSize}
                onChange={(e) => setCoorlandSize(e.target.value)}
                required
              />
              <label className="labelLat">Total Population</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Total Population "
                id="formControlLg"
                type="number"
                value={coorPopulation}
                onChange={(e) => setCoorPopulation(e.target.value)}
                required
              />
              <label className="labelLat">Past Population</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Past Population "
                id="formControlLg"
                type="number"
                value={coorPastpopu}
                onChange={(e) => setCoorPastpopu(e.target.value)}
                required
              />
              <label className="labelLat">Present Population</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Present Population "
                id="formControlLg"
                type="number"
                value={coorPresentpopu}
                onChange={(e) => setCoorPresentpopu(e.target.value)}
                required
              />
              <label className="labelLat">Revenue</label>
              <MDBInput
                wrapperClass="w-100"
                placeholder="Revenue"
                id="formControlLg"
                type="number"
                value={coorRevenue}
                onChange={(e) => setCoorRevenue(e.target.value)}
                required
                
              />
              <div className='invalid-feedback'>Please Revenue</div>
            </MDBModalBody>

            <MDBModalFooter>
              <button
                type="button"
                className="btn btn-secondary"
                data-mdb-dismiss="modal"
                onClick={setmodalclose2}
              >
                Close
              </button>
              <button onClick={addMarkers} className="btn btn-primary">
                Add Place
              </button>
            </MDBModalFooter>
          </MDBModalContent>
        </MDBModalDialog>
      </MDBModal>
      </form>

     {/*  <form> */}
      <MDBModal show={basicModal} setShow={setBasicModal} tabIndex="-1">
        <MDBModalDialog className="modal-dialog modal-dialog-centered">
          <MDBModalContent>
            <MDBModalHeader>
              <MDBModalTitle>Existing Markers Business</MDBModalTitle>
            </MDBModalHeader>
            <MDBModalBody>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Coordinates Latitude"
                id="formControlLg"
                type="text"
                value={coorID}
                onChange={(e) => setCoorID(e.target.value)}
                hidden
                required
                disabled
                className="inputLat"
              />
              <label className="labelLat">Coordinates Latitude</label>
              <MDBInput
                wrapperClass="w-100"
                placeholder="Coordinates Latitude"
                id="formControlLg"
                type="text"
                value={coorlat}
                onChange={(e) => setCoorlat(e.target.value)}
                required
                disabled
              />
              <label className="labelLat">Coordinates Longitude</label>
              <MDBInput
                wrapperClass="w-100"
                placeholder="Coordinates Longtitude"
                id="formControlLg"
                type="text"
                value={coorlong}
                onChange={(e) => setCoorlong(e.target.value)}
                required
                disabled
              />
              <label className="labelLat">Place</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Place"
                id="formControlLg"
                type="text"
                value={coorname}
                onChange={(e) => setCoorname(e.target.value)}
                required
                disabled

              />
              <label className="labelLat">Land</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Land"
                id="formControlLg"
                type="number"
                value={coorland}
                onChange={(e) => setCoorLand(e.target.value)}
                required
              />
              <label className="labelLat">Land Size</label>
              <MDBInput
                wrapperClass="w-100"
                placeholder="Land size"
                id="formControlLg"
                type="number"
                value={coorlandSize}
                onChange={(e) => setCoorlandSize(e.target.value)}
                required
              />
              <label className="labelLat">Total Population</label>
              <MDBInput
                wrapperClass="w-100"
                placeholder="Total Population "
                id="formControlLg"
                type="number"
                value={coorPopulation}
                onChange={(e) => setCoorPopulation(e.target.value)}
                required
              />
              <label className="labelLat">Past Population</label>
              <MDBInput
                wrapperClass="w-100"
                placeholder="Past Population "
                id="formControlLg"
                type="number"
                value={coorPastpopu}
                onChange={(e) => setCoorPastpopu(e.target.value)}
                required
              />
            <label className="labelLat">Present Population</label>
            <MDBInput
                wrapperClass=" w-100"
                placeholder="Present Population "
                id="formControlLg"
                type="number"
                value={coorPresentpopu}
                onChange={(e) => setCoorPresentpopu(e.target.value)}
                required
              />
              <label className="labelLat">Revenue</label>
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Revenue"
                id="formControlLg"
                type="number"
                value={coorRevenue}
                onChange={(e) => setCoorRevenue(e.target.value)}
                required
              />
            </MDBModalBody>

            <MDBModalFooter>
            <button
                type="button"
                className="btn btn-secondary"
                data-mdb-dismiss="modal"
                onClick={setmodalclose}
              >
                Close
              </button>
              <button
                onClick={updateMarkers}
                color="warning"
                className="btn btn-primary"
              >
                Update Place
              </button>
              <button
                onClick={deleteMarkers}
                color="danger"
                className="btn btn-danger"
              >
                Delete Place
              </button>
            </MDBModalFooter>
          </MDBModalContent>
        </MDBModalDialog>
      </MDBModal>
   {/*    </form> */}
    </>
  );
}

export default MapPage;
