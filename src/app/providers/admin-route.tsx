import { Navigate, Outlet } from 'react-router-dom';
import { useAuthStore } from '@/features/auth';
import { Spin } from 'antd';

export const AdminRoute = () => {
  const { profile, loading, isProfileLoading } = useAuthStore();

  if (loading || isProfileLoading) {
    return <Spin fullscreen />;
  }

  if (profile?.role !== 'admin') {
    return <Navigate to="/chat" replace />;
  }

  return <Outlet />;
};
