import React, {useContext} from 'react'
import {UserContext} from "./context"
import {Outlet, Navigate} from "react-router-dom"
import Dashboard from '../pages/Dashboard'

export default function Private() {

  const {currentUser} = useContext(UserContext)
  //console.log("PRIVATE", currentUser);

  if(!currentUser) {
    return <Navigate to="/" />
  }

  return (
    <div className="container">
    
      <Outlet />
    </div>
  )
}