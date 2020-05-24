// npm  i -g esm json-stringify-safe
// node -r esm esmTest.js 
// node esmTest

import path from 'path';
const stringify = require('json-stringify-safe');

console.log(process.cwd());
console.log("_preload_modules", process._preload_modules);
console.log("Hello world node -r ESM", process.node);
var g = stringify(global);

console.log("global", JSON.parse(g));
console.log("exports", exports);
