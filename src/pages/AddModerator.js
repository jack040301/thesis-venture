import React, { useRef, useState } from "react";
import { db, setDoc, createUserWithEmailAndPassword, doc,auth } from "../firebase";

import { MDBRow, MDBCol } from "mdb-react-ui-kit";


import ReactToast from "../components/Toast/toast"; /* import Component of toast */


//const navigate  = useNavigate ();
//const [email, setEmail] = useState("");

//const [password, setPassword] = useState("");
//const [rPassword, setRetypePassword] = useState("");

function Config() {
  const toastRef = useRef();

 
 /*  const [formMod, setformMod] = useState({
    modEmail: "",
    password: "",
    confirmpass: "",
  }); */

  const [formValuetwo, setFormValuetwo] = useState({
  
    password: "",
    confirmpass: "",
  });


const [emailtwo, setEmailtwo] = useState("");


  const [error, setError] = useState("");


 
  function resetallMod() {
    setFormValuetwo({
      emailtwo: "",
      password: "",
      confirmpass: "",
    });
  }

  async function AddModerator(e) {
    e.preventDefault();
    setError("");
    try {
      if (formValuetwo.password === formValuetwo.confirmpass) {

        await createUserWithEmailAndPassword(auth,emailtwo, formValuetwo.password)
          .then((userCredential) => {

            const usersinfo = userCredential;
             setDoc(doc(db, "users",usersinfo.user.uid), {
              uid: usersinfo.user.uid,
              authProvider: "local",
              email: emailtwo,
              role: "admin",
            });

          //  alert("Successfull create admin");

          toastRef.current.showToast("Successfully Created Admin");
          resetallMod();
          })
          .catch((err) => {
            setError(err.message);

            
            console.log(err)
            toastRef.current.showToast(err.message);

          resetallMod();

//            alert(err.message);
          });

        resetallMod();
      } else {
        toastRef.current.showToast("password and confirm password not matched");

        //alert("password and confirm password not matched");
        setError("password and confirm password not matched");
      }
    } catch (e) {
      setError(e.message);
      toastRef.current.showToast(e.message);

//      alert(e.message);
resetallMod();

      // console.log(e.message)
    }
  }

  const onChange = (e) => {
    setFormValuetwo({ ...formValuetwo, [e.target.name]: e.target.value });
  };



  return (
    <>
      <ReactToast ref={toastRef} timeout={2000} />

      <div className="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card" style={{ height: 500 }}>
              <div className="card-header">
                <h3 className="card-title"> Add Moderator Account</h3>
                <div className="card-tools">
                  <div
                    className="input-group input-group-sm"
                    style={{ width: 300 }}
                  >
                    {/* <input
                      type="text"
                      name="table_search"
                      className="form-control float-right"
                      placeholder="Search"
                    />
                    <div className="input-group-append">
                      <button type="submit" className="btn btn-default">
                        <i className="fas fa-search" />
                      </button>
                    </div> */}
                  </div>
                </div>
              </div>
              {/* </div> */}
              <div fluid className="row lg-3">
                <div className="d-flex align-items-center justify-content-center">
                  {/*  <MDBCol md="8" className="mb-4">
                    <img
                      src="https://p.kindpng.com/picc/s/568-5680678_bandori-bangdream-mocaaoba-aobamoca-anime-icon-.png"
                      className="img-fluid rounded-circle"
                      alt=""
                    />
                  </MDBCol> */}
                </div>
                <MDBRow
                  tag="form"
                  className="d-flex justify-content-center align-items-center h-100"
                >
                  {/*  <MDBCol md="8">
                    <MDBInput
                      value={emal}
                      name="email"
                      id="validationCustom01"
                      required
                      type="email"
                      disabled
                      
                      placeholder="Email"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol> */}

                  {/*  <MDBCol md="8">
                    <input
                      value={formValue.oldpassword}
                      name="oldpassword"
                      onChange={onChange}
                      id="validationCustom01"
                      required
                      type="password"
                     
                      placeholder="Current Password"
                      class="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol> */}

                  {/* <MDBCol md="8">
                    <input
                      value={formValue.password}
                      name="password"
                      onChange={onChange}
                      id="validationCustom02"
                      required
                      type="password"
                      
                      placeholder="New Password"
                      class="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol> */}

                  {/*  <MDBCol md="8">
                    <input
                      value={formValue.confirmpass}
                      name="confirmpass"
                      onChange={onChange}
                      id="validationCustom03"
                      required
                      type="password"
                      
                      placeholder="Confirm Password"
                      class="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol> */}

                  {/* <MDBCol md="8">
                    <button
                      type="submit"
                      onClick={handleSubmit}
                      className="btn btn-primary"
                    >
                      Save Changes
                    </button>
                  </MDBCol> */}
                  {/*  <MDBCol md="8">
                    <h3 className="card-title"> Moderator</h3>
                  </MDBCol> */}

                  <MDBCol md="8">
                    <input
                      value={emailtwo}
                      name="email"
                      onChange={(e) => setEmailtwo(e.target.value)}
                      id="validationCustom012"
                      required
                      type="email"
                      /*  label="Password" */
                      placeholder="Email"
                      className="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol>

                  <MDBCol md="8">

                  <input
                      value={formValuetwo.password}
                      name="password"
                      onChange={onChange}
                      id="validationCustom02"
                      required
                      type="password"
                      /*  label="Password" */
                      placeholder="New Password"
                      className="form-control"
                      style={{ marginBottom: 10 }}
                    />

                  {/*   <input
                      value={formMod.modPass}
                      name="password"
                      onChange={onChangeMod}
                      id="validationCustom08"
                      required
                      type="password"
                      placeholder="Password"
                      class="form-control"
                      style={{ marginBottom: 10 }}
                    /> */}
                  </MDBCol>

                  <MDBCol md="8">
                    <input
                      value={formValuetwo.confirmpass}
                      name="confirmpass"
                      onChange={onChange}
                      id="validationCustom09"
                      required
                      type="password"
                      /*  label="Confirm Password" */
                      placeholder="Confirm Password"
                      className="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol>

                  <MDBCol md="8">
                    <button
                      type="submit"
                      onClick={AddModerator}
                      className="btn btn-primary"
                    >
                      Add moderator account
                    </button>
                  </MDBCol>
                </MDBRow>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Config;
