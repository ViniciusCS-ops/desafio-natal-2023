<template>
  <div class="index-container">
    <h1>🎄 Bem-vindo ao Gerenciador de Natal 🎅</h1>
    <div class="button-container">
      <router-link to="/user">
        <button class="index-button">Login</button>
      </router-link>
      <router-link to="/produtos">
        <button class="index-button">Gerenciar Produtos</button>
      </router-link>
      <router-link to="/posts">
        <button class="index-button">Gerenciar Posts</button>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'IndexPage'
}
</script>

<style scoped>
.index-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-image: url('https://img.freepik.com/fotos-premium/topico-de-feliz-natal-em-um-fundo-de-madeira-com-arvore-de-natal_158398-113.jpg');
  background-size: cover;
  background-position: center;
  color: #fff;
  text-align: center;
  font-family: 'Roboto', sans-serif;
}

h1 {
  font-family: 'Pacifico', cursive;
  font-size: 3em;
  color: #ff6f61; /* Cor natalina vibrante */
  margin-bottom: 50px;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); /* Sombra para destacar o texto */
}

.button-container {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.index-button {
  padding: 15px 30px;
  font-size: 18px;
  color: #fff;
  background-color: #d9534f; /* Vermelho natalino */
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Sombra leve para destaque */
}

.index-button:hover {
  background-color: #c9302c; /* Vermelho mais escuro ao passar o mouse */
}

.index-button:active {
  background-color: #b52d2f; /* Cor ao clicar */
}

@media (max-width: 768px) {
  h1 {
    font-size: 2.5em;
  }

  .index-button {
    padding: 12px 25px;
    font-size: 16px;
  }
}

@media (max-width: 480px) {
  h1 {
    font-size: 2em;
  }

  .index-button {
    padding: 10px 20px;
    font-size: 14px;
  }
}
</style>
