/* import React from "react"; */
import { signOut } from "firebase/auth";
import { auth } from "../firebase";
import { logout } from "../auth/context";
import { Link, NavLink } from "react-router-dom";
import React, { useState } from "react";
import {
  MDBBtn,
  MDBModal,
  MDBModalDialog,
  MDBModalContent,
  MDBModalHeader,
  MDBModalTitle,
  MDBModalBody,
  MDBModalFooter,
  MDBContainer,
} from "mdb-react-ui-kit";

export default function SideNav({ user, setAuthState, setUser }) {
  const signOutHandler = () => {
    signOut(auth)
      .then(() => {
           // setUser(null)
           // setAuthState("login")
        //        setAuthState("login");
      })
      .catch((err) => console.log(err));
  };
  const [basicModal, setBasicModal] = useState(false);
  const toggleShow = () => setBasicModal(!basicModal);

  return (
    <div>
      {/* Modal Codes */}
      <MDBModal show={basicModal} setShow={setBasicModal} tabIndex="-1">
                <MDBModalDialog>
                  <MDBModalContent>
                    <MDBModalHeader>
                      <MDBModalTitle>Log out</MDBModalTitle>
                    </MDBModalHeader>
                    <MDBModalBody>Are you sure you want to log out your account?</MDBModalBody>

                    <MDBModalFooter>
                      <button color="secondary" className="btn btn-secondary" onClick={toggleShow}>
                        Cancel
                      </button>
                      <button className="btn btn-danger" onClick={signOutHandler}>Logout</button>
                    </MDBModalFooter>
                  </MDBModalContent>
                </MDBModalDialog>
              </MDBModal>
            {/* End of Modal */}
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
          <nav className="mt-2"
          > 
            <ul
              className="nav nav-pills nav-sidebar flex-column"
              data-widget="treeview"
              role="menu"
              data-accordion="false"
            >
              <li className="nav-item">
                <NavLink 
                to="/dashboard" className="nav-link">
                  <i className="nav-icon fas fa-tachometer-alt" />
                  <p>Dashboard</p>
                </NavLink>
              </li>

              <li className="nav-item">
                <NavLink to="/map" className="nav-link">
                  <i className="nav-icon fas fa-building" />

                  <p>Maps & Markers</p>
                </NavLink>
              </li>

              {/* <li className="nav-item">
                <Link to="/user" className="nav-link">
                  <i className="nav-icon fas fa-user" />
                  <p>Users</p>
                </Link>
              </li> */}
              {/* <li className="nav-item">
                <Link to="/request" className="nav-link">
                  <i className="nav-icon fas fa-list" />
                  <p>Requests</p>
                </Link>
              </li> */}
              <li className="nav-item">
                <NavLink to="/configuration" className="nav-link">
                  <i className="nav-icon fas fa-tools" />
                  <p>Configuration</p>
                </NavLink>
              </li>              
              <li className="nav-item">
                <a href="#" className="nav-link">
                  <i className="nav-icon fas fa-times" />
                  <p onClick={toggleShow}>Logout</p>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </aside>
    </div>
  );
}
