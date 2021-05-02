const {app, BrowserWindow, session} = require('electron');

// browser options
const opt = {
   width: 1024, height: 768,
   modal: false,
   show : true,
   darkTheme: true,
   webPreferences: {
     nodeIntegration: true,
     webviewTag: true,
     enableRemoteModule: true,
     nativeWindowOpen: true,
     allowRunningInsecureContent: false,
     disableHtmlFullscreenWindowResize: false
    } 
  };

let mainWindow;
let count = 1;

app.on('window-all-closed', function() {
  app.quit();
});

app.on('certificate-error', (ev, webContents, url, error, cert, cb) => {
  ev.preventDefault();
  cb(true);
})

function newWindow(url, options, event) {
    const win = new BrowserWindow({
      webContents: options.webContents, // use existing webContents if provided
      show: true
    })

    /* if (!options.webContents) {
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
    } */
    
    count++;
    win.title = "Browser #" + count;
    win.loadURL('file://' + __dirname + '/browser.html');
    
    return win;
}

function newWindowGoogle(url, options, event) {
  const win = new BrowserWindow({
    webContents: options.webContents, // use existing webContents if provided
    show: true
  })
   // https://stackoverflow.com/questions/59685927/electron-application-using-google-oauth-this-browser-or-app-may-not-be-secure
   count++;
   win.title = "Browser #" + count;
   win.loadURL('https://www.google.co.uk/', {userAgent: 'Chrome'});

   return win;
}

app.on('ready', function() {
  
  app.userAgentFallback = "Chrome";
  session.defaultSession.webRequest.onBeforeSendHeaders((details, callback) => {
    details.requestHeaders["User-Agent"] = "Chrome";
    callback({ cancel: false, requestHeaders: details.requestHeaders });
  });

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
    const win = newWindowGoogle(url, options, event);
    
    event.newGuest = win
  });
  
});
