import React,  { useState } from "react";
import { auth} from '../firebase'
import { signInWithEmailAndPassword} from 'firebase/auth';

/* import { useNavigate } from "react-router-dom"; */

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

function Login({
  setAuthState,
  setUser
}) {

  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');


  const handleLogin = () => {
      if(email !== null && password !== null) {
          signInWithEmailAndPassword(auth, email, password)
          .then(() => {
              setUser(email)
              setAuthState('home')
          })
          .catch((err) => alert(err));
      }
  }



  /* let navigate = useNavigate();
  navigate("/dashboard"); */

  return (
    <MDBContainer fluid>
      <MDBRow className="d-flex justify-content-center align-items-center h-100">
        <MDBCol col="12">
          <MDBCard
            className="bg-white my-5 mx-auto"
            style={{ borderRadius: "1rem", maxWidth: "500px" }}
          >
            <MDBCardBody className="p-5 w-100 d-flex flex-column">
              <h2 className="fw-bold mb-2 text-center">Log in</h2>
              <p className="text-white-50 mb-3">
                Please enter your login and password!
              </p>

              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Email address"
                id="formControlLg"
                type="email"
                size="lg"
                value={email} onChange={(e) => setEmail(e.target.value)}
              />
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Password"
                id="formControlLg"
                type="password"
                size="lg"
                value={password} onChange={(e) => setPassword(e.target.value)}

              />

              <MDBCheckbox
                name="flexCheck"
                id="flexCheckDefault"
                className="mb-4"
                label="Remember password"
              />
              <br></br>
           {/*    <MDBBtn onClick={Login} size="lg">handle user profile</MDBBtn> */}
             <MDBBtn onClick={handleLogin}  size="lg">Login</MDBBtn>

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
  );
}

export default Login;
