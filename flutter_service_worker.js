'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "c20f6bdcbf5569fd44fd7c3e08ff1d98",
"assets/AssetManifest.json": "a3120fefc3e2bb676bfbe128a5e5acd1",
"assets/assets/data/certifications.json": "d6a963347f57f59a5c105f87bfe944a1",
"assets/assets/data/blogs/welcome.md": "66df18eb1ba787e5434336d6e2172c74",
"assets/assets/data/CHANGELOG.md": "bc60c81369ac78c8c342451140be66cc",
"assets/assets/data/experience.json": "156581a3d1f0de90ad662c581bb62f53",
"assets/assets/data/tags.json": "f118b2ff818bf220f7ab42a3955739b7",
"assets/assets/data/projects.json": "026e4395a279669edef81a6daca34082",
"assets/assets/data/blogs.json": "65edba9892bbe60fb3e100a0ab7119cc",
"assets/assets/data/platforms.json": "733c72444e71d9387d59087cdeb00066",
"assets/assets/data/person.json": "7d2efd0ce3b5464c9912d10e4dc15e61",
"assets/assets/images/logos/linkedin.svg": "a2a4fcfd72d4462c52544ff6281f4bff",
"assets/assets/images/logos/accenture.svg": "60661ae488133b52b3d90456088ee3f2",
"assets/assets/images/logos/dhbw.svg": "bc2b45c385cfc19ff1f5e1b83f1d69c0",
"assets/assets/images/view.gif": "26eb3be13f0f0685fbd46e60ab413671",
"assets/assets/images/flags/flag_system.svg": "325eb5357ccc744deec112ddd29e164f",
"assets/assets/images/flags/flag_germany.svg": "37f47263cdda77b7a3d0e5fcb9df43f3",
"assets/assets/images/flags/flag_us.svg": "b859ce08dfb64f4b28cae8065fc6f85f",
"assets/assets/images/Icon-192.png": "c58cd7a481bfec930492b8210834b352",
"assets/assets/images/thumbnails/coin2gether.png": "20c7ef914470b29b8c9d25fd99a5dd65",
"assets/assets/images/thumbnails/active_lane_keeping_assistant.png": "2534e17a6a21024a0882bc0ce259a435",
"assets/assets/images/thumbnails/pac_man_ai.png": "9e29c16ace6b152263103d2583115ff8",
"assets/assets/images/thumbnails/intelligent_charging_station.png": "20cf4f4c23550ecdf6238500fc8c6cc9",
"assets/assets/images/thumbnails/prinvars.png": "e50a57e6fb8911693ed40749a353bba2",
"assets/assets/images/thumbnails/welcome.png": "9d5f074ee1afd1b6cdd561d016fb19ce",
"assets/assets/images/thumbnails/drone_security.png": "8093fa132b6365702652a2e2aafc77dc",
"assets/assets/images/thumbnails/coin_counter_2_gether.png": "ced989524ea85319210b8ff25efbb104",
"assets/assets/images/thumbnails/work_in_progress.png": "4d8879e18c54d93e2e51eb7fe39a8278",
"assets/AssetManifest.bin": "235d629814ad8e948bf616dd7d7087ae",
"assets/fonts/MaterialIcons-Regular.otf": "1caa00b4f76e5aa9e595edfe7cb2c0b6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size1-Regular.ttf": "1e6a3368d660edc3a2fbbe72edfeaa85",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Regular.ttf": "b5f967ed9e4933f1c3165a12fe3436df",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size4-Regular.ttf": "85554307b465da7eb785fd3ce52ad282",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-BoldItalic.ttf": "946a26954ab7fbd7ea78df07795a6cbc",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Script-Regular.ttf": "55d2dcd4778875a53ff09320a85a5296",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-Italic.ttf": "a7732ecb5840a15be39e1eda377bc21d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Bold.ttf": "9eef86c1f9efa78ab93d41a0551948f7",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Regular.ttf": "5a5766c715ee765aa1398997643f1589",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size2-Regular.ttf": "959972785387fe35f7d47dbfb0385bc4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Italic.ttf": "d89b80e7bdd57d238eeaa80ed9a1013a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Bold.ttf": "46b41c4de7a936d099575185a94855c4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_AMS-Regular.ttf": "657a5353a553777e270827bd1630e467",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Regular.ttf": "7ec92adfa4fe03eb8e9bfb60813df1fa",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size3-Regular.ttf": "e87212c26bb86c21eb028aba2ac53ec3",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Bold.ttf": "ad0a28f28f736cf4c121bcb0e719b88a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Italic.ttf": "ac3b1882325add4f148f05db8cafd401",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Typewriter-Regular.ttf": "87f56927f1ba726ce0591955c8b3b42d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Bold.ttf": "a9c8e437146ef63fcd6fae7cf65ca859",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-BoldItalic.ttf": "e3c361ea8d1c215805439ce0941a1c8d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Regular.ttf": "dede6f2c7dad4402fa205644391b3a94",
"assets/FontManifest.json": "71a4a82de411f155107da3f8dac64ebd",
"assets/NOTICES": "19a4104f55b6d17d1501a7132bc9d81f",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"manifest.json": "f01bf32364bf39550d86bfa164955365",
"CNAME": "2209964cdff550f17b98e6e3bf7d8574",
"index.html": "a5b5d2bc64320ca4bf1514e02304ee39",
"/": "a5b5d2bc64320ca4bf1514e02304ee39",
"icons/Icon-maskable-512.png": "f5eac1f86b918bcc07bf54b2dc0f3708",
"icons/Icon-512.png": "42d9f966999947741ae4d1ba64223bb0",
"icons/Icon-144.png": "13f34cc35d1e595dcf7a703a21ee17d1",
"icons/Icon-maskable-144.png": "86651e3935cf74763d1f009521fcff84",
"icons/Icon-192.png": "c58cd7a481bfec930492b8210834b352",
"icons/Icon-maskable-192.png": "cf0d2aeec550cc9d6f8154012b211a68",
"favicon.png": "acc5dbfcaddbac6c95897b9846b1ba38",
"404.html": "3349aec305a81d77b0b312d9e8cb39be",
"version.json": "48599454c817efcfce780dbb4f6fdae1",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a"};
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
