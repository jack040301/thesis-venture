import React, { useEffect, useRef, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

import { auth, signInWithEmailAndPassword, doc,getDoc, db } from "../firebase";
import { UserAuth } from "./context";
import "./Login.css";

import ReactToast from "../components/Toast/toast"/* import Component of toast */

import ReCAPTCHA from "react-google-recaptcha";


import {
  MDBBtn,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBCard,
  MDBCardBody,
  MDBInput,
  MDBIcon,
  MDBCheckbox,
} from "mdb-react-ui-kit";

function Login() {
  const toastRef = useRef('')

  const [error, setError] = useState("")
  const [loading, setLoading] = useState(false)
  const navigate  = useNavigate ()

  const { logout } = UserAuth();


  const [email, setEmail] = useState("");

  const [password, setPassword] = useState("");

 // const [loggedemail,setLoggedEmail] = useState("");
  
  async function handleSubmit(e) {



    e.preventDefault();
    setError('')

    
    try {

       signInWithEmailAndPassword(auth, email, password)
  .then((userCredential) =>  {
    // Signed in
    
    var user = userCredential.user;
  
    localStorage.setItem("email",user.email);
  //  setLoggedEmail(user.email)
    getdata(user.uid)
    /*if(getdata(user.uid)){
      //toastRef.current.showToast("Logging in...")
      //setTimeout(()=>{toastRef.current.showToast('h')}, 2000);      
      console.log('The function has ticked')
    }else{
      console.log('something went wrong')
    }*/
    
  })
  .catch((error) => {
      //console.log(error)
      var errorCode = error.code;
      var errorMessage = error.message;

      if(errorCode === 'auth/user-not-found'){
        toastRef.current.showToast("Invalid credentials. Please enter valid email address.")
      }else if(errorCode === 'auth/wrong-password'){
        toastRef.current.showToast("Invalid credentials. Please enter a valid password")
      }else if(errorCode === 'auth/invalid-email'){
        toastRef.current.showToast("Invalid credentials. Please enter a valid email address")
      }

      //toastRef.current.showToast(error.toString())
  });   



    } catch (e) {
      //alert(e.message)

      toastRef.current.showToast(e.message)

      //setError(e.message)
     // console.log(e.message)
    }
  };

  async function getdata(userid){


    const docRef = doc(db, "users",userid);
    const docSnap = await getDoc(docRef);

    if (docSnap.exists() && docSnap.data().role === "admin") {
      
      //toastRef.current.showToast("asd")    
      //navigate('/dashboard')

    }else{

//Toast message

      //toastRef.current.showToast("Invalid credentials. Please try again.")
        localStorage.removeItem("email");
      logout()

    }
  }


  /* let navigate = useNavigate();
  navigate("/dashboard"); */

  return (
    <form>
{/* Toast Ui */}
<ReactToast ref={toastRef} timeout={2000} />
   
   
    <MDBContainer fluid>
      <MDBRow className="d-flex justify-content-center align-items-center h-100">
        <MDBCol col="12">
          <MDBCard
            className="my-5 mx-auto"
            style={{ borderRadius: "1rem", maxWidth: "500px" }}
          >
            <MDBCardBody className="p-5 w-100 d-flex flex-column">
              <h2 className="fw-bold mb-2 text-center">Log in</h2>
              {/* <p className=" mb-3">
                Please enter your valid credentials.
              </p> */}
              <label className="emailtext">Email Address</label>
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Email address"
                id="formControlLg"
                type="email"
                size="lg"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
              <label className="passwordtext">Password</label>
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Password"
                id="formControlLg"
                type="password"
                size="lg"
                value={password} onChange={(e) => setPassword(e.target.value)}
              required
              />

              {/* <MDBCheckbox
                name="flexCheck"
                id="flexCheckDefault"
                className="mb-4"
                label="Remember password"
              /> */}
              <br></br>
           {/*    <MDBBtn onClick={Login} size="lg">handle user profile</MDBBtn> */}
           <button
                disabled={loading}
                onClick={handleSubmit}
                size="lg"
                className="btn btn-primary btnlogin"
              >
                Login
              </button>

              <MDBCheckbox name="flexCheck" value='' id='flexCheckDefault' label='terms and conditions' />
              <ReCAPTCHA sitekey={process.env.REACT_APP_SITE_KEY} />
              {/* <button
              onClick={() => {
                  navigate("/dashboard");
                }}
              >
                Login
              </button> */}
              
              {/* <button
              onClick={() => {
                  navigate("/dashboard");
                }}
              >
                Login
              </button> */}
              <hr className="my-4" />

              {/* <MDBBtn
                className="mb-2 w-100"
                size="lg"
                style={{ backgroundColor: "#dd4b39" }}
              >
                <MDBIcon fab icon="google" className="mx-2" />
                Sign in with google
              </MDBBtn> */}

              {/* <MDBBtn
                className="mb-4 w-100"
                size="lg"
                style={{ backgroundColor: "#3b5998" }}
              >
                <MDBIcon fab icon="facebook-f" className="mx-2" />
                Sign in with facebook
              </MDBBtn> */}
            </MDBCardBody>
          </MDBCard>
        </MDBCol>
      </MDBRow>
    </MDBContainer>
    </form>
  );
}

export default Login;

