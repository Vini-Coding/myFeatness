'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a8297d555dd34879e8e48e1cf12acefa",
".git/config": "ecd73a93eabee20fe1fce8fa7ffe934b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ffab3a07d7ac8581f744f1fe84986d14",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "8421c545d67a4ff87a26b583c801e70f",
".git/logs/refs/heads/main": "acd3ab6e2763bc0a741121509fc76a52",
".git/logs/refs/remotes/origin/main": "02f6c75d6429c79092c20389660d1ac5",
".git/objects/02/7d05a18771b6e6670b7a4261e7888068bd2220": "2c88785bb4eb61e6c12fcbd2cf35e8b9",
".git/objects/07/6f42ed11527364d7e3c5e4f1efa89dbdf2eef0": "44c2424e2e4dac11072c154ba8c614b0",
".git/objects/07/74c17c0fa7a7e87e24a6935830998d92b52c75": "cd62ee54b7ceea7b2a7804e69b1d9134",
".git/objects/09/27b8133cfc1ed1c326677f8f1275fae4529606": "a610c88a483a5433f49298b8a9c2bfdc",
".git/objects/0f/3df1ff760e439636925b3a869e249e619f7823": "862d6ac1bc7440b8e2ec9676d2f07482",
".git/objects/12/928d7e78a372e01a4ac8045244ce53e9063068": "bf0843ef5a5b73ede140e07aa302c77b",
".git/objects/13/258959c84582ecb54bc7433509fc377bba7912": "1befb118858cee1e2c0b12884a1fca3a",
".git/objects/14/bf973fe874f0fff8971f263fc37cfef499e15a": "22195cced2f5487e37ddf7e221a6cb4a",
".git/objects/16/5ce0ddf03a820a38f48cba9aa0c9df9b6e6b79": "71df17c95c3124eada62b59e7dabda78",
".git/objects/1c/026b5068f3c0001c4593a0ca8c01ae62d15477": "430a017f5fe087396022af2a19272493",
".git/objects/1d/b70cd41a31fb7e33986d74c4fe3cd9b249a84b": "2944006c1ba5a69e9563c8c048ce5450",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/20/0377674b0ffe002b2150861b8c7886f47b45aa": "ab732a87bbdbec0560cda50fa852fad9",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/21/c8d0a072fec7431beb2c5bd6ff7c93599a6a6a": "f265d40d69998ddc0e2cec3cf0e67fa3",
".git/objects/21/e0136d3258f0ee4ad236eaaa37a6ebcf73f23d": "e1809ca27d2b8317a3f6197adfe09d67",
".git/objects/26/30c751a6299907e0429a6c239a5375166f4a2d": "235d4b6114f033a7e768191302779676",
".git/objects/26/666e9ff9871f3ebaa783e651125a2c9a475d6d": "04a257130eeecc1144bd5584c287289d",
".git/objects/2c/8b0552c8894ecd52b3b702db1906c32b9dcbf3": "7e114a3c876fc59d4ec95f30dd82387d",
".git/objects/31/5b3ce1226a5a795660943c6dee172e3d5e4089": "47711432c52cac14cc84af8e2cc480a0",
".git/objects/3c/1538661373cbc53ac0f4978fd2f93d9e3da4c3": "3eadc97dd72355702a9c4da3be0d9a25",
".git/objects/3e/07aa3677ff7aa012a4ffb8c4d098f208a15b01": "98ee228b133a3ea3e0be28a595b6aa7e",
".git/objects/3e/6c1cd1f45020a7656af87824017af6c8a199e8": "05c0fe559006340c6d4f387c13374755",
".git/objects/44/6aae2e3a7a3d89a95a0710eb382e0d7e51542a": "fa81e63a7098543d13822653319098c7",
".git/objects/47/0ac4e404b8c8c9c8f0115f33738b2b0b6d96d0": "588451ab68f66672906e3bb6357c6142",
".git/objects/4a/39079e580dc9be820cba2fae41238c49eaa798": "ada1a19fea32fbb6719120809b9eae60",
".git/objects/4e/0a5bd2b1d38fe56bb206a5ffc0d88e2e96c7c9": "e3c89a152309fd8b6b9df1e4e4444b94",
".git/objects/50/36a935664c3f63a9711cb0d3e9493f869e14d8": "9f2594b928415751604ff22a7b2be824",
".git/objects/58/c064b655668b1bf58d74a032643bf41d20d7f4": "9fe9c10128557139895e310a1aa6a616",
".git/objects/5a/7b05e1be311772247124911182fda78fde2cec": "d38bfbb93663df272dc4920186bd1040",
".git/objects/61/078f451f339e9e729897ed896b3a307753ea92": "16b8d9259e666fe7b95598557bde3928",
".git/objects/63/da66a8b491d850c0858ad21aa62ca74aef28ba": "87f65b18c219cfdd79f552877d4bc83e",
".git/objects/69/c962fe50b978efcd784672178084c4987e0ca7": "09fc2cff499292aa25f976faf97e40cb",
".git/objects/6f/9cad4c116bc8d72e2497226abb5c05ee64982c": "0d104480d68c1652a53721377a02a882",
".git/objects/70/bd21c0f2b77cb20ab45d24cc4936667a4ed142": "13a459fc06ffb41d17625f9fdec38a5a",
".git/objects/71/7117947090611c3967f8681ab1ac0f79bca7fc": "ad4e74c0da46020e04043b5cf7f91098",
".git/objects/71/7809363ed19bdd7e1d78f6e421e40a96bc29e3": "9414a3044cb191cc3f57340f57c3dc93",
".git/objects/72/391a81dfb4f1c1837b28a1a57536b2687ce28f": "7aeee6a145716c84d5b7dfac7fe27d30",
".git/objects/79/9fb74b9c0788c16b9c60bc9ce6b80bb409c21f": "35dbd4dc02d76bca7d5bf389191bab49",
".git/objects/7a/f9fb4420e3851e67c228388a491b908d08b63b": "c3fddd40d590a847ae43452253325766",
".git/objects/7b/61d999647b61e04571f4e646e969406af44939": "3a6283f67dde0a67e4f8ffe3a442fe98",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/75b4040365ba6428fe9e5b621a2cd8aae6c142": "9bd7aa5127c70a5ea1725de01e58f83f",
".git/objects/8f/a4b9bc27049cb0d8a08bd7224bb32e0c6dceab": "8831fb67e1dd58aad939027a1b02a58c",
".git/objects/94/bfb1463ad8331bfd687bc751b8920b133da744": "fd2d8c0d844b234856b36b93f652048f",
".git/objects/9d/2c0c68b12b7d83000dc9116c9b1fdd2dcc59c2": "a145e02f7ce25f11202b98b09f56d49d",
".git/objects/a2/293176cd2a1b91c63ac426b6fb644778376d72": "83973a896c2fb9a230d07f3a796c0974",
".git/objects/a3/ddb265d221d9e874dd0a51dd4b7eb91158fbd4": "85b38e6c563cd04a229c245593f1c2dc",
".git/objects/a7/8fe3cacd3a958c44c2ada91cc5a781ebdf7870": "89776469e684325454a9145a2b974eb0",
".git/objects/ad/934f4cec964eb3a69e53330199450a7b7883be": "da2e3480c5ade372daf5849978b9151b",
".git/objects/af/742adee0a85dd21ea96cbd84182e30e085d6cf": "aa25b932ec40efacb1efe27e7cf25d82",
".git/objects/b3/a8ee120741dc71b14a6919fc4b57531c6cfb30": "9859ee882caf6fd4c645ade119d77405",
".git/objects/b5/0254288cc6319d153c4af1d64870d95ee2436f": "468a6506934a07c970a4739eae75eedd",
".git/objects/b5/5995133651a581b58bd8f47dd64dd130d21e1a": "a9aa35189bd5f8755ba528339d812d68",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/bd/7d8022d4bb8c353f83d72e07b9f300e1f7849f": "200cd9a78b8b19e4c4a49b2422db560d",
".git/objects/c5/f4bc2a4da91586f3005813077f0d0aa9040f82": "3191028b787554cee4652f5050144bff",
".git/objects/c6/897d6802711e55599efa0f1502418071a1ebaa": "7a7fde1bddccff2490c5aa1829091acb",
".git/objects/c7/26579500ba6c132878f434517a772ce253fbc6": "f9ed88cc9af0ffb5097761702d91a49e",
".git/objects/c7/7d77ff105e9801553e71cf55fabe4c559d3153": "7ff600fab769f40d5576cd07e98515b0",
".git/objects/cf/f3cebcdab38622c0e4c8e9ef9990ace0f1b063": "c99d8004b3aa66663413cc99f2dd5cda",
".git/objects/d3/387422e625a1cbd5dabb39fb76a8fa0d4b5b66": "de0933ccc0d706776d3aae6b8b5c0247",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/b66539f178fc4f55337abc59fbecc2fe7c2503": "5905d0f3a70954d2f177b29105cdea73",
".git/objects/d7/4d5f09ab138604d11e94d25020e02675c93974": "a5e53cff9dab8660766630d1642978b7",
".git/objects/da/f01f671c395313bdc8f163743254f44c9b54a1": "472ffff4fbf7a48bf476707e2b56c900",
".git/objects/df/a45f20499ebc98c1eb577aa1f67f53f1d854b7": "0ad6b3adf4eb1030ee08d82487c366bb",
".git/objects/e3/e988f112f4094a8d00353ff77a0102ed27a310": "60359644167f66c9eded32526044047e",
".git/objects/e6/8554d46d0b659930227f602ea1ba4053388140": "ba0c3c7f872cd864d4e9ee0346cd7a27",
".git/objects/e8/2c5850db3a3482d0c954a4dc122c02de555ce7": "d357cd906b3805bf81477f5527cca086",
".git/objects/e9/0768d83e8f32c54738e28df0a3ebc6fabee70f": "5e3aa74e5fd54967c7ee99047a744c51",
".git/objects/e9/2fbfa2b919e6c4cac0af797c27b3ee7b33eccd": "ad709948afea54aa00d8a6d3714e0391",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/8c5b98a249df8674e3ed5ed76c3e1c35cc8fb3": "13c39b6a6065414a7ff411f5296c4735",
".git/objects/f4/a266dd37d5066da46c9a6b8898073ae2930a64": "90c22367f91de9fd622ad04f0a5fd7c8",
".git/objects/f8/3536547b6ff084b43ec6192913b5bfbafcbb5d": "486dfeaf45b362fd23e0b8f99ace74a1",
".git/refs/heads/main": "b7357a5c3a5252d6ffec67175d900a97",
".git/refs/remotes/origin/main": "b7357a5c3a5252d6ffec67175d900a97",
"assets/AssetManifest.bin": "e4768bca4819d75cc66aebafc00f3326",
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
"index.html": "6282737b377b1c9afd0b6938511c049b",
"/": "6282737b377b1c9afd0b6938511c049b",
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
