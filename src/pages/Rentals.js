import React from "react";
import { getFirestore, collection, getDoc, doc } from "firebase/firestore";
import DataTower  from "./dataCenter.js";
import { collections } from "./dataCenter.js";

const dataStore = new DataTower();
dataStore.jar.setUser = "Test user here";
//dataStore.setupData();
//dataStore.testData();
console.log("Rental outside: ", dataStore.jar['user']);
  //arr.push(collections[0]);

function generateTable(collections){
  
  var tableItems = collections.map((collections)=>
  <tr>
    <td>{collections.id}</td>
          <td>{collections.user}</td>
          <td>{collections.date}</td>
          <td>
              <span className="tag tag-success">{collections.status}</span>
          </td>
    <td>{collections.reason}</td>
  </tr>
  );
  
  return(
    <tbody>
      {tableItems}      
    </tbody>
  );  
}

function Home() {
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
                <table className="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>User</th>
                      <th>Date</th>
                      <th>Status</th>
                      <th>Reason</th>
                    </tr>
                  </thead>
                  {generateTable(collections)}
                  {/*<tbody>
                  {tableData(collections[0].id, collections[0].user, collections[0].date, collections[0].status, collections[0].reason)}
                </tbody>*/}                
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Home;
