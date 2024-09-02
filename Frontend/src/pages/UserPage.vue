<template>
  <div class="login-container">
    <div class="login-box">
      <h2>Login</h2>
      <form @submit.prevent="login">
        <div>
          <input v-model="email" type="email" placeholder="Email" required />
        </div>
        <div>
          <input v-model="password" type="password" placeholder="Senha" required />
        </div>
        <button type="submit">Entrar</button>
      </form>
      <p class="register-link">
        Não tem uma conta? <a href="#" @click.prevent="goToRegister">Registre-se</a>
      </p>
    </div>
  </div>
</template>

<script>

export default {
  name: 'UserPage'

// export default {
// data () {
// return {
// email: '',
// password: ''
}
// },
// methods: {
// async login () {
// try {
// Lógica para autenticação
// const response = await axios.post('http://localhost:3000/users', {
// email: this.email,
// password: this.password
// })
// Salvar o token JWT (assumindo que a API retorna um token)
// localStorage.setItem('token', response.data.token)
// Redirecionar o usuário para a página principal ou dashboard
// this.$router.push('/dashboard')
// } //catch (error) {
// console.error('Erro ao tentar login:', error)
// alert('Login falhou. Verifique suas credenciais.')
// }
// },
// goToRegister () {
// this.$router.push('/register')
// }
// }
// }
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f5f5;
}
.login-box {
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  text-align: center;
  width: 300px;
}
input {
  width: 100%;
  padding: 10px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 5px;
}
button {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
button:hover {
  background-color: #0056b3;
}
.register-link {
  margin-top: 15px;
}
.register-link a {
  color: #007bff;
  text-decoration: none;
}
.register-link a:hover {
  text-decoration: underline;
}
</style>
