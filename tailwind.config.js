const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/views/**/*.html.haml',
    './app/components/**/*.{html.haml,rb,js}',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './spec/components/previews/**/*.{html.haml,rb}'
  ],
  plugins: [require('daisyui')],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Nunito', ...defaultTheme.fontFamily.sans]
      }
    }
  },
  daisyui: {
    themes: ['winter']
  }
}
