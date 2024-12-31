import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
 // vite: {
 //   // Vite config options
 // },
  base: '/kuliah_5_justdoit/',
  //outDir: '../../../docs/',

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
        ]
      },
      {
        text: 'Bab 1 Instalasi dan Konfigurasi',
        collapsed:true,
        items: [
          { text: 'Install Flutter', link: '/instalasi-dan-konfigurasi/install-flutter' },
          { text: 'Install Android SDK', link: '/instalasi-dan-konfigurasi/install-android-sdk' },
          { text: 'Setup Environment', link: '/instalasi-dan-konfigurasi/setup-env' },
          { text: 'Cek Instalasi Flutter', link: '/instalasi-dan-konfigurasi/cek-flutter' },
          { text: 'Konfigurasi Neovim', link: '/instalasi-dan-konfigurasi/setup-nvim' },
        ]
      },
      {
        text: 'Bab 2 Pocketbase',
        collapsed:true,
        items: [
          { text: 'Instalasi', link: '/pocketbase/install-pocketbase' },
        ]
      }
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
