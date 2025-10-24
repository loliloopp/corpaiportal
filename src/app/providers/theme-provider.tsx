import { ConfigProvider, theme as antTheme } from 'antd';
import React, { createContext, useContext, useState, useEffect } from 'react';

type ThemeMode = 'light' | 'dark';

interface ThemeContextType {
  theme: ThemeMode;
  setTheme: (theme: ThemeMode) => void;
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export const useThemeContext = () => {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error('useThemeContext must be used within ThemeProvider');
  }
  return context;
};

export const ThemeProvider = ({ children }: { children: React.ReactNode }) => {
  const [theme, setThemeState] = useState<ThemeMode>(() => {
    const stored = localStorage.getItem('app-theme');
    return (stored as ThemeMode) || 'light';
  });

  useEffect(() => {
    localStorage.setItem('app-theme', theme);
    document.documentElement.setAttribute('data-theme', theme);
  }, [theme]);

  const setTheme = (newTheme: ThemeMode) => {
    setThemeState(newTheme);
  };

  const isDark = theme === 'dark';

  const themeConfig = {
    algorithm: antTheme.defaultAlgorithm,
    token: {
      colorPrimary: isDark ? '#b0b0b0' : '#262626',
      colorInfo: isDark ? '#b0b0b0' : '#262626',
      colorSuccess: isDark ? '#6b9d6b' : '#52c41a',
      colorWarning: isDark ? '#d4a849' : '#faad14',
      colorError: isDark ? '#d46b6b' : '#ff4d4f',
      colorBgBase: isDark ? '#363535' : '#ffffff',
      colorBg: isDark ? '#363535' : '#ffffff',
      colorBgContainer: isDark ? '#363535' : '#ffffff',
      colorBgElevated: isDark ? '#4a4a4a' : '#ffffff',
      colorBgLayout: isDark ? '#363535' : '#ffffff',
      colorBgSpotlight: isDark ? '#4a4a4a' : '#ffffff',
      colorTextBase: isDark ? '#e8e8e8' : '#171717',
      colorText: isDark ? '#e8e8e8' : '#171717',
      colorTextSecondary: isDark ? '#b8b8b8' : '#666666',
      colorTextTertiary: isDark ? '#a0a0a0' : '#999999',
      colorTextQuaternary: isDark ? '#888888' : '#c0c0c0',
      colorIcon: isDark ? '#e8e8e8' : '#171717',
      colorIconHover: isDark ? '#f0f0f0' : '#262626',
      borderRadius: 6,
      colorBorder: isDark ? '#555555' : '#e5e5e5',
      colorBorderSecondary: isDark ? '#555555' : '#e5e5e5',
      colorSplit: isDark ? '#555555' : '#e5e5e5',
      colorFill: isDark ? '#4a4a4a' : '#f5f5f5',
      colorFillSecondary: isDark ? '#454545' : '#fafafa',
      colorFillTertiary: isDark ? '#404040' : '#f0f0f0',
      colorFillQuaternary: isDark ? '#363535' : '#ffffff',
    },
    components: {
      Layout: {
        headerBg: isDark ? '#363535' : '#ffffff',
        siderBg: isDark ? '#363535' : '#ffffff',
        bodyBg: isDark ? '#363535' : '#ffffff',
        triggerBg: isDark ? '#363535' : '#ffffff',
        triggerColor: isDark ? '#e8e8e8' : '#171717',
      },
      Menu: {
        itemBg: 'transparent',
        subMenuItemBg: 'transparent',
        itemSelectedBg: isDark ? '#555555' : 'transparent',
        itemHoverBg: isDark ? '#4a4a4a' : 'transparent',
        itemSelectedColor: isDark ? '#e8e8e8' : '#262626',
        itemColor: isDark ? '#e8e8e8' : '#171717',
        iconSize: 16,
      },
      Button: {
        primaryShadow: 'none',
        defaultShadow: 'none',
        defaultBg: isDark ? '#4a4a4a' : '#ffffff',
        defaultBorderColor: isDark ? '#555555' : '#e5e5e5',
        defaultColor: isDark ? '#e8e8e8' : '#171717',
      },
      Dropdown: {
        controlPaddingHorizontal: 0,
        colorBgElevated: isDark ? '#4a4a4a' : '#ffffff',
      },
      Select: {
        optionSelectedBg: isDark ? '#858585' : '#f0f0f0',
        optionSelectedFontWeight: 400,
        optionLineHeightWithLongText: 1.5,
        optionHoverBg: isDark ? '#858585' : '#f0f0f0',
        selectorBg: isDark ? '#4a4a4a' : '#ffffff',
      },
      Input: {
        colorBgContainer: isDark ? '#4a4a4a' : '#ffffff',
        colorTextPlaceholder: isDark ? '#888888' : '#999999',
        colorText: isDark ? '#e8e8e8' : '#171717',
        colorBorder: isDark ? '#555555' : '#e5e5e5',
      },
      Card: {
        colorBgContainer: isDark ? '#4a4a4a' : '#ffffff',
        colorTextHeading: isDark ? '#e8e8e8' : '#171717',
        colorText: isDark ? '#e8e8e8' : '#171717',
      },
      Switch: {
        colorPrimary: isDark ? '#b0b0b0' : '#262626',
        colorPrimaryHover: isDark ? '#c0c0c0' : '#404040',
      },
      Typography: {
        colorText: isDark ? '#e8e8e8' : '#171717',
        colorTextSecondary: isDark ? '#b8b8b8' : '#666666',
      },
      Avatar: {
        colorTextPlaceholder: isDark ? '#e8e8e8' : '#171717',
        colorBgBase: isDark ? '#4a4a4a' : '#f5f5f5',
      },
      Spin: {
        colorPrimary: isDark ? '#b0b0b0' : '#262626',
      },
      Form: {
        labelColor: isDark ? '#e8e8e8' : '#171717',
      },
    },
  };

  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      <ConfigProvider theme={themeConfig}>
        {children}
      </ConfigProvider>
    </ThemeContext.Provider>
  );
};
