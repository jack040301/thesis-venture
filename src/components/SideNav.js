import React from "react";
import { signOut } from 'firebase/auth';
import { auth } from '../firebase';
import { Link } from 'react-router-dom'

/* import {
  MDBBtn,

} from "mdb-react-ui-kit"; */



export default function SideNav({
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
      <aside className="main-sidebar sidebar-dark-primary elevation-4">
      <Link to="/dashboard" className="brand-link">
          <img
            src="dist/img/Venture.png"
            alt="AdminLTE Logo"
            className="brand-image img-circle elevation-3"
            style={{ opacity: ".8" }}
          />
          <span className="brand-text font-weight-light">Venture</span>
        </Link>
        <div className="sidebar">
          <nav className="mt-2">
            <ul
              className="nav nav-pills nav-sidebar flex-column"
              data-widget="treeview"
              role="menu"
              data-accordion="false"
            >
              <li className="nav-item menu-open">
                <a href="/dashboard" className="nav-link active">
                  <i className="nav-icon fas fa-tachometer-alt" />
                  <p>Dashboard</p>
                </a>
              </li>

              <li className="nav-item">
              <Link to="/map" className="nav-link">
           
                  <i className="nav-icon fas fa-building" />

                  <p>Maps & Markers</p>
             
                </Link>
              </li>

              <li className="nav-item">
              <Link to="/user" className="nav-link">
                  <i className="nav-icon fas fa-user" />
                  <p>Users</p>
       </Link>
              </li>
              <li className="nav-item">
              <Link to="/request" className="nav-link">
                  <i className="nav-icon fas fa-list" />
                  <p>Requests</p>
                </Link>
              </li>
              <li className="nav-item">
              <Link to="/configuration" className="nav-link">
                  <i className="nav-icon fas fa-tools" />
                  <p>Configuration</p>
                </Link>
              </li>
              <li className="nav-item">
                <a href="#" className="nav-link">

                 <button onClick={signOutHandler}  size="lg">Logout</button>

                </a>
              </li>
            </ul>
          </nav>
        </div>
      </aside>
    </div>
  );
};
