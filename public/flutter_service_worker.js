'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "50f3822479ad993df2e304a0195827ac",
"assets/AssetManifest.json": "9b456b428ab913ddec34634b8e908eae",
"assets/assets/baju1.jpg": "538f0a607d52702b4b193e48baffef97",
"assets/assets/baju_5.jpg": "f3c20f4c5c7c95e786bbef12ea318f81",
"assets/assets/Banner.jpeg": "7df7f013bf8fb66783407e45bf828d91",
"assets/assets/banner.png": "a1e41d5bcf1cfa40ab184503dbedf915",
"assets/assets/data_partner.json": "e29670c1113242cba5e4554e077d3f5d",
"assets/assets/elektronik_3.jpg": "9e684766845b0a92ad336ff0d146909f",
"assets/assets/event/13.jpeg": "1980bbd12b7cd69873b7e818af34c045",
"assets/assets/event/2.jpeg": "885ca9a2c478a793b9d1667da588d97a",
"assets/assets/event/6.jpeg": "42a81cadb480ccf8cf154a5e22e47b85",
"assets/assets/event/9.jpeg": "f414878c098d44248c8c87227ffa3000",
"assets/assets/logo.png": "59c313ff718d12472a2e5c68d4bc406d",
"assets/assets/Logo2.png": "d6ee9471a5ac285112c307d427f7f4ca",
"assets/assets/Logo3.png": "9ce4953c98f9d9ef4e0904334cd261ef",
"assets/assets/partner/image%252010.png": "d473d71b5636a72378a6f3531e696c90",
"assets/assets/partner/image%252011.png": "5dc17525bd9b8fc92a65f0ef3d5665bb",
"assets/assets/partner/image%252012.png": "abe9abdbfb8c675842a40e8672e1f641",
"assets/assets/partner/image%252013.png": "087ad248fbae3a9853a206074685ceb9",
"assets/assets/partner/image%25202.png": "88ce21bea1deaa6df2903a623f0c4c70",
"assets/assets/partner/image%25203.png": "d63e157578d97a3725c3499fc6c92174",
"assets/assets/partner/image%25204.png": "6fe33d0ecfc8b8dc6ba20966d4f4ce3d",
"assets/assets/partner/image%25205.png": "79d4073e1ef8732df9e62a7b0bf0886e",
"assets/assets/partner/image%25206.png": "e7d66cfc925b03abae29fcab6e0bb709",
"assets/assets/partner/image%25207.png": "7d4e9c23bafe5a3fc903531c6c7542c7",
"assets/assets/partner/image%25208.png": "24dfa52752c464e8db1692ae8ff887a2",
"assets/assets/partner/image%25209.png": "1edff15689aa22a9c5cc9cd50e766fc3",
"assets/assets/partner/partner2.1.jpeg": "d25d35f4006f92ac56e711b8dfa8b953",
"assets/assets/partner/partner2.2.jpeg": "8dd88f12595c6ba76b7814a1acf763b5",
"assets/assets/partner/partner2.3.jpeg": "1194259a98cbb2907373f9d926742abf",
"assets/assets/partner/partner3.1.WEBP": "5abb0031317325b9dcb57bf4809ebfd1",
"assets/assets/partner/partner3.2.WEBP": "21d2402405dd153ab6121f57f6c3f27e",
"assets/assets/partner/partner3.3.WEBP": "775bf4b7c11ec42746278a25018db314",
"assets/assets/partner/partner4%2520logo.png": "8370e55e634dafdfdec3adb998e6b53b",
"assets/assets/partner/partner4.1.jfif": "8adbf9be96c96aa20dbe53f97713ad8e",
"assets/assets/partner/partner4.2.jfif": "7b8afaa3d0d25498dea0937408a7065c",
"assets/assets/partner/partner4.3.jfif": "0d3ad32dc624508383b3a50d193f5103",
"assets/assets/partner/partner5%2520logo.png": "c8162e79c480938cdc997646dac515ba",
"assets/assets/partner/partner5.1.webp": "bd6fd01bfb2c100452c05d05360097c2",
"assets/assets/partner/partner5.2.avif": "13dd1d7c00bdffa6973ec3e09689d16b",
"assets/assets/partner/partner5.3.avif": "7f2bd784cd98e740bd8e1c76ff9a4caf",
"assets/assets/partner/partner6%2520logo.jfif": "bdcd0c70f8d4e6368fe7441f9df271fd",
"assets/assets/profile/360_F_367464887_f0w1JrL8PddfuH3P2jSPlIGjKU2BI0rn.jpg": "9040e3654c2de94da4d29796a322e57f",
"assets/assets/profile/profil_1.jpg": "e2862a26a227b907764c094f3dd8202e",
"assets/assets/Screenshot__1119_-removebg-preview.png": "c4ddd0422c139505a22e04c6771fdc7a",
"assets/assets/WhatsApp_Image_2022-12-21_at_7.16.41_AM.jpeg": "68cef30980c13e3b17b954ad7759552e",
"assets/assets/WhatsApp_Image_2022-12-21_at_7.16.41_AM_1.jpeg": "85b9167ce2dbea130fd705d889ac5e5f",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/fonts/MaterialIcons-Regular.otf": "2a7d817f0d1d0858a7f05e9c9b7aeb91",
"assets/NOTICES": "90809c9864b2fb99fbf1e49141dabaa6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "0db203e8632f03baae0184700f3bda48",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "01bb14ae3f14c73ee03eed84f480ded9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "efc6c90b58d765987f922c95c2031dd2",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "e81d12884132ea97cea4fa812b5085e9",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "d6011eb729fc6b3bac5497aedc7a2eb1",
"icons/Icon-512.png": "eb23fe9126cb77dbedcdbe67cca3d337",
"icons/Icon-maskable-192.png": "d6011eb729fc6b3bac5497aedc7a2eb1",
"icons/Icon-maskable-512.png": "eb23fe9126cb77dbedcdbe67cca3d337",
"index.html": "cfe287b820150222ff3e20007c122171",
"/": "cfe287b820150222ff3e20007c122171",
"main.dart.js": "9017367b05a68a77e09b37e3f9f06a48",
"manifest.json": "dcf559587a190788d66bb7f953c32077",
"version.json": "f21a1dd5f0eeaa52ac579fda2a5f924a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
