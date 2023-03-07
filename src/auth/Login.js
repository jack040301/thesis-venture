<<<<<<< HEAD:src/auth/Login.js
import React,  {  useRef,useState } from "react";
import { Link, useNavigate  } from "react-router-dom"

import {UserAuth } from './context'
=======
<<<<<<< Updated upstream:src/Login.js
import React from "react";
import { BrowserRouter as Router, Link } from "react-router-dom";
=======
import React, { useRef, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

import { UserAuth } from "./context";
>>>>>>> Stashed changes:src/auth/Login.js
>>>>>>> 84f274f (web important changes):src/Login.js
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

function Login() {
<<<<<<< HEAD:src/auth/Login.js

  const [error, setError] = useState("")
  const [loading, setLoading] = useState(false)
  const navigate  = useNavigate ()

  const { signIn } = UserAuth();


=======
<<<<<<< Updated upstream:src/Login.js
=======
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  const { signIn } = UserAuth();

>>>>>>> 84f274f (web important changes):src/Login.js
  const [email, setEmail] = useState("");

  const [password, setPassword] = useState("");

  async function handleSubmit(e) {
<<<<<<< HEAD:src/auth/Login.js

    e.preventDefault();
    setError('')
    try {
      await signIn(email, password)
      navigate('/dashboard')
    } catch (e) {
      setError(e.message)
      console.log(e.message)
    }
  };



=======
    e.preventDefault();
    setError("");
    try {
      await signIn(email, password);
      navigate("/dashboard");
    } catch (e) {
      setError(e.message);
      console.log(e.message);
    }
  }

>>>>>>> Stashed changes:src/auth/Login.js
>>>>>>> 84f274f (web important changes):src/Login.js
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
<<<<<<< HEAD:src/auth/Login.js
                value={email} onChange={(e) => setEmail(e.target.value)}
                required
=======
<<<<<<< Updated upstream:src/Login.js
=======
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
>>>>>>> Stashed changes:src/auth/Login.js
>>>>>>> 84f274f (web important changes):src/Login.js
              />
              <MDBInput
                wrapperClass="mb-4 w-100"
                placeholder="Password"
                id="formControlLg"
                type="password"
                size="lg"
<<<<<<< HEAD:src/auth/Login.js
                value={password} onChange={(e) => setPassword(e.target.value)}
              required
=======
<<<<<<< Updated upstream:src/Login.js
=======
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
>>>>>>> Stashed changes:src/auth/Login.js
>>>>>>> 84f274f (web important changes):src/Login.js
              />

              <MDBCheckbox
                name="flexCheck"
                id="flexCheckDefault"
                className="mb-4"
                label="Remember password"
              />
              <br></br>
<<<<<<< HEAD:src/auth/Login.js
           {/*    <MDBBtn onClick={Login} size="lg">handle user profile</MDBBtn> */}
             <MDBBtn disabled={loading}  onClick={handleSubmit} size="lg">Login</MDBBtn>
=======
<<<<<<< Updated upstream:src/Login.js

              <MDBBtn size="lg">Login</MDBBtn>
=======
              {/*    <MDBBtn onClick={Login} size="lg">handle user profile</MDBBtn> */}
              <button
                disabled={loading}
                onClick={handleSubmit}
                size="lg"
                class="btn btn-primary"
              >
                Login
              </button>
>>>>>>> Stashed changes:src/auth/Login.js
>>>>>>> 84f274f (web important changes):src/Login.js

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
