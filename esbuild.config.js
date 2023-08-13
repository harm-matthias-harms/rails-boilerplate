import * as esbuild from 'esbuild'
import path from 'path'

async function buildContext (options) {
  const ctx = await esbuild.context(options)

  if (process.argv.includes('--watch')) {
    await ctx.watch()
  } else {
    await ctx.rebuild()
    await ctx.dispose()
  }
}

const globalOptions = {
  sourcemap: true,
  bundle: true,
  minify: true,
  logLevel: 'debug'
}

buildContext({
  ...globalOptions,
  entryPoints: ['application.js'],
  outdir: path.join(process.cwd(), 'app/assets/builds'),
  absWorkingDir: path.join(process.cwd(), 'app/javascript')
})

buildContext({
  ...globalOptions,
  entryPoints: ['nunito.css', 'fontawesome.css'],
  outdir: path.join(process.cwd(), 'app/assets/builds/fonts'),
  absWorkingDir: path.join(process.cwd(), 'app/assets/fonts'),
  assetNames: '[name]-00000000.digested',
  entryNames: '[name]-00000000.digested',
  loader: {
    '.woff': 'file',
    '.woff2': 'file',
    '.ttf': 'file'
  }
})
