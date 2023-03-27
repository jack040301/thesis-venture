import React, { useRef, useState } from "react";
import { useNavigate } from "react-router-dom";

import { auth, signInWithEmailAndPassword, doc, getDoc, db } from "../firebase";
import { UserAuth } from "./context";
import "./Login.css";
import ReactToast from "../components/Toast/toast"; /* import Component of toast */
import { ReCapt } from "./recatpcha";
import { GoogleReCaptchaProvider } from "react-google-recaptcha-v3";
import ReCAPTCHA from "react-google-recaptcha";

import {
  MDBBtn,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBCard,
  MDBCardBody,
  MDBInput,
  MDBCheckbox,
  MDBIcon,
} from "mdb-react-ui-kit";
import "./Login2.css";
import { async } from "@firebase/util";

function App() {
  const toastRef = useRef();

  const [error, setError] = useState("");
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  const { logout } = UserAuth();

  const [email, setEmail] = useState("");

  const [password, setPassword] = useState("");
  const [check, setCheckBox] = useState(false);
  const [check2, setCheckBox2] = useState(false);

  // const [loggedemail,setLoggedEmail] = useState("");

  async function getdata(userid) {
    const docRef = doc(db, "users", userid);
    const docSnap = await getDoc(docRef);

    if (docSnap.exists() && docSnap.data().role === "admin") {
      //   toastRef.current.showToast("Logging in....")

      navigate("/dashboard");
    } else {
      //Toast message

      //toastRef.current.showToast("Invalid credentials. Please try again.")
      localStorage.removeItem("email");
      logout();
    }
  }

  async function handleTick(e){
    //e.preventDefault();
    setError("");

    if(!check){
      setCheckBox(true);
      setLoading(false);
    }else{
      setCheckBox(false);
      setLoading(true);
    }

  }

  async function handleSubmit(e) {
    e.preventDefault();
    setError("");

    try {
      signInWithEmailAndPassword(auth, email, password)
        .then((userCredential) => {
          // Signed in

          var user = userCredential.user;

          localStorage.setItem("email", user.email);
          //  setLoggedEmail(user.email)
          getdata(user.uid);
        })
        .catch((error) => {
          //console.log(error)
          var errorCode = error.code;
          //  var errorMessage = error.message;

          if (errorCode === "auth/user-not-found") {
            toastRef.current.showToast(
              "Invalid credentials. Please enter valid email address."
            );
          } else if (errorCode === "auth/wrong-password") {
            toastRef.current.showToast(
              "Invalid credentials. Please enter a valid password"
            );
          } else if (errorCode === "auth/invalid-email") {
            toastRef.current.showToast(
              "Invalid credentials. Please enter a valid email address"
            );
          }

          //toastRef.current.showToast(error.toString())
        });
    } catch (e) {
      //alert(e.message)

      toastRef.current.showToast(e.message);

      //setError(e.message)
      // console.log(e.message)
    }
  }

  /* let navigate = useNavigate();
  navigate("/dashboard"); */

  return (
    <form>
      {/* Toast Ui */}
      <ReactToast ref={toastRef} timeout={2000} />
      <MDBContainer className="p-4 wholeContain">
        <MDBRow className="">
          <MDBCol
            md="6"
            className="text-center text-md-start d-flex flex-column justify-content-center side"
          >
            {/* <h1 className="my-5 display-3 fw-bold ls-tight px-3">
              Venture <br />
              <img src="Assets/Venture.png"></img>
              <span className="text-primary">
                The best offer for your business
              </span>
            </h1> */}

            {/* <p className="px-3" style={{ color: "hsl(217, 10%, 50.8%)" }}>
              This site is restricted for the Admins of Venture Application only
            </p> */}
          </MDBCol>

          <MDBCol md="6" className="loginForm">
            <MDBCard className="my-5 contain">
              <MDBCardBody className="p-5 insideForm">
                <center>
                  <div className="logo">
                    <img src="dist/img/Venture.png" className="ventureLogo" />
                    <label className="ventureLabel"> Venture</label>
                  </div>
                </center>
                <h2 className="fw-bold ">Admin Login</h2>
                <label className="emailLabels">Email</label>
                <MDBInput
                  className="emailLabel"
                  wrapperClass="mb-4"
                  id="form1"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                  type="email"
                />
                <label>Password</label>
                <MDBInput
                  wrapperClass="mb-4"
                  size="lg"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                  id="form1"
                  type="password"
                />
                <button
                  disabled={loading}
                  onClick={handleSubmit}
                  size="lg"
                  className="btn btn-primary btnlogin w-100 mb-4"
                >
                  Login
                </button>
                {/*<ReCapt id={"submit01"} />*/}
                {/*<MDBCheckbox label="SampleCheckBox" checked={check} onClick={(e)=>{handleTick()}} />*/}
                
                <ReCAPTCHA sitekey={process.env.REACT_APP_SITE_KEY}  theme="dark" onChange={(e)=>{handleTick()}} />
                <ReCapt check={check2} />
              </MDBCardBody>
            </MDBCard>
          </MDBCol>
        </MDBRow>
      </MDBContainer>
    </form>
  );
}

export default App;
