/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'brand': {
          DEFAULT: '#8b5cf6', // Violet
          dark: '#6d28d9',
          light: '#c4b5fd'
        },
        'status': {
          todo: '#94a3b8',
          progress: '#3b82f6',
          review: '#f59e0b',
          done: '#10b981'
        }
      }
    },
  },
  plugins: [],
}
