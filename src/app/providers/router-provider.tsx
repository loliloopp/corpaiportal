import { Route, Routes, Outlet, Navigate } from 'react-router-dom';
import LoginPage from '@/pages/login';
import SignUpPage from '@/pages/signup';
import { ProtectedRoute } from './protected-route';
import { useAuthStore } from '@/features/auth';
import { Spin } from 'antd';
import { MainLayout } from '@/layout/main-layout';
import ChatPage from '@/pages/chat';
import DashboardPage from '@/pages/dashboard';
import AdminPage from '@/pages/admin';
import { AdminRoute } from './admin-route';

const PublicRoutes = () => {
  const { session, loading } = useAuthStore();

  return !session ? <Outlet /> : <Navigate to="/chat" replace />;
};

export const AppRouter = () => {
  return (
    <Routes>
      <Route element={<PublicRoutes />}>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/signup" element={<SignUpPage />} />
      </Route>
      <Route element={<ProtectedRoute />}>
        <Route element={<MainLayout />}>
          <Route path="/" element={<Navigate to="/chat" replace />} />
          <Route path="/chat" element={<ChatPage />} />
          <Route path="/chat/:conversationId" element={<ChatPage />} />
          <Route path="/dashboard" element={<DashboardPage />} />
        </Route>
      </Route>
      <Route element={<AdminRoute />}>
        <Route element={<MainLayout />}>
          <Route path="/admin" element={<AdminPage />} />
        </Route>
      </Route>
    </Routes>
  );
};
