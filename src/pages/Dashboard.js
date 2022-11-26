import React, {useContext} from 'react'

import { signOut } from 'firebase/auth';
import { auth } from '../firebase';



export default function Dashboard({
  user,
  setAuthState,
  setUser
}) {

  const signOutHandler = () => {
      signOut(auth)
      .then(() => {
          setUser(null);
          setAuthState('login');
      })
      .catch((err) => console.log(err));
  }


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
                    <h3>150</h3>
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
                      53<sup style={{ fontSize: 20 }}>%</sup>
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
                    <h3>44</h3>
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
}

