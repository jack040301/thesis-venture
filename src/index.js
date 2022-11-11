import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import Login from "./auth/Login";
import App from "./App";
import Dashboard from "./pages/Dashboard";
import reportWebVitals from "./reportWebVitals";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
    {/* <Router> */}
    {/* <Routes> */}
    {/* <Route index element={<App />} /> */}
    {/* <Route path="login" element={<Login />} /> */}
    {/* <Route path="dashboard" element={<Dashboard />} /> */}
    {/* </Routes> */}
    {/* </Router> */}
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
