// Service Worker for GitHub Pages PWA
// Version 1.2.0

const CACHE_NAME = 'github-pages-v3';
const urlsToCache = [
  '/github_pages_index/',
  '/github_pages_index/index.html',
  '/github_pages_index/css/styles.css',
  '/github_pages_index/images/logo.svg',
  '/github_pages_index/images/favicon.svg',
  '/github_pages_index/images/icon-512.png',
  '/github_pages_index/images/icon-192.png',
  '/github_pages_index/images/apple-touch-icon.png',
  '/github_pages_index/images/apple-touch-icon-152.png',
  '/github_pages_index/images/apple-touch-icon-120.png',
  '/github_pages_index/manifest.json'
];

// 安装事件 - 缓存资源
self.addEventListener('install', (event) => {
  console.log('[Service Worker] Installing...');
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        console.log('[Service Worker] Caching app shell');
        return cache.addAll(urlsToCache);
      })
      .then(() => {
        console.log('[Service Worker] Skip waiting');
        return self.skipWaiting();
      })
      .catch((error) => {
        console.error('[Service Worker] Cache failed:', error);
      })
  );
});

// 激活事件 - 清理旧缓存
self.addEventListener('activate', (event) => {
  console.log('[Service Worker] Activating...');
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheName !== CACHE_NAME) {
            console.log('[Service Worker] Deleting old cache:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    }).then(() => {
      console.log('[Service Worker] Claiming clients');
      return self.clients.claim();
    })
  );
});

// 拦截请求 - 使用网络优先策略 (Network First)
self.addEventListener('fetch', (event) => {
  event.respondWith(
    fetch(event.request)
      .then((response) => {
        // 网络请求成功
        // 检查是否是有效的响应
        if (!response || response.status !== 200 || response.type !== 'basic') {
          return response;
        }

        // 克隆响应，因为响应流只能使用一次
        const responseToCache = response.clone();

        // 更新缓存
        caches.open(CACHE_NAME).then((cache) => {
          cache.put(event.request, responseToCache);
        });

        console.log('[Service Worker] Fetched from network and cached:', event.request.url);
        return response;
      })
      .catch(() => {
        // 网络请求失败，尝试从缓存获取
        console.log('[Service Worker] Network failed, serving from cache:', event.request.url);
        return caches.match(event.request);
      })
  );
});

// 监听消息事件
self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});
