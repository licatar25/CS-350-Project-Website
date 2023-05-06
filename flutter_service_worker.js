'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"main.dart.js": "8a8c3da86916b33e13abd68df2dcd270",
"version.json": "9a74f2fb2b088e615af41ce7f382f1cc",
"assets/assets/weekly-reports/Week1.pdf": "9ec330ee437bee44f6c250e808c3983d",
"assets/assets/weekly-reports/Week2.pdf": "3fcc4ce25b1f59435cf0bd271a9c15c8",
"assets/assets/weekly-reports/Week3.pdf": "ed0cf090231624ac76f6b1dc1318d185",
"assets/assets/weekly-reports/Week4.pdf": "293fd3c29946470975dd6e599284208c",
"assets/assets/weekly-reports/Week5.pdf": "766e9c2b1ceed417b9bf0d7e4da2ae8f",
"assets/assets/weekly-reports/Week6.pdf": "3ecb4fb681d0a8514130a4961aa09e82",
"assets/assets/weekly-reports/Week7.pdf": "5137e583435033a766c0663e3b11182c",
"assets/assets/weekly-reports/Week8.pdf": "9f3b087e225957a844fe84e70b30164b",
"assets/assets/weekly-reports/Week9.pdf": "b599d76835d5f20b0e90d6f6fd64c2e9",
"assets/assets/weekly-reports/Week10.pdf": "1c377d9f2536ef77c6196f51f10ee522",
"assets/assets/weekly-reports/Week12.pdf": "310adbebc0f2827abbba42f977ddb260",
"assets/assets/weekly-reports/Week13.pdf": "7a91745d04d951372c0547356fde15e4",
"assets/assets/weekly-reports/Week14.pdf": "19aeeecfbab2a85ca615e9f390f61be4",
"assets/assets/weekly-reports/Week15.pdf": "48840a6b73fb9436ffea7dac06f2548d",
"assets/assets/weekly-reports/Week16.pdf": "1bc55b4217f3c24f2a4d6b00a29ac507",
"assets/assets/weekly-reports/Week11.pdf": "583bfadfe8f9e6388934ab39b5e0aa77",
"assets/assets/AllDocuments.zip": "e21c061cfc67e11df43b45dda2ff3588",
"assets/assets/schedulebuilder_screenshot.png": "2dd33a1ef30425a6b9551475fed57e18",
"assets/assets/SoftwareRequirementsSpecification.pdf": "a01a929b9554ae383efefb69abbca5b9",
"assets/assets/TestingRequirements.pdf": "ae821fa17f86bb83f3f6124ab55fdcf1",
"assets/assets/Week1-16.zip": "2992b9f4c7f445b34da073fe1be305be",
"assets/packages/material/lib/fonts/material.ttf": "73fa4408f8f7e62643f494229f4998c7",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.json": "3d17bb6ff1f77a24f77ffe646e364d36",
"assets/FontManifest.json": "cdb94ff3b054da60b218ea6a52c259b9",
"assets/NOTICES": "9c49b0316a681462463b5c1a4192221b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "169ba2bcf6bc89b04f20123555d969c3",
"/": "169ba2bcf6bc89b04f20123555d969c3",
"manifest.json": "bd385960d3777862b7e4d49153ead9c3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
