<template>
  <div class="container column">
    <form class="column is-5">
      <div class="field">
        <label class="label">User name</label>
        <div class="control">
          <input autofocus autocomplete="username" name="username" minlength="5" class="input" type="text" placeholder="e.g Alex Smith">
        </div>
      </div>

      <div class="field">
        <label class="label">Password</label>
        <div class="control">
          <input autocomplete="current-password" name="password" minlength="5" class="input" type="password">
        </div>
      </div>
      <input type="submit" class="button is-info" value="Connect">
    </form>
  </div>
</template>

<script>
if (process.client) {
    let form = document.querySelector('form');
    form.addEventListener('submit', (e) => {
        e.preventDefault();

        // Get the form fields
        const username = document.querySelector('input[name=username]').value;
        const password = document.querySelector('input[name=password]').value;

        // Get database fields to verify
        const url = 'http://localhost:3000/api/admins';
        fetch(url, {method: 'GET'})
        .then(response => {
            return response.json();
        })
        .then(admins => {
            admins.forEach(admin => {
                if (
                  username === admin.name &&
                  password === admin.password
                ) {
                  window.location.href = 'http://localhost:3000/admin';
                  localStorage.setItem('connected', 'true');
                } else console.log('Access denied');
            });
        })
        
        // Send user on the good page
    })
}
export default {

}
</script>
