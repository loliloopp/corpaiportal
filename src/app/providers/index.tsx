import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { ThemeProvider } from './theme-provider';

export const AppProvider = ({ children }: { children: React.ReactNode }) => {
  return (
    <React.StrictMode>
      <BrowserRouter>
        <ThemeProvider>{children}</ThemeProvider>
      </BrowserRouter>
    </React.StrictMode>
  );
};
