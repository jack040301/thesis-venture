import React, { createContext, useRef, useState } from "react";
import { UserAuth } from './context';
import { getAuth } from "firebase/auth";
import { doc, getDoc, db } from "../firebase";
import './mod.css';

export const Moderator = ({children, userId}) => {
    const auth = getAuth();
    const user = auth.currentUser;
    const {logout} = UserAuth();
    const [modId, setModId] = useState();


    if(user){
        console.log('User is logged in');
        console.log('UID: ', user.uid);
        getdata(user.uid);
    }else{
        console.log('User is logged out');
    }

    async function getdata(userid) {
        const docRef = doc(db, "users", userid);
        const docSnap = await getDoc(docRef);
    
        if (docSnap.exists() && docSnap.data().role === "admin") {                      
            console.log("The user is admin");
            setModId('admin');
        }else if(docSnap.exists() && docSnap.data().role === "moderator"){
            console.log("The user is Moderator");
            setModId('mod01');
        } else {
          console.log('not admin or moderator');
          logout();
        }
      }

    return(
        <li className="nav-item" id={modId}>
            {children}
        </li>
    );
}