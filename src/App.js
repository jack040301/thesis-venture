import React, { Fragment } from "react";
import Dashboard from "./pages/Dashboard";
import MapPage from "./pages/Maps";
import Users from "./pages/Users";
import Request from "./pages/Requests";
import Protect from "./auth/Protected";
import Configuration from "./pages/Configuration";
import Header from "./components/Header";
import Sidenav from "./components/SideNav";
import AddModerator from "./pages/AddModerator";
import ManageModerator from "./pages/ManageModerator";
import ManageUsers from "./pages/ManageUsers";
import Login from "./auth/Login";
import Login2 from "./auth/Login2";
import ProtectedRoute from "./auth/PrivateRoute";

import { AuthContextProvider } from "./auth/context";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import ManageUser from "./pages/ManageUser";
import ManageRequest from "./pages/ManageRequest";

function App() {

  return (
    <div>
      <AuthContextProvider>

        <Routes>
         {/*  <Route path="/" element={
          <withCurrentUser><Login /></withCurrentUser>
          } /> */}

        <Route
            path="/"
            element={
              <Protect>
              <Login2/>
              </Protect>
            }
          />

          <Route
            path="/dashboard"
            element={
              <ProtectedRoute>
                <Header />
                <Sidenav />
                <Dashboard />
              </ProtectedRoute>
            }
          />
            <Route
            path="/map"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <MapPage />
              </ProtectedRoute>
            }
          />

          <Route
            path="/user"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <Users />
              </ProtectedRoute>
            }
          />


        <Route
            path="/manageruser"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <ManageUser />
              </ProtectedRoute>
            }
          />

      <Route
            path="/managerequest"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <ManageRequest />
              </ProtectedRoute>
            }
          />


          <Route
            path="/addmoderator"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <AddModerator />
              </ProtectedRoute>
            }
          />
          <Route
            path="/managemoderator"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <ManageModerator />
              </ProtectedRoute>
            }
          />
          <Route
            path="/manageusers"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <ManageUsers />
              </ProtectedRoute>
            }
          />
          <Route
            path="/request"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <Request />
              </ProtectedRoute>
            }
          />
          <Route
            path="/configuration"
            element={
              <ProtectedRoute>
                {" "}
                <Header />
                <Sidenav />
                <Configuration />
              </ProtectedRoute>
            }
          />
        </Routes>
      </AuthContextProvider>
    </div>
  );
}

export default App;
