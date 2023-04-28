import React, {useEffect, useState} from "react";
import {collection, db,onSnapshot, query,where, limit,orderBy, doc, updateDoc,getDoc } from "../firebase";
import {
  MDBModal,
  MDBModalDialog,
  MDBModalContent,
  MDBModalHeader,
  MDBModalTitle,
  MDBModalBody,

  MDBBtn,
} from "mdb-react-ui-kit";

function ManageRequest() {

  const [data, setData] = useState([]);
   const [search,setSearch] = useState([]);
   const [status_modal, setStatusModal] = useState(false);
   const [userStat, setUserStat] = useState("");



  useEffect(()=>{
    
    fulldata()
  },[]) 


  function fulldata () {

  
    const collect = query(collection(db,"markers"),where("request_status","==",false), where("user_id_requested","==","NLz3guI5pEOXKJEyDzz1tsdcEtF2"));
    const unsub = onSnapshot(collect, snapshot =>{


      

      const admintable = snapshot.docs.map(doc=> ({ place:doc.data().place, adminid:doc.id, data: doc.data().createdAt,
        user_id_requested : doc.data().user_id_requested,
    }
      ))

      
   


     setData(admintable)

    })

    return () =>{
        unsub()
    }
  }


 async  function searchModerator(){

  if(search !== null && search !== ""){

const collect = query(collection(db,"markers"),where("request_status","==",false), where("user_id_requested",">=",search), orderBy("user_id_requested"), limit(2));
    const unsub = onSnapshot(collect, snapshot =>{

      const admintable = snapshot.docs.map(doc=> ({ email:doc.data().email, adminid:doc.id}
      ))

     setData(admintable)

    })

    return () =>{
        unsub()
    }


  }else{
 
    fulldata();

    
  }


  
  } 


  const setApproveRequest = async (e) => {
    const docRef = doc(db, "markers", e);
    const docSnap = await getDoc(docRef);

    const updateStatus = await updateDoc(docRef, {
        
request_status: true,
    });

    alert("Successfull");
    

 /*    if(docSnap.data().status == "Active"){
      const updateStatus = await updateDoc(docRef, {
        
        status: "Deactivated",
        btn: "Reactivate",
      });

      //setStatus_s("status-deactivated");
      console.log(docSnap.data().status);
    }else{
      const updateStatus = await updateDoc(docRef, {
        status: "Active",
        btn: "Deactivate",
      });
      console.log(docSnap.data().status); */
      //setStatus_s("status-active");
      
    
  };




  return (
    
    <>
      <div className="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header">
                <h3 className="card-title">Manage Request' Account</h3>
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
                      value={search}
                      onChange={(e) => setSearch(e.target.value)}
                    />
                    <div className="input-group-append">
                      <button type="submit" onClick={searchModerator} className="btn btn-default">
                        <i className="fas fa-search" />
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div className="card-body table-responsive p-0">
                <table className="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Place</th>
                      <th>Timestamp</th>
                      <th>User Request</th>
                      <th>Status</th>
                      <th>Action</th>

                    </tr>
                  </thead>
                  <tbody id="tbody1">

        { 
              data.map( (markers_request) => (
                   
             

                <tr key={markers_request.adminid}>
                <td>{markers_request.adminid}</td>

                <td>{markers_request.place}</td>
                <td>{markers_request.data.seconds}, {markers_request.data.nanoseconds}</td>
                <td>{markers_request.user_id_requested}</td>


                <td>
                  <span className="tag tag-success">Approved</span>
                </td>
                <td>                 
                  <button onClick={(e)=>{setStatusModal(true); setUserStat(e.currentTarget.id)}} id={markers_request.adminid} class="statBtn">Approve Request</button>                  
                </td>
                
              </tr>
                   
                    ))}   
                   
                  </tbody>
                </table>
              </div>
              <MDBModal show={status_modal} tabIndex='-1' setShow={setStatusModal}>
              <MDBModalDialog size='sm'>
                <MDBModalContent>
                  <MDBModalHeader>
                    <MDBModalTitle>Sure?</MDBModalTitle>                    
                  </MDBModalHeader>
                  <MDBModalBody>
                    <MDBBtn className='btn-ok' color='none' onClick={()=>{setApproveRequest(userStat); setStatusModal(!status_modal);}}>Yes</MDBBtn>
                    <MDBBtn className='btn-close' color='none' onClick={()=>{setStatusModal(!status_modal)}}>No</MDBBtn>
                  </MDBModalBody>
                </MDBModalContent>
              </MDBModalDialog>
            </MDBModal>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default ManageRequest;