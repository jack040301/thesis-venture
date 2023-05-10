import React, {useEffect, useState} from "react";
import { getDocs } from "../firebase";
import {collection, db,onSnapshot, query,where, limit,orderBy, doc, updateDoc,getDoc } from "../firebase";
import {
  MDBModal,
  MDBModalDialog,
  MDBModalContent,
  MDBModalHeader,
  MDBModalTitle,
  MDBModalBody,
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownItem,
  MDBDropdownMenu,

  MDBBtn,
  MDBModalFooter,
} from "mdb-react-ui-kit";

import { CusDropDown, TopFullWidthModal } from "../components/Toast/customDropDownBtn";


function ManageRequest() {

  const [data, setData] = useState([]);
   const [search,setSearch] = useState([]);
   const [status_modal, setStatusModal] = useState(false);
   const [userStat, setUserStat] = useState("");



  useEffect(()=>{
    
    fulldata()    
  },[]) 


  function fulldata () {

  
    const collect = query(collection(db,"markers"),where("request_status","==",false),limit(10));
    const unsub = onSnapshot(collect, snapshot =>{


      

      const admintable = snapshot.docs.map(doc=> ({ 
        
        place:doc.data().place,
        adminid:doc.id,
        status:"Waiting To Approve",
        user_email_requested: doc.data().user_email_requested, 
        data: Date(doc.data().createdAt),
        user_id_requested : doc.data().user_id_requested,
    }

    
      ))
    //  const date = Date(data.nanoseconds / 1000000);

      
   


     setData(admintable)

    })

    return () =>{
        unsub()
    }
  }

  const Weekly = () => {
    const collect = query(collection(db,"markers"),where("tstag","==","week"),limit(10));
    const unsub = onSnapshot(collect, snapshot =>{


      

      const admintable = snapshot.docs.map(doc=> ({ 
        
        place:doc.data().place,
        adminid:doc.id,
        status:"Waiting To Approve",
        user_email_requested: doc.data().user_email_requested, 
        data: Date(doc.data().createdAt),
        user_id_requested : doc.data().user_id_requested,
    }

    
      ))
    //  const date = Date(data.nanoseconds / 1000000);

      
   


     setData(admintable)

    })
    
    return () => {
      unsub();          
    }  
  };

  const Monthly = () => {
    const collect = query(collection(db,"markers"),where("tstag","==","month"),limit(10));
    const unsub = onSnapshot(collect, snapshot =>{


      

      const admintable = snapshot.docs.map(doc=> ({ 
        
        place:doc.data().place,
        adminid:doc.id,
        status:"Waiting To Approve",
        user_email_requested: doc.data().user_email_requested, 
        data: Date(doc.data().createdAt),
        user_id_requested : doc.data().user_id_requested,
    }

    
      ))
    //  const date = Date(data.nanoseconds / 1000000);

      
   


     setData(admintable)

    })
    
    return () => {
      unsub();      
    }  
  };

  const Yearly = () => {
    const collect = query(collection(db,"markers"),where("tstag","==","year"),limit(10));
    const unsub = onSnapshot(collect, snapshot =>{


      

      const admintable = snapshot.docs.map(doc=> ({ 
        
        place:doc.data().place,
        adminid:doc.id,
        status:"Waiting To Approve",
        user_email_requested: doc.data().user_email_requested, 
        data: Date(doc.data().createdAt),
        user_id_requested : doc.data().user_id_requested,
    }

    
      ))
    //  const date = Date(data.nanoseconds / 1000000);

      
   


     setData(admintable)

    })
    
    return () => {
      unsub();      
    }  
  };

  const setTSTAG = async (e) => {
    const docRef = doc(db, "markers", e);
    const docSnap = await getDoc(docRef);

    if(docSnap.data().request_status == false){
      const updateStatus = await updateDoc(docRef, {
        tstag: "week",        
      });

      //setStatus_s("status-deactivated");
      console.log(docSnap.data().status);
    }else{
      const updateStatus = await updateDoc(docRef, {
        tstag: "month",   
      });
      console.log(docSnap.data().status);
      //setStatus_s("status-active");
    }    
    
  };

  const setAllTSTAG = async () => {
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
        setTSTAG(x.docId);    
      }
    });    
  };

  

  /* async function dateget(){
    const collect = query(collection(db,"markers"),where("request_status","==",false), where("user_id_requested","==","05N8q9xhGPS0H9gaBSxi"));


    const unsub = onSnapshot(collect, snapshot =>{


      snapshot.docs.forEach((doc) => {
        const timestamp = doc.data().createdAt;
        const converdate = Date(timestamp)

       //  console.log(converdate);
           
          // console.log(doc.data())// outputs the timestamp value in nanoseconds
          });
        }, (error) => {
          console.log('Error getting documents:', error);
        });
      
   


///     setData(admintable)


    return () =>{
        unsub()
    }
 
    




  }
*/

 /* async  function searchModerator(){

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
 */

  const setApproveRequest = async (e) => {
    const docRef = doc(db, "markers", e);
    const docSnap = await getDoc(docRef);

    const updateStatus = await updateDoc(docRef, {
        
request_status: true,
    });

    alert("Successfully update");
    

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
              {/*       <input
                      type="text"
                      name="table_search"
                      className="form-control float-right"
                      placeholder="Search"
                      value={search}
                      onChange={(e) => setSearch(e.target.value)}
                    /> */}


                    <div className="input-group-append">
                    <CusDropDown
                       btnName={"Filter"}>
                    <button onClick={()=>{Weekly();}}>Weekly</button>
                    <button onClick={()=>{Monthly()}}>Monthly</button>
                    <button onClick={()=>{Yearly()}}>Yearly</button>
                    <button onClick={()=>{setAllTSTAG()}}>set tag</button>
                   </CusDropDown>

      {/*                 <button type="submit" onClick={searchModerator} className="btn btn-default">
                        <i className="fas fa-search" />
                      </button>
       */}              </div>

          <div className="input-group-append">
                  

      {/*                 <button type="submit" onClick={searchModerator} className="btn btn-default">
                        <i className="fas fa-search" />
                      </button>
       */}              </div>

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
                <td>{markers_request.data}</td>
                <td>{markers_request.user_email_requested}</td>


                <td>
                  <span className="tag tag-success">
                    {markers_request.status}
                    </span>
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
              <MDBModalDialog >
                <MDBModalContent>
                  <MDBModalHeader>
                    <MDBModalTitle>Approval Request</MDBModalTitle>                    
                  </MDBModalHeader>
                  <MDBModalBody>

                  Do you want to approve this place to be venture out ?
                    
                  </MDBModalBody>
                  <MDBModalFooter>
                  <MDBBtn className='btn-ok btn-primary'  onClick={()=>{setApproveRequest(userStat); setStatusModal(!status_modal);}}>Approve</MDBBtn>
                    <MDBBtn className='btn-close btn-danger'  onClick={()=>{setStatusModal(!status_modal)}}>Cancel</MDBBtn>

                  </MDBModalFooter>
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
