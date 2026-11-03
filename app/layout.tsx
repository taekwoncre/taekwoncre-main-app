import type { Metadata, Viewport } from 'next';
import './globals.css';
import RegisterSW from './register-sw';
export const metadata: Metadata = { title: '태권크리 본관 운영관리', description: '태권크리 본관 통합 운영관리 시스템', applicationName: '태권크리 본관', manifest: '/manifest.json' };
export const viewport: Viewport = { themeColor: '#101827', width: 'device-width', initialScale: 1 };
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) { return <html lang="ko"><body><RegisterSW />{children}</body></html>; }
