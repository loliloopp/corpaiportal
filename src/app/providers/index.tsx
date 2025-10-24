import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { ThemeProvider } from './theme-provider';
import { StoreInitializer } from './store-initializer';

export const AppProvider = ({ children }: { children: React.ReactNode }) => {
  return (
    <React.StrictMode>
      <BrowserRouter>
        <ThemeProvider>
          <StoreInitializer />
          {children}
        </ThemeProvider>
      </BrowserRouter>
    </React.StrictMode>
  );
};
