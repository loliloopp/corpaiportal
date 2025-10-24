import { useAuthStore } from '@/features/auth';
import { Navigate, Outlet } from 'react-router-dom';
import { Spin } from 'antd';

export const ProtectedRoute = () => {
  const { session, loading } = useAuthStore();

  if (loading) {
    return <Spin fullscreen />;
  }

  return session ? <Outlet /> : <Navigate to="/login" replace />;
};
