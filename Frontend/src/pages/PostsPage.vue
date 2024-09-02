<template>
  <div class="post-manager-container">
    <div class="header">
      <h1>🎄Posts de Natal </h1>
    </div>
    <form @submit.prevent="createPost" class="post-form">
      <input v-model="newPost.titulo" placeholder="Título do Post" />
      <textarea v-model="newPost.conteudo" placeholder="Conteúdo"></textarea>
      <button type="submit" class="submit-btn">{{ editMode ? 'Atualizar Post' : 'Criar Post' }}</button>
    </form>

    <ul class="post-list">
      <li v-for="post in posts" :key="post.id" class="post-item">
        <div class="post-header">
          <h3>{{ post.titulo }}</h3>
          <div class="post-actions">
            <button @click="editPost(post)" class="edit-btn">✏️ Editar</button>
            <button @click="deletePost(post.id)" class="delete-btn">🗑️ Deletar</button>
          </div>
        </div>
        <p>{{ post.conteudo }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      posts: [],
      newPost: {
        titulo: '',
        conteudo: ''
      },
      editMode: false,
      currentPostId: null
    }
  },
  methods: {
    async fetchPosts () {
      try {
        const response = await axios.get('http://localhost:3000/posts')
        this.posts = response.data
      } catch (error) {
        console.error('Erro ao buscar posts:', error)
      }
    },
    async createPost () {
      try {
        if (this.editMode) {
          await axios.put(`http://localhost:3000/posts/${this.currentPostId}`, { post: this.newPost })
        } else {
          await axios.post('http://localhost:3000/posts', { post: this.newPost })
        }
        this.resetForm()
        this.fetchPosts()
      } catch (error) {
        console.error('Erro ao criar/editar post:', error)
      }
    },
    editPost (post) {
      this.newPost = { ...post }
      this.editMode = true
      this.currentPostId = post.id
    },
    async deletePost (id) {
      try {
        await axios.delete(`http://localhost:3000/posts/${id}`)
        this.fetchPosts()
      } catch (error) {
        console.error('Erro ao deletar post:', error)
      }
    },
    resetForm () {
      this.newPost = {
        titulo: '',
        conteudo: ''
      }
      this.editMode = false
      this.currentPostId = null
    }
  },
  mounted () {
    this.fetchPosts()
  }
}
</script>

<style scoped>
.post-manager-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f0f8ff;
  border-radius: 15px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  background-image: url('https://img.freepik.com/fotos-premium/banner-de-natal-ou-ano-novo-em-fundo-escuro-de-madeira-com-arvore-de-natal-decorada-com-bolas-douradas-e-vermelhas-e-presentes-com-lugar-para-texto_594857-1206.jpg');
  background-size: cover;
}

.header {
  text-align: center;
  margin-bottom: 30px;
  color: #d6e92f;
  font-family: 'Pacifico', cursive;
}

.post-form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  background-color: rgba(255, 255, 255, 0.8);
  padding: 20px;
  border-radius: 10px;
}

.post-form input,
.post-form textarea {
  width: 100%;
  padding: 10px;
  border: 2px solid #d9534f;
  border-radius: 5px;
  font-size: 16px;
}

.submit-btn {
  padding: 10px;
  background-color: #d9534f;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 18px;
}

.submit-btn:hover {
  background-color: #c9302c;
}

.post-list {
  margin-top: 30px;
  list-style: none;
  padding: 0;
}

.post-item {
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 10px;
  padding: 15px;
  margin-bottom: 15px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.post-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.post-header h2 {
  margin: 0;
  color: #3e4444;
}

.post-actions button {
  background: none;
  border: none;
  cursor: pointer;
  font-size: 16px;
}

.edit-btn {
  color: #0275d8;
}

.edit-btn:hover {
  text-decoration: underline;
}

.delete-btn {
  color: #d9534f;
}

.delete-btn:hover {
  text-decoration: underline;
}
</style>
