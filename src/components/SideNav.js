/* import React from "react"; */
import { signOut } from "firebase/auth";
import { auth } from "../firebase";
import { Link, NavLink } from "react-router-dom";
import React, { useState, useRef } from "react";
import {
  MDBModal,
  MDBModalDialog,
  MDBModalContent,
  MDBModalHeader,
  MDBModalTitle,
  MDBModalBody,
  MDBModalFooter,
} from "mdb-react-ui-kit";

import { Moderator } from "../auth/moderatorsOnly";

import ReactToast from "./Toast/toast"; /* import Component of toast */

export default function SideNav({ user, setAuthState, setUser }) {
  const toastRef = useRef();

  const signOutHandler = () => {
    signOut(auth)
      .then(() => {
        // setUser(null)
        // setAuthState("login")

        toastRef.current.showToast("Do not leave the fields blank");

        //        setAuthState("login");
      })
      .catch((err) => toastRef.current.showToast(err.message));
  };
  const [basicModal, setBasicModal] = useState(false);
  const toggleShow = () => setBasicModal(!basicModal);

  return (
    <>
      <ReactToast ref={toastRef} timeout={2000} />

      <div>
        {/* Modal Codes */}
        <MDBModal show={basicModal} setShow={setBasicModal} tabIndex="-1">
          <MDBModalDialog>
            <MDBModalContent>
              <MDBModalHeader>
                <MDBModalTitle>Log out</MDBModalTitle>
              </MDBModalHeader>
              <MDBModalBody>
                Are you sure you want to log out your account?
              </MDBModalBody>

              <MDBModalFooter>
                <button
                  color="secondary"
                  className="btn btn-secondary"
                  onClick={toggleShow}
                >
                  Cancel
                </button>
                <button className="btn btn-danger" onClick={signOutHandler}>
                  Logout
                </button>
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
            <nav className="mt-2">
              <ul
                className="nav nav-pills nav-sidebar flex-column"
                data-widget="treeview"
                role="menu"
                data-accordion="false"
              >
                <li className="nav-item">
                  <NavLink to="/dashboard" className="nav-link">
                    <i className="nav-icon fas fa-tachometer-alt" />
                    <p>Dashboard</p>
                  </NavLink>
                </li>

                <li className="nav-item">
                  <NavLink to="/map" className="nav-link">
                    <i className="nav-icon fas fa-map-marker" />

                    <p>Maps & Markers</p>
                  </NavLink>
                </li>

                <Moderator  modId={"mod01"} >
                  <NavLink to="/addmoderator" className="nav-link">
                    <i className="nav-icon fas fa-user-plus" />
                    <p>Add Moderators</p>
                  </NavLink>
                </Moderator>
                <Moderator modId={"mod01"}>
                  <NavLink to="/managemoderator" className="nav-link">
                    <i className="nav-icon fas fa-users" />
                    <p>Manage Moderators</p>
                  </NavLink>
                </Moderator>
                {/* <li className="nav-item">
                <Link to="/request" className="nav-link">
                  <i className="nav-icon fas fa-list" />
                  <p>Requests</p>
                </Link>
              </li> */}
                   <li className="nav-item">
                  <NavLink to="/managerequest" className="nav-link">
                    <i className="nav-icon fas fa-tools" />
                    <p>Manage Request</p>
                  </NavLink>
                </li>
                
                <li className="nav-item">
                  <NavLink to="/manageruser" className="nav-link">
                    <i className="nav-icon fas fa-tools" />
                    <p>Manage User</p>
                  </NavLink>
                </li>
           

                <li className="nav-item">
                  <NavLink to="/configuration" className="nav-link">
                    <i className="nav-icon fas fa-tools" />
                    <p>Account Configuration</p>
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
    </>
  );
}
