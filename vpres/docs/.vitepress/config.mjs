import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  // vite: {
  //   // Vite config options
  // },
  base: '/kuliah_5_justdoit/',
  outDir: '../../docs/', // rootnya adalah directory docs yang didalamnya ada isi .vitepress

  title: "MWSP / EXPLORASI",
  description: "Mobile and Web Service Praktik",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Explorasi', link: '/overview' }
    ],

    search: {
      provider: 'local'
    },

    sidebar: [
      {
        text: 'Pendahuluan',
        items: [
          { text: 'Overview', link: '/overview' },
          { text: 'Desain Figma', link: '/figma' },
          { text: 'Demo dan Penjelasan Aplikasi', link: '/demo' },
        ]
      },
      {
        text: 'Bab 1 Instalasi dan Konfigurasi',
        collapsed: true,
        items: [
          { text: 'Install Flutter', link: '/installation-configuration/flutter-installation' },
          { text: 'Install Android SDK', link: '/installation-configuration/android-sdk-installation' },
          { text: 'Setup Environment', link: '/installation-configuration/setup-env' },
          { text: 'Cek Instalasi Flutter', link: '/installation-configuration/check-flutter-installation' },
          { text: 'Konfigurasi Neovim', link: '/installation-configuration/setup-nvim' },
        ]
      },
      {
        text: 'Bab 2 Pocketbase',
        collapsed: true,
        items: [
          { text: 'Instalasi', link: '/pocketbase/pocketbase-installation' },
        ]
      },
      {
        text: 'Bab 3 Arsitektur dan Struktur Flutter',
        collapsed: true,
        items: [
          { text: 'Arsitektur', link: '/flutter-architecture-and-structure/architecture.md' },
          { text: 'Arsitektur : Data', link: '/flutter-architecture-and-structure/repository-layer.md' },
          { text: 'Arsitektur : Domain', link: '/flutter-architecture-and-structure/domain-layer.md' },
          { text: 'Arsitektur : Application', link: '/flutter-architecture-and-structure/application-layer.md' },
          { text: 'Arsitektur : Presentation', link: '/flutter-architecture-and-structure/presentation-layer.md' },
          { text: 'Struktur', link: '/flutter-architecture-and-structure/structure' },
        ]
      },
      {
        text: 'Bab 2 Pocketbase Lanjutan',
        collapsed: true,
        items: [
          { text: 'Overview', link: '/pocketbase-advance/overview' },
          { text: 'Generated Web APIs', link: '/pocketbase-advance/generated-web-apis' },
        ]
      },
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/vuejs/vitepress' }
    ],
    footer: {
      message: 'Made with blood🩸 and tears😢 ',
      copyright: 'Copyright © 2024-present Rizkia Adhy Syahputra'
    }
  }
})
