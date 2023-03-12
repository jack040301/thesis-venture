import React from 'react';
import { Navigate } from 'react-router-dom';
import { UserAuth } from './context';

const withCurrentUser = ({ children }) => {
  const { user } = UserAuth();

  if (user) {
    return <Navigate to='/dashboard' />;
  }
  return children;
};

export default withCurrentUser;