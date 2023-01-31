import React from "react";

const data = {
  totalUser: 150,
  totalRentals: 50,
  totalRequest: 40
}

function totalUser(data){
  return(data);
}

function totalRentals(data){
  return(data);
}

function totalRequest(data){
  return(data);
}

const Dashboard = () => {
  return (
    <div>
      <div className="content-wrapper">
        <div className="content-header">
          <div className="container-fluid"></div>
        </div>
        <section className="content">
          <div className="container-fluid">
            <div className="row">
              <div className="col-lg-3 col-6">
                <div className="small-box bg-info">
                  <div className="inner">
                    <h3>{totalUser(data.totalUser)}</h3>
                    <p>Total Users</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-users" />
                  </div>
                  <a href="#" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </a>
                </div>
              </div>
              <div className="col-lg-3 col-6">
                <div className="small-box bg-success">
                  <div className="inner">
                    <h3>
                      {totalRentals(data.totalRentals)}<sup style={{ fontSize: 20 }}>%</sup>
                    </h3>
                    <p>Total Rentals</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-building" />
                  </div>
                  <a href="#" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </a>
                </div>
              </div>
              <div className="col-lg-3 col-6">
                <div className="small-box bg-warning">
                  <div className="inner">
                    <h3>{totalRequest(data.totalRequest)}</h3>
                    <p>Requests</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-list" />
                  </div>
                  <a href="#" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </a>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
};

export default Dashboard;
