import React, { useState, useEffect } from "react";

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


  useEffect(() => {
    const collect = collection(db, "users");
    const moderator = query(collect,where("role","==","admin"))
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



    return () => {
      unsub();
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
                  <a href="#" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </a>
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
                  <a href="#" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </a>
                </div>
              </div>
              <div className="col-lg-3 col-6">
                <div className="small-box bg-warning">
                  <div className="inner">
                    <h3>44</h3>
                    <p>Requests</p>
                  </div>
                  <div className="icon">
                    <i className="fas fa-building" />
                  </div>
                  <a href="#" className="small-box-footer">
                    More info <i className="fas fa-arrow-circle-right" />
                  </a>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
}
