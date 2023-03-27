import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import Login from "./auth/Login";
import App from "./App";
import Dashboard from "./pages/Dashboard";
import reportWebVitals from "./reportWebVitals";
import { BrowserRouter } from 'react-router-dom';
import { GoogleReCaptchaProvider } from "react-google-recaptcha-v3";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <BrowserRouter>
    <GoogleReCaptchaProvider 
      reCaptchaKey={process.env.REACT_APP_SITE_KEY_V3}
      scriptProps={{
        async: false,
        defer: false,
        appendTo: 'head',
      }}
      container={{
        element: "submit01",
        parameters: {
          badge: 'inline',
          theme: 'dark',
        }
      }}
    >
      <App />
    </GoogleReCaptchaProvider>
    {/*<App />*/}
  </BrowserRouter>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals

