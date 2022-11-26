import React, {Fragment} from "react";
import Login from "./auth/Login";
/* import Home from "./Home"; */


import { auth } from './firebase';
import { onAuthStateChanged } from 'firebase/auth'
import Dashboard from "./pages/Dashboard";

function App() {
  const [user, setUser] = React.useState(null);
  const [authState, setAuthState] = React.useState(null)

  React.useEffect(() => {
    const unSubscribeAuth = onAuthStateChanged(auth,
      async authenticatedUser => {
        if(authenticatedUser) {
          setUser(authenticatedUser.email)
          setAuthState('home');
        } else {
          setUser(null);
          setAuthState('login')
        }
      })

      return unSubscribeAuth;
  }, [user])

  if(authState === null) return <div className='font-bold text-center text-5xl'>loading...</div>
  if(authState === 'login') return <Login setAuthState={setAuthState} setUser={setUser}/>
  if(user) return <Dashboard user={user} setAuthState={setAuthState} setUser={setUser}/>
}


export default App;