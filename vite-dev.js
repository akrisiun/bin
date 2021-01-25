#!/usr/bin/env node

// vite dev server with koa rollup
const { createServer } = require('vite')
const { build } = require('vite')
const { env, argv } = process;

// args
// require('optimist').usage('vite-dev [serve || build]');
var args = argv.slice(2);
const cmd = args[0] || "";
console.log("cmd=", cmd, "args", args);

// vite Koa proxy
// vite-play : https://developer.aliyun.com/mirror/npm/package/vite-play#production-build

const viteProxy = ({
  root, // project root directory, absolute path
  app, // Koa app instance
  server, // raw http server instance
  watcher // chokidar file watcher instance
}) => {
  app.use(async (ctx, next) => {
    // You can do pre-processing here - this will be the raw incoming requests
    // before vite touches it.
    if (ctx.path.endsWith('.scss')) {
      // Note vue <style lang="xxx"> are supported by
      // default as long as the corresponding pre-processor is installed, so this
      // only applies to <link ref="stylesheet" href="*.scss"> or js imports like
      // `import '*.scss'`.
      console.log('pre processing: ', ctx.url)
      ctx.type = 'css'
      ctx.body = 'body { border: 1px solid red }'
    }

    // ...wait for vite to do built-in transforms
    await next()

    // Post processing before the content is served. Note this includes parts
    // compiled from `*.vue` files, where <template> and <script> are served as
    // `application/javascript` and <style> are served as `text/css`.
    if (ctx.response.is('js')) {
      console.log('post processing: ', ctx.url)
      console.log(ctx.body) // can be string or Readable stream
    }
  })
}

if (cmd === "build" || cmd === "b") {
    // Check out the full options interface in build/index.ts.
    ;(async () => {
    // All options are optional.
    // check out `src/node/build.ts` for full options interface.
    const result = await build({
        rollupInputOptions: {
        // https://rollupjs.org/guide/en/#big-list-of-options
        },
        rollupOutputOptions: {
        // https://rollupjs.org/guide/en/#big-list-of-options
        },
        rollupPluginVueOptions: {
        // https://github.com/vuejs/rollup-plugin-vue/tree/next#options
        }
        // ...
    })
    })();
} else {

    // server 
    const port = env.PORT || 3000;
    const serv = createServer({
        plugins: [
           viteProxy
        ], 
        base: "/",
        outDir: "dist2"
    }).then((opt) => {
       
       console.log("port", port, "outDir", opt.config.outDir, "vite.config", opt.config.env);
       opt.listen(port);
    });
    // .listen(env.PORT || 3000)
}
