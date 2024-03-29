import React, { useState, useRef, useEffect } from "react";
import customMarker from "../Assets/x.png";
import Requestmarker from "../Assets/pinBuildingIcon.png";
import { GoogleMap, LoadScript, Marker } from "@react-google-maps/api";
import {
  db,
  addDoc,
  collection,
  GeoPoint,
  updateDoc,
  deleteDoc,
  doc,
  getDocs,
  query,
  onSnapshot,
  limit,
  getMarkers,
  where,
} from "../firebase";
import "./Maps.css";
import {
  MDBModal,
  MDBModalDialog,
  MDBModalContent,
  MDBModalHeader,
  MDBModalTitle,
  MDBModalBody,
  MDBInput,
  MDBModalFooter,
  MDBBtn,
} from "mdb-react-ui-kit";
import ReactToast from "../components/Toast/toast"; /* import Component of toast */
import { async } from "@firebase/util";
import { CusDropDown, TopFullWidthModal } from "../components/Toast/customDropDownBtn";

function MapPage() {
  const [testData, setTestData] = useState(true);
  const [sampleData, setSampleData] = useState("caloocan");
  const [restricted, setRestriction] = useState(true);

  const center = { lat: 14.774477, lng: 121.04483 };
  const [basicModal, setBasicModal] = useState(false);
  const [basicModal2, setBasicModal2] = useState(false);
  const [enableInput, setEnableInput] = useState(false);
  const [requestModal, setRequestModal] = useState(false);
  const [pinLimitModal, setPinLimitModal] = useState(false);
  const [pinLimitModal2, setPinLimitModal2] = useState("m-cont-hide");
  const [pinLimitModal2b, setPinLimitModal2b] = useState("m-modal-cont-hide");

  const api = process.env.REACT_APP_GOOGLE_MAPS_API_KEY; //insert the api key of the google map
  const [coorlat, setCoorlat] = useState("");
  const [coorlong, setCoorlong] = useState("");
  const [coorname, setCoorname] = useState("");
  const [coorland, setCoorLand] = useState("");
  const [coorlandSize, setCoorlandSize] = useState("");
  const [coorPopulation, setCoorPopulation] = useState("");
  const [coorRevenue, setCoorRevenue] = useState("");
  const [coorPastpopu, setCoorPastpopu] = useState("");
  const [coorPresentpopu, setCoorPresentpopu] = useState("");

  const [coorID, setCoorID] = useState("");
  let markers = [];
  let request_markers = [];
  let restrictedLoc = [];

  const [data, setData] = useState(markers);
  const [datarequest, setDataRequest] = useState(request_markers);
  const [retrict, setRestrictedCol] = useState(restrictedLoc);

  const [requestApprove, setRequestApprove] = useState({
    id: "",
    lat: "",
    long: "",
    place: "",
    land: "",
    land_size: "",
    popu_past: "",
    popu_present: "",
    population: "",
    revenue: "",
  });

  const [reqAp_id, setReqApID] = useState("");
  const [reqAp_lat, setReqApLat] = useState("");
  const [reqAp_long, setReqApLong] = useState("");
  const [reqAp_place, setReqApPlace] = useState("");
  const [reqAp_land, setReqApLand] = useState("");
  const [reqAp_land_size, setReqApLandSize] = useState("");
  const [reqAp_popu_past, setReqApPopuPast] = useState("");
  const [reqAp_popu_prepsent, setReqApPopuPresent] = useState("");
  const [reqAp_population, setReqApPopulation] = useState("");
  const [reqAp_revenue, setReqApRevenue] = useState("");

  const [pinLimit, setPinLimit] = useState(20);
  const [appDocId, setAppDocId] = useState({
    docId: "none",
    geoLoc: "none",
  });
  const [restrictedPLaces, setRestrictedPlaces] = useState({
    coors: {
      lat: "",
      long: "",
    },
  });

  const toastRef = useRef();

  function resetAllFilters() {
    setCoorPopulation("");
    setCoorlandSize("");
    setCoorLand("");
    setCoorRevenue("");
    setCoorPastpopu("");
    setCoorPresentpopu("");
    setCoorPopulation("");
  }

  function resetAddshow() {
    setCoorlat("");
    setCoorlat("");
    setCoorlong("");
    setCoorID("");
    setCoorname("");
  }

  const handleMapClick = (
    e,
    name,
    land,
    land_size,
    popu_past,
    popu_present,
    population,
    revenue
  ) => {
    resetAllFilters();

    setCoorlat(e.latLng.lat());
    setCoorlong(e.latLng.lng());
    setCoorID(name);
    setCoorLand(land);
    setCoorlandSize(land_size);
    setCoorPastpopu(popu_past);
    setCoorPresentpopu(popu_present);
    setCoorPopulation(population);
    setCoorRevenue(revenue);

    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${e.latLng.lat()},${e.latLng.lng()}&key=${api}`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        // console.log(data);
        let parts = data.results[0].address_components;

        setCoorname(data.results[0].formatted_address);
      })
      .catch((err) => toastRef.current.showToast(err.message));

    return setBasicModal(!basicModal); //triggering the modal
  };

  const handleMapClick2 = (e) => {
    resetAllFilters();

    setCoorlat(e.latLng.lat());
    setCoorlong(e.latLng.lng());

    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${e.latLng.lat()},${e.latLng.lng()}&key=${api}`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        // console.log(data);
        let parts = data.results[0].address_components;

        setCoorname(data.results[0].formatted_address);
      })
      .catch((err) => toastRef.current.showToast(err.message));

    return setBasicModal2(!basicModal2); //triggering the modal
  };

  const containerStyle = {
    width: "1650px",
    height: "1000px",
  };

  const checkRestiction = async () => {
    const ReqTrueQuery = query(
      collection(db, "map_pinnedLocation")      
    );
    await getDocs(ReqTrueQuery).then((querySnapshot) => {
      const newData = querySnapshot.docs.map((doc) => ({
        ...doc.data(),
        id: doc.id,
      }));
      const newxx = querySnapshot.docs.map((doc) => ({
        lat: doc.data().address._lat,
        lng: doc.data().address._long,        
      }));

      setRestrictedCol(newxx);
      
      console.log('Retricted locations: ', retrict);
    });
  };


  const addMarkers = async (e) => {
    //checkRestiction();

    try {
      if (
        coorlat !== null &&
        coorlat !== "" &&
        coorlong !== null &&
        coorlong !== "" &&
        coorname !== null &&
        coorname !== "" &&
        coorland !== null &&
        coorland !== "" &&
        coorlandSize !== null &&
        coorlandSize !== "" &&
        coorPopulation !== null &&
        coorPopulation !== "" &&
        coorPastpopu !== null &&
        coorPastpopu !== "" &&
        coorPresentpopu !== null &&
        coorPresentpopu !== ""
      ) {
        const future = coorPresentpopu * 0.49;

        const docRef = await addDoc(collection(db, "markers"), {
          coords: new GeoPoint(coorlat, coorlong),
          place: coorname,
          land: Number(coorland),
          popu_present: coorPresentpopu,
          popu_future: future,
          popu_past: coorPastpopu,
          land_size: coorlandSize,
          population: coorPopulation,
          revenue: coorRevenue,
          request_status: testData,
        });
        toastRef.current.showToast("Successful Adding Marker");

        //alert("")
      } else {
        toastRef.current.showToast("Please do not leave fields blank");
      }

      //alert("Please do not leave fields blank")

      //success
    } catch (e) {
      //error

      toastRef.current.showToast("Error adding Marker : ", e);      

      //alert("Error adding Marker : " , e)
      console.error("Error adding document: ", e);
      console.log('etst');
    }
  };

  const updateMarkers = async (e) => {
    const docRef = doc(db, "markers", coorID);

    try {
      if (
        coorlat !== null &&
        coorlat !== "" &&
        coorlong !== null &&
        coorlong !== "" &&
        coorname !== null &&
        coorname !== "" &&
        coorland !== null &&
        coorland !== "" &&
        coorlandSize !== null &&
        coorlandSize !== "" &&
        coorPopulation !== null &&
        coorPopulation !== "" &&
        coorPastpopu !== null &&
        coorPastpopu !== "" &&
        coorPresentpopu !== null &&
        coorPresentpopu !== ""
      ) {
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
          land: Number(coorland),
          popu_present: coorPresentpopu,
          popu_past: coorPastpopu,
          popu_future: future,
          land_size: coorlandSize,
          population: coorPopulation,
          revenue: coorRevenue,
        });

        toastRef.current.showToast("Successful update Marker");

        //        alert("Successful update Marker")
      } else {
        toastRef.current.showToast("Please do not leave fields blank");
      }

      //  alert("Please do not leave fields blank")

      //success
    } catch (e) {
      toastRef.current.showToast("Error updating marker : ", e);

      //error
      //alert("Error updating marker : " , e)
    }
  };

  const deleteMarkers = async (e) => {
    try {
      if (coorID !== null && coorID !== "") {
        const delMark = await deleteDoc(doc(db, "markers", coorID));
        //success

        //alert("Successful delete Marker")

        toastRef.current.showToast("Successful delete Marker");
      } else {
        toastRef.current.showToast("Unable to delete Marker");
      }

      //   alert("Unable to delete Marker")
    } catch (e) {
      //error

      toastRef.current.showToast("Error deleting marker : ", e);

      // alert("Error deleting marker : " , e)
    }
  };

  const getRestrictedLoc = async () => {
    
  };

  const fetchPost = async () => {
    const ReqTrueQuery = query(
      collection(db, "markers"),
      where("request_status", "==", true),limit(pinLimit)
    );
    await getDocs(ReqTrueQuery).then((querySnapshot) => {
      const newData = querySnapshot.docs.map((doc) => ({
        ...doc.data(),
        id: doc.id,
      }));
      const newxx = querySnapshot.docs.map((doc) => ({
        lat: doc.data().coords._lat,
        lng: doc.data().coords._long,
        name: doc.id,
        land: doc.data().land,
        land_size: doc.data().land_size,
        popu_past: doc.data().popu_past,
        popu_present: doc.data().popu_present,
        population: doc.data().population,
        revenue: doc.data().revenue,
      }));

      setData(newxx);
      console.log('Request True: ');
      
    });
    

    const ReqFalseQuery = query(
      collection(db, "markers"),
      where("request_status", "==", false),limit(pinLimit)
    );

    await getDocs(ReqFalseQuery).then((querySnapshot) => {
      const datareq = querySnapshot.docs.map((doc) => ({
        ...doc.data(),
        id: doc.id,
      }));
      const reqdata = querySnapshot.docs.map((doc) => ({
        lat: doc.data().coords._lat,
        lng: doc.data().coords._long,
        name: doc.id,
        land: doc.data().land,
        land_size: doc.data().land_size,
        popu_past: doc.data().popu_past,
        popu_present: doc.data().popu_present,
        population: doc.data().population,
        revenue: doc.data().revenue,
      }));

      setDataRequest(reqdata);
    });

    return () => fetchPost();
  };

  function createKey(marker) {
    return marker.lat + marker.lng;
  }

  function setmodalclose2() {
    //for adding markers

    return setBasicModal2(!basicModal2); //triggering the modal
  }
  function setmodalclose() {
    //for exisitng marker
    return setBasicModal(!basicModal); //triggering the modal
  }

  function setAddShowClose() {
    //for custom adding
    return setEnableInput(!enableInput); //triggering the modal
  }

  function setAddshow() {
    resetAddshow();
    resetAllFilters();
    return setEnableInput(!enableInput); //triggering the modal
  }

  //real time in map
  useEffect(() => {
    const collect = collection(db, "markers");

    const approveReq = query(collect, where("request_status", "==", true), limit(1));

    const unsub = onSnapshot(approveReq, (snapshot) => {
      const markreal = snapshot.docs.map((doc) => ({
        lat: doc.data().coords._lat,
        lng: doc.data().coords._long,
        name: doc.id,
        land: doc.data().land,
        land_size: doc.data().land_size,
        popu_past: doc.data().popu_past,
        popu_present: doc.data().popu_present,
        population: doc.data().population,
        revenue: doc.data().revenue,
      }));
      //  console.log(markreal)

      setData(markreal);
    });

    const processReq = query(collect, where("request_status", "==", false));

    const unsubReqProcess = onSnapshot(processReq, (snapshot) => {
      const reqproc = snapshot.docs.map((doc) => ({
        lat: doc.data().coords._lat,
        lng: doc.data().coords._long,
        name: doc.id,
        land: doc.data().land,
        land_size: doc.data().land_size,
        popu_past: doc.data().popu_past,
        popu_present: doc.data().popu_present,
        population: doc.data().population,
        revenue: doc.data().revenue,
      }));
      //  console.log(markreal)

      setDataRequest(reqproc);
    });


    return () => {
      //getDocsIds();
      unsub();
      unsubReqProcess();
    };
  }, []);

  function requestClose() {
    return setRequestModal(!requestModal); //triggering the modal
  }

  const RequestMarkerClick = async (
    e,
    name,
    land,
    land_size,
    popu_past,
    popu_present,
    population,
    revenue
  ) => {
    //let parts = "";
    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${e.latLng.lat()},${e.latLng.lng()}&key=${api}`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        // console.log(data);
        let parts = data.results[0].address_components;

        //setCoorname(data.results[0].formatted_address);
        setReqApPlace(data.results[0].formatted_address);
      })
      .catch((err) => toastRef.current.showToast(err.message));

    setRequestApprove({
      long: e.latLng.lng(),
      lat: e.latLng.lat(),
      id: name,
      land: land,
      land_size: land_size,
      popu_past: popu_past,
      popu_present: popu_present,
      population: population,
      revenue: revenue,
    });

    setReqApLong(e.latLng.lng());
    setReqApLat(e.latLng.lat());
    setReqApID(name);
    setReqApLand(land);
    setReqApLandSize(land_size);
    setReqApPopuPast(popu_past);
    setReqApPopuPresent(popu_present);
    setReqApPopulation(population);
    setReqApRevenue(revenue);

    return setRequestModal(!requestModal); //triggering the modal
  };

  const ApprovedButtonClick = async () => {
    const future = reqAp_popu_prepsent * 0.49;

    try {
      if (
        reqAp_lat !== null &&
        reqAp_lat !== "" &&
        reqAp_long !== null &&
        reqAp_long !== "" &&
        reqAp_place !== null &&
        reqAp_place !== "" &&
        reqAp_land !== null &&
        reqAp_land !== "" &&
        reqAp_land_size !== null &&
        reqAp_land_size !== "" &&
        reqAp_population !== null &&
        reqAp_population !== "" &&
        reqAp_popu_past !== null &&
        reqAp_popu_past !== "" &&
        reqAp_popu_prepsent !== null &&
        reqAp_popu_prepsent !== "" &&
        reqAp_id !== null &&
        reqAp_id !== ""
      ) {
        const docRef = doc(db, "markers", reqAp_id);

        const updateRequest = await updateDoc(docRef, {
          coords: new GeoPoint(reqAp_lat, reqAp_long),
          place: reqAp_place,
          land: Number(reqAp_land),
          popu_present: reqAp_popu_prepsent,
          popu_past: reqAp_popu_past,
          popu_future: future,
          land_size: reqAp_land_size,
          population: reqAp_population,
          revenue: reqAp_revenue,
          request_status: true,
        });

        toastRef.current.showToast("Approved Request ");
      } else {
        toastRef.current.showToast("Do not leave the fields blank ");
      }
    } catch (e) {
      //error
      toastRef.current.showToast("Error Approving Request : ", e);
      console.log(e);

      console.log("Request Approve: ", reqAp_id);
    }
  };

  const getDocsIds = async () => {
    const ReqTrueQuery = query(
      collection(db, "markers"),where("request_status", "==", false)
    );
    await getDocs(ReqTrueQuery).then((querySnapshot) => {
      const newData = querySnapshot.docs.map((doc) => ({        
        docId: doc.id,
      }));
      console.log(newData);
      //setAppDocId({docId: newData[0].docId}); 
      //ApproveAll(newData[0].docId);
      for(let x of newData){
        console.log(x.docId);
        ApproveAll(x.docId);
      }
    });    
  };

  const ApproveAll = async (docId) => {
    const appAll = query(collection(db, "markers"), where("request_status", "==", false));
    const docRef = doc(db, "markers", docId);


    try {
      const updateMarker = await updateDoc(docRef, {
        request_status: true,
        land: "10000",
        land_size: "0.1212",
        popu_past: "20000",
        popu_present: "23000",
        revenue: "123123.2",
      });


      console.log("Success!");
    }catch (e){
      console.log("Approve all funtion:", e);
    }
  };  

  const TestFetch = () => {
    

    return(
      <>
        <button onClick={()=>{fetchPost()}}>Pinned locations on map is limited to {pinLimit}</button>
      </>
    );
  };

  const convertGeoPoints = async () => {
    const ReqTrueQuery = query(

collection(db, "markers"),where("request_status", "==", false)

    );
    await getDocs(ReqTrueQuery).then((querySnapshot) => {
      const newData = querySnapshot.docs.map((doc) => ({        
        docId: doc.id,
        geoLoc: doc.data().coords,
      }));
      console.log(newData);
      //setAppDocId({docId: newData[0].docId}); 
      //ApproveAll(newData[0].docId);
      for(let x of newData){
        //console.log(x.docId);
      }
    });    
  };


  /* const ApproveAll = async (docId) => {
    const appAll = query(collection(db, "markers"), where("request_status", "==", false));
    const docRef = doc(db, "markers", docId);


    try {
      const updateMarker = await updateDoc(docRef, {
        request_status: true,
      });

      console.log("Success!");
    }catch (e){
      console.log("Approve all funtion:", e);
    }
  };   */


  const getStringGeo = async (docId) => {
    const docRef = doc(db, "markers", docId);

    try {
      const updateMarker = await updateDoc(docRef, {
        request_status: true,
      });

      console.log("Success!");
    }catch (e){
      console.log("Geo funtion:", e);
    }
  };

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
                  <CusDropDown btnName={"Pins"}>
                    <button onClick={()=>{setPinLimit(20); fetchPost(); setPinLimitModal2('m-cont'); setPinLimitModal2b('m-modal-cont');}}>20</button>
                    <button onClick={()=>{setPinLimit(100); fetchPost(); setPinLimitModal2('m-cont'); setPinLimitModal2b('m-modal-cont');}}>100</button>
                    <button onClick={()=>{setPinLimit(200); fetchPost(); setPinLimitModal2('m-cont'); setPinLimitModal2b('m-modal-cont');}}>200</button>
                    <button onClick={()=>{setPinLimit(300); fetchPost(); setPinLimitModal2('m-cont'); setPinLimitModal2b('m-modal-cont');}}>300</button>
                  </CusDropDown>
                  <button
                    type="button"
                    className="btn btn-success"
                    data-mdb-dismiss="modal"
                    onClick={setAddshow}
                  >
                    Add New Marker
                  </button>
                </div>
              </div>
              <div className="card-body table-responsive p-0">
                <LoadScript googleMapsApiKey={api}>
                  <GoogleMap
                    class="map"
                    onClick={(e) => {
                      handleMapClick2(e);                                                                  
                    }}
                    mapContainerStyle={containerStyle}
                    center={center}
                    zoom={14.4746}
                    onLoad={()=>{
                      fetchPost();
                      //getDocsIds();
                    }}
                  >
                    {data.map((mark) => (
                      <Marker
                        options={{ icon: customMarker }}
                        onClick={(e) =>
                          handleMapClick(
                            e,
                            mark.name,
                            mark.land,
                            mark.land_size,
                            mark.popu_past,
                            mark.popu_present,
                            mark.popu_present,
                            mark.population,
                            mark.revenue
                          )
                        }
                        key={createKey(mark)}
                        position={mark}
                      />
                    ))}

                    {datarequest.map((reqmark) => (
                      <Marker
                        options={{ icon: Requestmarker }}
                        onClick={(e) =>
                          RequestMarkerClick(
                            e,
                            reqmark.name,
                            reqmark.land,
                            reqmark.land_size,
                            reqmark.popu_past,
                            reqmark.popu_present,
                            reqmark.popu_present,
                            reqmark.population,
                            reqmark.revenue
                          )
                        }
                        key={createKey(reqmark)}
                        position={reqmark}
                        onLoad={(e)=>{
                          console.log('test');
                        }}
                      />
                    ))}

                    <></>
                  </GoogleMap>
                </LoadScript>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Pin limit modal */}
      <TopFullWidthModal title={pinLimit} showcont={pinLimitModal2} showModal={pinLimitModal2b} f={()=>{
                    setPinLimitModal2('m-cont-hide'); 
                    setPinLimitModal2b('m-modal-cont-hide');
                    fetchPost();
                  }}/>      

      {/* Request Modal */}
      <MDBModal show={requestModal} setShow={setRequestModal} tabIndex="-1">
        <MDBModalDialog>
          <MDBModalContent>
            <MDBModalHeader>
              <MDBModalTitle>Approve Request</MDBModalTitle>
            </MDBModalHeader>
            <MDBModalBody>
              Are you sure you want to approve this Request?
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Marker ID"
                id="formControlLg"
                type="text"
                value={reqAp_id}
                onChange={(e) => setReqApID(e.target.value)}
                required
                disabled
                hidden
              />
              <label className="labelLat">Coordinates Latitude</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Coordinates Latitude"
                id="formControlLg"
                type="text"
                value={reqAp_lat}
                onChange={(e) => setReqApLat(e.target.value)}
                required
              />
              <label className="labelLat">Coordinates Longitude</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Coordinates Longtitude"
                id="formControlLg"
                type="text"
                value={reqAp_long}
                onChange={(e) => setReqApLong(e.target.value)}
                required
              />
              <label className="labelLat">Place</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Place"
                id="formControlLg"
                type="text"
                value={reqAp_place}
                onChange={(e) => setReqApPlace(e.target.value)}
                required
              />
              <label className="labelLat">Land</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Land"
                id="formControlLg"
                type="number"
                value={reqAp_land}
                onChange={(e) => setReqApLand(e.target.value)}
                required
              />
              <label className="labelLat">Land Size</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Land size"
                id="formControlLg"
                type="number"
                value={reqAp_land_size}
                onChange={(e) =>
                  setReqApLandSize(e.target.value)
                }
                required
              />
              <label className="labelLat">Total Population</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Total Population "
                id="formControlLg"
                type="number"
                value={reqAp_population}
                onChange={(e) =>
                  setReqApPopulation(e.target.value)
                }
                required
              />
              <label className="labelLat">Past Population</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Past Population "
                id="formControlLg"
                type="number"
                value={reqAp_popu_past}
                onChange={(e) =>
                  setReqApPopuPast(e.target.value)
                }
                required
              />
              <label className="labelLat">Present Population</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Present Population "
                id="formControlLg"
                type="number"
                value={reqAp_popu_prepsent}
                onChange={(e) =>
                  setReqApPopuPresent(e.target.value)
                }
                required
              />
              <label className="labelLat">Revenue</label>
              <MDBInput
                wrapperClass="w-100"
                placeholder="Revenue"
                id="formControlLg"
                type="number"
                value={reqAp_revenue}
                onChange={(e) => setReqApRevenue(e.target.value)}
                required
              />
            </MDBModalBody>

            <MDBModalFooter>
              <button
                color="secondary"
                className="btn btn-secondary"
                onClick={requestClose}
              >
                Cancel
              </button>
              <button className="btn btn-danger" onClick={ApprovedButtonClick}>
                Approve
              </button>
            </MDBModalFooter>
          </MDBModalContent>
        </MDBModalDialog>
      </MDBModal>
      {/* Request Modal */}

      {/*Adding manual markers */}

      <MDBModal show={pinLimitModal} setShow={setPinLimitModal} tabIndex="-1">
        <MDBModalDialog centered >
          <MDBModalContent>
            <MDBModalHeader>
              <MDBModalTitle>Set pinned location limit to {pinLimit}</MDBModalTitle>
            </MDBModalHeader>
            <MDBModalBody >
              <MDBBtn onClick={()=>{fetchPost(); setPinLimitModal(false);}}>Ok</MDBBtn>
            </MDBModalBody>
          </MDBModalContent>
        </MDBModalDialog>
      </MDBModal>

      <MDBModal show={enableInput} setShow={setEnableInput} tabIndex="-1">
        <MDBModalDialog>
          <MDBModalContent>
            <MDBModalHeader>
              <MDBModalTitle>Manual Adding Markers Business</MDBModalTitle>
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
              />
              <label className="labelLat">Place</label>
              <MDBInput
                wrapperClass=" w-100"
                placeholder="Place"
                id="formControlLg"
                type="text"
                value={coorname}
                onChange={(e) => {            
                  setCoorname(e.target.value);
                }}
                required
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
              <div className="invalid-feedback">Please Revenue</div>
            </MDBModalBody>

            <MDBModalFooter>
              <button
                type="button"
                className="btn btn-secondary"
                data-mdb-dismiss="modal"
                onClick={setAddShowClose}
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

      {/*Adding markers in map */}

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
                <div className="invalid-feedback">Please Input Revenue</div>
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

      {/*Updating markers */}

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
