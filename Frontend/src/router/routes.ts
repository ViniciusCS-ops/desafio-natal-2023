import { RouteRecordRaw } from 'vue-router'

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      {
        path: '',
        component: () => import('pages/IndexPage.vue')
      },
      {
        path: '/user',
        component: () => import('pages/UserPage.vue')
      },
      {
        path: '/produtos',
        component: () => import('src/pages/ProdutosPage.vue')
      },
      {
        path: '/posts',
        component: () => import('src/pages/PostsPage.vue')
      }
    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue')
  }
]

export default routes
