<template>
    <div>
        <section class="hero is-medium is-dark is-bold">
      <div class="hero-body">
        <div class="container">
          <h1 class="title">Administration - Sea Shepherd</h1>
          <h2
            class="subtitle has-text-info"
          >You're now in the admin part of the doc.</h2>
        </div>
      </div>
    </section>
    <div class="tabs is-medium is-fullwidth is-boxed">
      <ul>
        <li :class="{'is-active': active==='index'}">
          <a href="/admin/">Admin home</a>
        </li>
        <li :class="{'is-active': active==='steps'}">
          <a href="/admin/steps">Steps</a>
        </li>
        <li :class="{'is-active': active==='users'}">
          <a href="/admin/users">Users</a>
        </li>
        <li :class="{'is-active': active==='admins'}">
          <a href="/admin/admins">Admins</a>
        </li>
        <li>
          <a class="has-text-danger disconnect">Disconnect</a>
        </li>
      </ul>
    </div>
    </div>
</template>

<script>
if (process.client) {
  let disconnect = document.querySelector('.disconnect');
  disconnect.addEventListener('click', () => {
    localStorage.removeItem('connected');
    window.location.href = 'http://localhost:3000/';
  })
}

export default {
  props: ['active']
}
</script>
