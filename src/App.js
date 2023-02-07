import React, { Fragment } from "react";
import Dashboard from "./pages/Dashboard";
import MapPage from "./pages/Maps";
import Users from "./pages/Users";
import Request from "./pages/Requests";
import Configuration from "./pages/Configuration";
import Header from "./components/Header";
import Sidenav from "./components/SideNav";

import Login from "./auth/Login";
import ProtectedRoute from "./auth/PrivateRoute";
import { AuthContextProvider } from "./auth/context";
/* import Home from "./Home"; */
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

function App() {
  return (
    <div>
      <AuthContextProvider>
        <Routes>
          <Route path="/" element={<MapPage />} />

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
            path="/rental"
            element={
              <ProtectedRoute>
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
            path="/config"
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
