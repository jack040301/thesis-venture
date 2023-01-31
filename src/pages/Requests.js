import React from "react";
import {collections } from "./dataCenter";

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

function App() {
  return (
    <>
      <div class="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header">
                <h3 className="card-title">Requests</h3>
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
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default App;
