import React, {useEffect, useState} from "react";
import {collection, db,onSnapshot, query,where, limit,orderBy } from "../firebase";


function ManageRequest() {

  const [data, setData] = useState([]);
   const [search,setSearch] = useState([]);


  useEffect(()=>{
    
    fulldata()
  },[]) 


  function fulldata () {

  
    const collect = query(collection(db,"users"),where("role","==","user"));
    const unsub = onSnapshot(collect, snapshot =>{

      const admintable = snapshot.docs.map(doc=> ({ email:doc.data().email, adminid:doc.id}
      ))


     setData(admintable)

    })

    return () =>{
        unsub()
    }
  }


 async  function searchModerator(){

  if(search !== null && search !== ""){

const collect = query(collection(db,"users"),where("role","==","user"), where("email",">=",search), orderBy("email"), limit(1));
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
                    </tr>
                  </thead>
                  <tbody id="tbody1">

                  { 
              data.map( (mark) => (
                   
                
                <tr key={mark.adminid}>
                <td>{mark.adminid}</td>
                <td>{mark.email}</td>
                <td>Users</td>
                <td>Daily</td>

                <td>
                  <span className="tag tag-success">Approved</span>
                </td>
                
              </tr>
                   
                    ))}   
                   
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default ManageRequest;
