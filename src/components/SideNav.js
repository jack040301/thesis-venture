import React from "react";
import { Link } from "react-router-dom";

const SideNav = () => {
  return (
    <div>
      <aside className="main-sidebar sidebar-dark-primary elevation-4">
        <a href="index3.html" className="brand-link">
          <img
            src="dist/img/Venture.png"
            alt="AdminLTE Logo"
            className="brand-image img-circle elevation-3"
            style={{ opacity: ".8" }}
          />
          <span className="brand-text font-weight-light">Venture</span>
        </a>
        <div className="sidebar">
          <nav className="mt-2">
            <ul
              className="nav nav-pills nav-sidebar flex-column"
              data-widget="treeview"
              role="menu"
              data-accordion="false"
            >
              <li className="nav-item menu-open">
                <a href="/Dashboard" className="nav-link active">
                  <i className="nav-icon fas fa-tachometer-alt" />
                  <p>Dashboard</p>
                </a>
              </li>

              <li className="nav-item">
                <a href="/Rentals" className="nav-link">
                  <i className="nav-icon fas fa-building" />

                  <p>Rentals</p>
                </a>
              </li>

              <li className="nav-item">
                <a href="/Users" className="nav-link">
                  <i className="nav-icon fas fa-user" />
                  <p>Users</p>
                </a>
              </li>
              <li className="nav-item">
                <a href="/Requests" className="nav-link">
                  <i className="nav-icon fas fa-list" />
                  <p>Requests</p>
                </a>
              </li>
              <li className="nav-item">
                <a href="/form" className="nav-link">
                  <i className="nav-icon fas fa-tools" />
                  <p>Configuration</p>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </aside>
    </div>
  );
};

export default SideNav;
