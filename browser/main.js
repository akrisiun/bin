const {app, BrowserWindow} = require('electron');

/* const remote = require('electron').remote;
global.sharedObject = { prop1: app.commandLine.argv }; // process.argv };

if (remote) {
  const args = remote.getGlobal('sharedObject').prop1;

  console.log("args", args);
} */

const opt = {
   width: 1024, height: 768,
   modal: false,
   show : true,
   darkTheme: true,
   webPreferences: {
     nodeIntegration: true,
     webviewTag: true,
     enableRemoteModule: true,
     allowRunningInsecureContent: true,
     disableHtmlFullscreenWindowResize: false
    } 
  };
let mainWindow;

app.on('window-all-closed', function() {
  app.quit();
});

app.on('certificate-error', (ev, webContents, url, error, cert, cb) => {
  ev.preventDefault();
  cb(true);
})

app.on('ready', function() {
  mainWindow = new BrowserWindow(opt);

  if (mainWindow.remote) {
    const console = mainWindow.remote.console;
    console.log("hello remote");
  }

  mainWindow.title = "Browser";
  mainWindow.loadURL('file://' + __dirname + '/browser.html');

  const contents = mainWindow.webContents;
  /* if (contents) {
    contents.on('did-finish-load', (ev) => {
      console.log('loaded');
      contents.console.log("did-finish");
      // mainWindow.sharedObject = global;
      contents.console.log("global", global);

    });
  } */

  // mainWindow.openDevTools();

  contents.on('new-window', 
    (event, url, frameName, disposition, options, additionalFeatures, referrer, postBody) => {
    event.preventDefault()
    const win = new BrowserWindow({
      webContents: options.webContents, // use existing webContents if provided
      show: false
    })
    win.once('ready-to-show', () => win.show())
    if (!options.webContents) {
      const loadOptions = {
        httpReferrer: referrer
      }
      if (postBody != null) {
        const { data, contentType, boundary } = postBody
        loadOptions.postData = postBody.data
        loadOptions.extraHeaders = `content-type: ${contentType}; boundary=${boundary}`
      }
  
      // existing webContents will be navigated automatically
      win.loadURL(url, loadOptions) 
    }
    event.newGuest = win
  });
});
