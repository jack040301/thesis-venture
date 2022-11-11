import React from "react";
import Header from "./components/Header";
import Dashboard from "./pages/Dashboard";
import SideNav from "./components/SideNav";
import Rentals from "./pages/Rentals";
import Users from "./pages/Users";
import Requests from "./pages/Requests";
import Configuration from "./pages/Configuration";
import Form from "./pages/Form";

import Login from "./auth/Login";
/* import Home from "./Home"; */
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

function App() {
  return (
    <>
      <div class="wrapper">
       <Login /> 
        <Header />
        <SideNav />
        {/* <Home /> */}
        {/* <Footer /> */}

        {/* <Routes> */}
        {/* <Router> */}
        {/* <Route exact path="/login" component={Login} />
          <Route
            exact
            path="/dashboard"
            component={() => <Dashboard authorized={false} />}
          /> */}
        {/* </Routes> */}
        {/* </Router> */}

        <Router>
          <Routes>
            <Route index element={<Dashboard />} />
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/rentals" element={<Rentals />} />
            <Route path="/users" element={<Users />} />
            <Route path="/requests" element={<Requests />} />
            <Route path="/configuration" element={<Configuration />} />
            <Route path="/form" element={<Form />} />
          </Routes>
        </Router>

       
      </div>
    </>
  );
}

export default App;
