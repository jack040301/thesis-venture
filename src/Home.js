import React from "react";
import Header from "./components/Header";
import Dashboard from "./pages/Dashboard";
import SideNav from "./components/SideNav";
import Rentals from "./pages/Rentals";
import Users from "./pages/Users";
import Requests from "./pages/Requests";
import Configuration from "./pages/Configuration";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

function Home() {
  return (
    <>
      <div class="wrapper">
        <Header />
        {/* <Home /> */}
        <SideNav />
        {/* <Footer /> */}
        <Router>
          <Routes>
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/rentals" element={<Rentals />} />
            <Route path="/users" element={<Users />} />
            <Route path="/requests" element={<Requests />} />
            <Route path="/configuration" element={<Configuration />} />
          </Routes>
        </Router>
      </div>
    </>
  );
}

export default Home;
