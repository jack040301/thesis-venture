import React, {useEffect, useState} from "react";
import {collection, db,onSnapshot, query,where, limit,orderBy, getDoc, doc, updateDoc } from "../firebase";
import './global.css';
import '../components/Toast/cddb.css';
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

function ManageUsers() {

  const [data, setData] = useState([]);
   const [search,setSearch] = useState([]);
   const [status, setStatus] = useState("Active");
   const [status_s, setStatus_s] = useState("status-active");
   const [status_b, setStatus_b] = useState("Deactivate");
   const [status_modal, setStatusModal] = useState(false);
   const [userStat, setUserStat] = useState("");


  useEffect(()=>{
    
    fulldata()
  },[]) 


  function fulldata () {

  
    const collect = query(collection(db,"users"),where("role","==","user"));
    const unsub = onSnapshot(collect, snapshot =>{

      const admintable = snapshot.docs.map(doc=> ({ email:doc.data().email, adminid:doc.id,role:doc.data().role, status:doc.data().status, btn: doc.data().btn}
      ))


     setData(admintable)

    })

    return () =>{
        unsub()
    }
  }


 async  function searchUsers(){

  if(search !== null && search !== ""){

    const collect = query(collection(db,"users"),where("role","==","users"), where("email",">=",search), orderBy("email"), limit(1));
    const unsub = onSnapshot(collect, snapshot =>{

      const admintable = snapshot.docs.map(doc=> ({ email:doc.data().email, adminid:doc.id, role:doc.data().role, status:doc.data().status}
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
  
  const setModStatus = async (e) => {
    const docRef = doc(db, "users", e);
    const docSnap = await getDoc(docRef);

    if(docSnap.data().status == "Active"){
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
      console.log(docSnap.data().status);
      //setStatus_s("status-active");
    }    
    
  };



  return (
    
    <>
      <div className="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header">
                <h3 className="card-title">Manage Moderators' Account</h3>
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
                      <button type="submit" onClick={searchUsers} className="btn btn-default">
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
                      <th>Email</th>
                      <th>Role</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody id="tbody1">

                  { 
              data.map( (mark) => (
                   
                
                <tr key={mark.adminid}>
                <td>{mark.adminid}</td>
                <td>{mark.email}</td>
                <td>{mark.role}</td>
                <td>
                  <span className={mark.btn} id={mark.adminid}>{mark.status}</span>
                </td>
                <td>
                <button onClick={(e)=>{setStatusModal(true); setUserStat(e.currentTarget.id)}} id={mark.adminid} class="statBtn">{mark.btn}</button>                  
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
                    <MDBBtn className='btn-ok' color='none' onClick={()=>{setModStatus(userStat); setStatusModal(!status_modal);}}>Yes</MDBBtn>
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

export default ManageUsers;
