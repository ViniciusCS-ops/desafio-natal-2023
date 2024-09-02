<template>
  <div class="product-manager-container">
    <div class="header">
      <h1>🎄Produtos de Natal </h1>
    </div>
    <form @submit.prevent="createProduto" class="product-form">
      <input v-model="newProduto.nome" placeholder="Nome do Produto" />
      <input v-model="newProduto.quantidade" type="number" placeholder="Quantidade" />
      <input type="number" v-model="newProduto.preco"  placeholder="Preço" />
      <button type="submit" class="submit-btn">{{ editMode ? 'Atualizar Produto' : 'Criar Produto' }}</button>
    </form>

    <ul class="product-list">
      <li v-for="produto in produtos" :key="produto.id" class="product-item">
        <div class="product-header">
          <h3>{{ produto.nome }}</h3>
          <div class="product-actions">
            <button @click="editProduto(produto)" class="edit-btn">✏️ Editar</button>
            <button @click="deleteProduto(produto.id)" class="delete-btn">🗑️ Deletar</button>
          </div>
        </div>
        <p>Quantidade: {{ produto.quantidade }}</p>
        <p>Preço: {{ produto.preco }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      produtos: [],
      newProduto: {
        nome: '',
        quantidade: '',
        preco: ''
      },
      editMode: false,
      currentProdutoId: null
    }
  },
  methods: {
    async fetchProdutos () {
      try {
        const response = await axios.get('http://localhost:3000/produtos')
        this.produtos = response.data
      } catch (error) {
        console.error('Erro ao buscar produtos:', error)
      }
    },
    async createProduto () {
      try {
        if (this.editMode) {
          await axios.put(`http://localhost:3000/produtos/${this.currentProdutoId}`, { produto: this.newProduto })
        } else {
          await axios.post('http://localhost:3000/produtos', { produto: this.newProduto })
        }
        this.resetForm()
        this.fetchProdutos()
      } catch (error) {
        console.error('Erro ao criar/editar produto:', error)
      }
    },
    editProduto (produto) {
      this.newProduto = { ...produto }
      this.editMode = true
      this.currentProdutoId = produto.id
    },
    async deleteProduto (id) {
      try {
        await axios.delete(`http://localhost:3000/produtos/${id}`)
        this.fetchProdutos()
      } catch (error) {
        console.error('Erro ao deletar produto:', error)
      }
    },
    resetForm () {
      this.newProduto = {
        nome: '',
        quantidade: 0,
        preco: 0
      }
      this.editMode = false
      this.currentProdutoId = null
    }
  },
  mounted () {
    this.fetchProdutos()
  }
}
</script>

<style scoped>
.product-manager-container {
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
  color: #d6e930;
  font-family: 'Pacifico', cursive;
}

.product-form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  background-color: rgba(255, 255, 255, 0.8);
  padding: 20px;
  border-radius: 10px;
}

.product-form input {
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

.product-list {
  margin-top: 30px;
  list-style: none;
  padding: 0;
}

.product-item {
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 10px;
  padding: 15px;
  margin-bottom: 15px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.product-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.product-header h2 {
  margin: 0;
  color: #3e4444;
}

.product-actions button {
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
