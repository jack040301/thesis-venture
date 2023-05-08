import React, { useState, useEffect } from "react";
import { Link, NavLink } from "react-router-dom";

import { collection, db, onSnapshot, query, where} from "../firebase";

export default function Dashboard({ user, setAuthState, setUser }) {
  /*   const signOutHandler = () => {
    signOut(auth)
      .then(() => {
        setUser(null);
        setAuthState("login");
      })
      .catch((err) => console.log(err));
  }; */

  const [countUser, setCountUser] = useState("");
  const [countModerator, setCountModerator] = useState("");
  const [countReqApprove, setCountReqApprove] = useState("");
  const [countReqProcess, setCountReqProcess] = useState("");




  useEffect(() => {
    const collect = collection(db, "users");
    const markersRequest = collection(db,"markers")
    const moderator = query(collect,where("role","==","admin"))
    const approveReq = query(markersRequest,where("request_status","==",true))
    const Reqprocess = query(markersRequest,where("request_status","==",false))

    const unsub = onSnapshot(collect, (snapshot) => {
      const markreal = snapshot.docs.map((doc) => ({
        ...doc.data(),
      }));

    


      //  console.log(markreal)
      //  alert(markreal.length)
      setCountUser(markreal.length);
      //setData(markreal)
    });

    const unsubscribe = onSnapshot(moderator,(snapshot)=>{
          const moderator = snapshot.docs.map((doc)=> ({

            ...doc.data(),

          }))

          setCountModerator(moderator.length);
      });


      const unsubRequestApprove = onSnapshot(approveReq,(snapshot)=>{
        const approve = snapshot.docs.map((doc)=> ({

          ...doc.data(),

        }))

        setCountReqApprove(approve.length);
    });


    const unsubRequestProcess = onSnapshot(Reqprocess,(snapshot)=>{
      const processrequ = snapshot.docs.map((doc)=> ({

        ...doc.data(),

      }))

      setCountReqProcess(processrequ.length);
  });



    return () => {
      unsub();
      unsubRequestApprove();
      unsubRequestProcess();
      unsubscribe();
    };

    //const collectionRef = db.collection('users');
    // const collectionRef = collection(db,"users")
    //const snapshot =  collectionRef.count().get();
    //  console.log(snapshot.data().count);

    // alert(snapshot.data().count)
    /* const unsub = onSnapshot(collect, snapshot =>{

      const markreal = snapshot.docs.da. 
    //  console.log(markreal)

     setData(markreal)

    })

    return () =>{
        unsub()
    } */
  }, []);

  return (
    <div>
      <div className="content-wrapper">
        <div className="content-header">
          <div className="container-fluid"></div>
        </div>
        <section className="content">
          <div className="container-fluid">
            <div className="row">
              <div className="col-lg-3 col-6">
                <div className="small-box bg-info">
                  <div className="inner">
                    <h3>{countUser}</h3>
                    <p>Total Users</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-users" />
                  </div>
                  <NavLink to="/manageusers" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </NavLink>
                </div>
              </div>
              <div className="col-lg-3 col-6">
                <div className="small-box bg-success">
                  <div className="inner">
                    <h3>
                    {countModerator}<sup style={{ fontSize: 20 }}></sup>
                    </h3>
                    <p>Total Moderators</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-user" />
                  </div>
                  <NavLink to="/managemoderator" className="small-box-footer">

              
                    More info <i className="fas fa-arrow-circle-right" />
           
                  </NavLink>

                </div>
              </div>
              <div className="col-lg-3 col-6">
                <div className="small-box bg-warning">
                  <div className="inner">
                    <h3>{countReqApprove}</h3>
                    <p>Approved Requests</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-building" />
                  </div>
                  <NavLink to="/managerequest" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </NavLink>
                </div>
              </div>

              <div className="col-lg-3 col-6">
                <div className="small-box bg-primary">
                  <div className="inner">
                    <h3> {countReqProcess}</h3>
                    <p>On Waiting Requests</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-building" />
                  </div>
                  <NavLink to="/managerequest" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </NavLink>

                </div>
              </div>

            </div>
            
          </div>
        </section>
      </div>
    </div>
  );
}
