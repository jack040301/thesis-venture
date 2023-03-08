import React, { useEffect, useRef, useState } from "react";
import {addDoc,auth,collection,db} from "../firebase";
import { UserAuth } from "../auth/context";
import { updatePassword, reauthenticateWithCredential} from "../firebase";

import { EmailAuthCredential } from "firebase/auth";

import {

  MDBRow,
  MDBCol,
  MDBInput,

} from "mdb-react-ui-kit";
import { EmailAuthProvider } from "firebase/auth";

function Config() {
      
  const [formValue, setFormValue] = useState({
    oldpassword: "",   
    password: "",
    confirmpass: "",
  });

  const [configemail, setConfigEmail] = useState("")
  const [error, setError] = useState("")

const { createUser, user } = UserAuth();

  function resetall(){

    setFormValue({
      oldpassword:"",
      password: "",
      confirmpass: "",
    })
  }

  var emal = user.email;
  


  /* async function handleSubmit(e) {

    e.preventDefault();
    setError('')
    try {
    if(formValue.password === formValue.confirmpass){  
      await createUser(formValue.email, formValue.password).then(() =>
    {
      addDoc(collection(db, "users"), {
        uid: user.uid,
        authProvider: "local",
        email: formValue.email,
        role:'admin',
      });

      alert('Successfull create admin')

      resetall()
    }).catch((err)=>{
      setError(err.message)

      alert(err.message)
    })

    resetall();
    
    }else{

      alert('password and confirm password not matched')
      setError('password and confirm password not matched')
    }

    } catch (e) {
      setError(e.message)
      alert(e.message)
      resetall()

     // console.log(e.message)
    }
  };  */


  async function handleSubmit(e) {



    e.preventDefault();
    setError('')
    try {

      if(formValue.oldpassword !== null &&
        formValue.oldpassword !== ""&&
        formValue.password !== null &&
        formValue.password !== ""&&
        formValue.confirmpass !== null &&
        formValue.confirmpass !== ""){
    if(formValue.password === formValue.confirmpass){  

      const emailCred = EmailAuthProvider.credential(user.email,formValue.oldpassword)


reauthenticateWithCredential(user, emailCred).then(() => {
  
  updatePassword(user, formValue.password).then(()=>{

    alert('Successfull Update Password')  
    resetall()
    
  }).catch((e)=>{

    alert('Error Updating Password : ' , e)  
    resetall()

  }) 
 
  
}).catch((error) => {

  alert('reauthenticating failed')
});

   
    
    }else{

      alert('password and confirm password not matched')
      setError('password and confirm password not matched')
    }

    alert('Do not leave the fields blank')
  
  }

    } catch (e) {
      setError(e.message)
      alert(e.message)
      resetall()

     // console.log(e.message)
    }
  }; 
  

  const onChange = (e) => {
    setConfigEmail(user.email)
    setFormValue({ ...formValue, [e.target.name]: e.target.value });
  };

  return (
    <>
      <div className="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card" style={{ height: 500 }}>
            <div className="card-header">
              <h3 className="card-title"> Account Configuration</h3>
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
                  <MDBCol md="8">
                    <MDBInput
                      value={emal}
                      name="email"
                      
                      id="validationCustom01"
                      required
                      type="email"
                      disabled
                      /* label="Email" */
                      placeholder="Email"
                      style={{ marginBottom: 10}}
                    />
                  </MDBCol>

                  <MDBCol md="8">
                    <input
                      value={formValue.oldpassword}
                      name="oldpassword"
                      onChange={onChange}
                      id="validationCustom01"
                      required
                      type="password"
                      /*  label="Password" */
                      placeholder="Current Password"
                      class="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol>

                  <MDBCol md="8">
                    <input
                      value={formValue.password}
                      name="password"
                      onChange={onChange}
                      id="validationCustom02"
                      required
                      type="password"
                      /*  label="Password" */
                      placeholder="New Password"
                      class="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol>

                  <MDBCol md="8">
                    <input
                      value={formValue.confirmpass}
                      name="confirmpass"
                      onChange={onChange}
                      id="validationCustom03"
                      required
                      type="password"
                      /*  label="Confirm Password" */
                      placeholder="Confirm Password"
                      class="form-control"
                      style={{ marginBottom: 10 }}
                    />
                  </MDBCol>

                  <MDBCol md="8">
                    <button type="submit" onClick={handleSubmit} className="btn btn-primary">
                      Save Changes
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
