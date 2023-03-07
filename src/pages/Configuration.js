 import React, { useRef, useState } from "react";


import {
  MDBBtn,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBInput,
  MDBValidation,
  MDBValidationItem
} from "mdb-react-ui-kit";

function Config() {
  const [formValue, setFormValue] = useState({
    email: "",
    password: "",
    confirmpass: "",
    
  });

//  const { createUser, user } = UserAuth();


  /* async function handleSubmit(e) {

    e.preventDefault();
    setError('')
    try {
    if(password === confirmpass){  
      await createUser(email, password).then(() =>
    {
      addDoc(collection(db, "users"), {
        uid: user.uid,
        authProvider: "local",
        email,
        role:'admin',
      });

    }).catch((err)=>{
      setError(err.message)
    })

      e.target.reset();
    }else{
      setError('password and confirm password not matched')
    }

    } catch (e) {
      setError(e.message)
      console.log(e.message)
    }
  }; */


  const onChange = (e) => {
    setFormValue({ ...formValue, [e.target.name]: e.target.value });
  };

  return (
    <>
      <div className="content-wrapper">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-header">
                <h3 className="card-title">Configuration</h3>
                <div className="card-tools">
                  <div
                    className="input-group input-group-sm"
                    style={{ width: 300 }}
                  >
                    <input
                      type="text"
                      name="table_search"
                      className="form-control float-right"
                      placeholder="Search"
                    />
                    <div className="input-group-append">
                      <button type="submit" className="btn btn-default">
                        <i className="fas fa-search" />
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <MDBContainer fluid className='row g-3'>
      
                <div className="d-flex align-items-center justify-content-center">
                  <MDBCol lg="4" md="6" className="mb-4">
                    <img
                      src="https://p.kindpng.com/picc/s/568-5680678_bandori-bangdream-mocaaoba-aobamoca-anime-icon-.png"
                      className="img-fluid rounded-circle"
                      alt=""
                    />
                  </MDBCol>
                </div>
                <MDBRow
                  tag="form"
                  className="d-flex justify-content-center align-items-center h-100"
                >
                  <MDBCol md="4">
                
                    <MDBInput
                      value={formValue.email}
                      name="email"
                      onChange={onChange}
                      id="validationCustom01"
                      required
                      type="email"
                      label="Email"
                    />
                   
                  </MDBCol>
                  <MDBCol md="4">
                
                    <MDBInput
                      value={formValue.password}
                      name="password"
                      onChange={onChange}
                      id="validationCustom02"
                      required
                      type="password"
                      label="Password"
                    />
                   
                  </MDBCol>

                  <MDBCol md="6">
                
                    <MDBInput
                      value={formValue.confirmpass}
                      name="confirmpass"
                      onChange={onChange}
                      id="validationCustom03"
                      required
                      type="password"
                      label="Confirm Password"
                    />
                   
                  </MDBCol>

                  <MDBCol md="2" size="12">
                    <MDBBtn type="submit" >Save Changes</MDBBtn>
                  </MDBCol>
                </MDBRow>
              
              </MDBContainer>
            
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Config;
 