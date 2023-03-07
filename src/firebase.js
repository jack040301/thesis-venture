// Import the functions you need from the SDKs you need

import { initializeApp } from "firebase/app";


import {getAuth,
createUserWithEmailAndPassword, signInWithEmailAndPassword, sendPasswordResetEmail, signOut} from 'firebase/auth'

import {getFirestore,  query, GeoPoint,
  collection,
  where,
onSnapshot,
  doc,
  getDocs,
  updateDoc,
  deleteDoc,
  addDoc,} from 'firebase/firestore'

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
/* const firebaseConfig = {
  apiKey: process.env.REACT_APP_FIREBASE_API_KEY,
  authDomain: process.env.REACT_APP_FIREBASE_AUTH_DOMAIN,
  projectId: process.env.REACT_APP_FIREBASE_PROJECT_ID,
  storageBucket: process.env.REACT_APP_FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.REACT_APP_FIREBASE_SENDER_ID,
  appId: process.env.REACT_APP_FIREBASE_APP_ID 
}; */

const firebaseConfig = {
  apiKey: "AIzaSyBMe8TM-W8OCDGow_lrZpgsoWt4EJgwNpM",
  authDomain: "venture-1495b.firebaseapp.com",
  projectId: "venture-1495b",
  storageBucket: "venture-1495b.appspot.com",
  messagingSenderId: "798395571180",
  appId: "1:798395571180:web:07427bdf263ef77f71bec9"
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


/* export const GoogleProvider = new firebase.auth.GoogleAuthProvider();
GoogleProvider.setCustomParameters({ prompt: 'select_account' }); */

const handleUserProfile = async ({ userAuth, additionalData }) => {
  if (!userAuth) return;
  const { uid } = userAuth;

  const userRef = db.doc(`users/${uid}`);
  const snapshot = await userRef.get();

  if (!snapshot.exists) {
    const { email } = userAuth;
    const timestamp = new Date();
    const userRoles = ['admin'];

    try {
      await userRef.set({
        email,
        createdDate: timestamp,
        userRoles,
        ...additionalData
      });

      console.log("created");
    } catch(err) {
      // console.log(err);
    }
  }

  return userRef;
};

export const getCurrentUser = () => {
  return new Promise((resolve, reject) => {
    const unsubscribe = auth.onAuthStateChanged(userAuth => {
      unsubscribe();
      resolve(userAuth);
    }, reject);
  })
}


export const addInFirestore = () => {

}







/* seEffect(() => {
  const q = query(collection(db, "testmarkers"));
  const unsubscribe = onSnapshot(q, (querySnapshot) => {
  
    querySnapshot.forEach((doc) => {
      dataset.push({
        ...doc.data(),
        key: doc.id,
        lat: doc.data().coords.latitude,
        long : doc.data().coords.longitude
      });
      
      //setData(dataset);

      for (var i = 0; i < dataset.length; i++){
        // look for the entry with a matching `code` value
           // we found it
          // obj[i].name is the matched result
       marks.push({lat:doc.data().coords.latitude,lng:doc.data().coords.longitude})
                                                                                                                                                                                                                                                                                                                                                                                                                                          

      }


      });
  
      return () => unsubscribe();
        
  });

}, [] );
 */


export {auth,doc,query,getDocs,onSnapshot,updateDoc,deleteDoc,GeoPoint,addDoc,collection, db, registerWithEmailAndPassword,  logout, sendPasswordReset, handleUserProfile, createUserWithEmailAndPassword}
