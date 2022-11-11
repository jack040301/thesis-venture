// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";

import { getAnalytics } from "firebase/analytics";
import {getAuth,
createUserWithEmailAndPassword, signInWithEmailAndPassword, sendPasswordResetEmail, signOut} from 'firebase/auth'

import {getFirestore,  query,
  getDocs,
  collection,
  where,
  addDoc,} from 'firebase/firestore'

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: process.env.REACT_APP_FIREBASE_API_KEY,
  authDomain: process.env.REACT_APP_FIREBASE_AUTH_DOMAIN,
  databaseURL: process.env.REACT_APP_FIREBASE_DATABASE_URL,
  projectId: process.env.REACT_APP_FIREBASE_PROJECT_ID,
  storageBucket: process.env.REACT_APP_FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.REACT_APP_FIREBASE_SENDER_ID,
  appId: process.env.REACT_APP_FIREBASE_APP_ID 
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const db = getFirestore(app)


const registerWithEmailAndPassword = async (email, password) => {


  try {
    const res = await createUserWithEmailAndPassword(auth, email, password);
    const user = res.user;
    await addDoc(collection(db, "users"), {
      uid: user.uid,
      authProvider: "local",
      email,
    });
  } catch (err) {
    console.error(err);
    alert(err.message);
  }
};


//do not delete this comment, fixing
/* const logInWithEmailAndPassword = async (email, password) => {
  try {

    const checkUser = db.collection('users').doc('SF');
    const doc = await checkUser.get();
    if (!doc.exists) {
      console.log('No such document!');
    } else {
      await signInWithEmailAndPassword(auth, email, password);
      console.log('Document data:', doc.data());
    }


   
  } catch (err) {
    console.error(err);
    alert(err.message);
  }
}; */

const logInWithEmailAndPassword = async (email, password) => {
  try {
    await signInWithEmailAndPassword(auth, email, password);

    console.log('login')
  } catch (err) {
    console.error(err);
    alert(err.message);
  }

}; 


const sendPasswordReset = async (email) => {
  try {
    await sendPasswordResetEmail(auth, email);
    alert("Password reset link sent!");
  } catch (err) {
    console.error(err);
    alert(err.message);
  }
};

const logout = () => {
  signOut(auth);
  console.log("logout")
};



export {auth, db, registerWithEmailAndPassword, logInWithEmailAndPassword, logout, sendPasswordReset}
