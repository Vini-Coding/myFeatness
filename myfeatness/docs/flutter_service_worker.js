'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "e4768bca4819d75cc66aebafc00f3326",
"assets/AssetManifest.bin.json": "5b791b16455d04ce1a077128b61436fe",
"assets/AssetManifest.json": "2a770fbc36df2dafdb7e4fe2e3dd3eba",
"assets/assets/fonts/Montserrat-Black.ttf": "cce7ff8c1d7999f907b6760fbe75d99d",
"assets/assets/fonts/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/fonts/Montserrat-Italic.ttf": "cc53ad8bb1c801746c831bb7ce493f74",
"assets/assets/fonts/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/fonts/Staatliches-Regular.ttf": "0b1946eaefaeda766701618dba33e03c",
"assets/assets/icon/app_icon.png": "14d9083829dc081e6c53a4a8ce1d4d28",
"assets/assets/icon/branding.png": "5528666fceb2872400b6914fdf79e8b7",
"assets/assets/icon/splash.png": "8e5f5889bed880ee8fc296c72abf44ff",
"assets/assets/images/branding.png": "e0cf0cd2221652891577dfa175de2540",
"assets/assets/images/card.jpg": "20a544c507d3da1fd4ccc28a24d9a0a9",
"assets/assets/images/splash.png": "15026e49da13e8a4a42b598ae720e0e4",
"assets/assets/lottie/loading.json": "23afee49bef4613871b6012ff6c0c916",
"assets/assets/vectors/introview1.png": "c957c692bb424132ab70f7e3b2eaca29",
"assets/assets/vectors/introview2.png": "a8be934b30006f5828dc654f5a049df0",
"assets/assets/vectors/introview3.png": "e11613f83d2f3eeda159c4a9199a77f1",
"assets/FontManifest.json": "1ad5115052abdc5833aea3e9d6da6618",
"assets/fonts/MaterialIcons-Regular.otf": "0e6b016990cf441cfe619c31ae763c16",
"assets/NOTICES": "32d0977cd80d1968b2f951c654a979f1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "f34ce76edaf1c7813602167193582560",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "83a2c20304208f9d68587568dccde22a",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "23ba973fc6e36576558c3a5414d51361",
"icons/Icon-512.png": "5b7edde77b98916fa4e57a8e444fa06c",
"icons/Icon-maskable-192.png": "23ba973fc6e36576558c3a5414d51361",
"icons/Icon-maskable-512.png": "5b7edde77b98916fa4e57a8e444fa06c",
"index.html": "be6d917ba2adc4978c97972433f4d392",
"/": "be6d917ba2adc4978c97972433f4d392",
"main.dart.js": "2f7580aaec331e3b34cc71c67f6a5d2e",
"manifest.json": "1650530a9f560b2f430565bc99fec00e",
"splash/img/branding-1x.png": "a3a3e0277e7ab38d3a10e52ffc74af77",
"splash/img/branding-2x.png": "6587b255e921f422eb96e8778c8412c4",
"splash/img/branding-3x.png": "2719bb4854beb09cd04e49706fed2b76",
"splash/img/branding-4x.png": "336b1e674415c3803e5117bd015d8cc6",
"splash/img/branding-dark-1x.png": "a3a3e0277e7ab38d3a10e52ffc74af77",
"splash/img/branding-dark-2x.png": "6587b255e921f422eb96e8778c8412c4",
"splash/img/branding-dark-3x.png": "2719bb4854beb09cd04e49706fed2b76",
"splash/img/branding-dark-4x.png": "336b1e674415c3803e5117bd015d8cc6",
"splash/img/dark-1x.png": "a7d54cd404091bf8985e25787b7ff0bf",
"splash/img/dark-2x.png": "4133170b7d8208f068512cbe012ccf9a",
"splash/img/dark-3x.png": "537d5ec8ecdb5395384ba6de86e857f1",
"splash/img/dark-4x.png": "8ef9baed11ac078b82dd0833a6cc3806",
"splash/img/light-1x.png": "a7d54cd404091bf8985e25787b7ff0bf",
"splash/img/light-2x.png": "4133170b7d8208f068512cbe012ccf9a",
"splash/img/light-3x.png": "537d5ec8ecdb5395384ba6de86e857f1",
"splash/img/light-4x.png": "8ef9baed11ac078b82dd0833a6cc3806",
"version.json": "3eec4a57fb86b293d77ad136df91d4d5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
