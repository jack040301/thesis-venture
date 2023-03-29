import React, { createContext, useContext, useEffect, useState } from 'react';
import {
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
  signOut,
  onAuthStateChanged,
} from 'firebase/auth';
import { auth } from '../firebase';

const UserContext = createContext();
const userType = createContext('mod01');

export const AuthContextProvider = ({ children }) => {
  const [user, setUser] = useState({});

   const createUser = (email, password) => {
  

    
    return createUserWithEmailAndPassword(auth, email, password);
    
  };

   const signIn = (email, password) =>  {

    //const uidAdmin = "1kViopJ11qaXUHNbaq85D0EYG6V2";



    return signInWithEmailAndPassword(auth, email, password)
   }

  const logout = () => {
      return signOut(auth)
  }

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (currentUser) => {
      //console.log(currentUser);
      setUser(currentUser);

      //console.log(currentUser)
    });
    return () => {
      unsubscribe();
    };
  }, []);

  return (
    <UserContext.Provider value={{ createUser, user, logout, signIn }}>
      {children}
    </UserContext.Provider>
  );
};

export const UserAuth = () => {
  return useContext(UserContext);
};



/* export const createModAcc = (email, password) => {
  createUserWithEmailAndPassword(auth, email, password)
  .then((userCredential)=>{
    const user = userCredential.user;

  }).catch((error)=>{
    const errorCode = error.code;
    const errorMessage = error.message;
  });
 }; */
