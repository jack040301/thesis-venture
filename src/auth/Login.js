import React, { useEffect, useRef, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

import { auth, signInWithEmailAndPassword, doc,getDoc, db } from "../firebase";
import { UserAuth } from "./context";


import ReactToast from "../components/Toast/toast"/* import Component of toast */

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
  const toastRef = useRef()

  const [error, setError] = useState("")
  const [loading, setLoading] = useState(false)
  const navigate  = useNavigate ()

  const { logout } = UserAuth();


  const [email, setEmail] = useState("");

  const [password, setPassword] = useState("");



  async function getdata(userid){


    const docRef = doc(db, "users",userid);
    const docSnap = await getDoc(docRef);

    if (docSnap.exists() && docSnap.data().role === "admin") {
      
      toastRef.current.showToast("Logging in....")
      
      navigate('/dashboard')


    }else{

//Toast message
      toastRef.current.showToast("Invalid credentials. Please try again.")
      return logout()
    }
  }
  
  async function handleSubmit(e) {



    e.preventDefault();
    setError('')

    
    try {

       signInWithEmailAndPassword(auth, email, password)
  .then((userCredential) =>  {
    // Signed in
    
    var user = userCredential.user;
  

    getdata(user.uid)
    
  })
  .catch((error) => {
//      console.log(error)

      toastRef.current.showToast(error)

  });   



    } catch (e) {
      //alert(e.message)

      toastRef.current.showToast(e.message)

      //setError(e.message)
     // console.log(e.message)
    }
  };



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
            className="bg-white my-5 mx-auto"
            style={{ borderRadius: "1rem", maxWidth: "500px" }}
          >
            <MDBCardBody className="p-5 w-100 d-flex flex-column">
              <h2 className="fw-bold mb-2 text-center">Log in</h2>
              <p className="text-black-50 mb-3">
                Please enter your valid credentials.
              </p>

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
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Password"
                id="formControlLg"
                type="password"
                size="lg"
                value={password} onChange={(e) => setPassword(e.target.value)}
              required
              />

              <MDBCheckbox
                name="flexCheck"
                id="flexCheckDefault"
                className="mb-4"
                label="Remember password"
              />
              <br></br>
           {/*    <MDBBtn onClick={Login} size="lg">handle user profile</MDBBtn> */}
           <button
                disabled={loading}
                onClick={handleSubmit}
                size="lg"
                className="btn btn-primary"
              >
                Login
              </button>
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
