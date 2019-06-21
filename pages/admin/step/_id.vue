<template>
  <div class="container">
    <br>
    <br>
    <br>
    <a href="/admin/steps" class="button">
        <i class="fas fa-arrow-left"></i>&nbsp
      <span>Go back to steps</span>
    </a>
    <br>
    <br>
    <br>
    <br>
    <section class="notification is-dark">
        <h1 class="title">Global settings</h1>
    <div class="field">
          <label class="label has-text-light">Title</label>
          <div class="control">
            <input
              name="username"
              minlength="5"
              class="input"
              type="text"
              :value="step.title"
            >
          </div>
        </div>
    <div class="field">
          <label class="label has-text-light">Description</label>
          <div class="control">
            <input
              name="username"
              minlength="5"
              class="input"
              type="text"
              :value="step.description"
            >
          </div>
        </div>
    </section>

    <section class="notification is-dark contentSection">
        <h1 class="title">Content</h1>
        <div>
            <button class="button is-info addContent">Add content</button>
            <button class="invisible contentButton button is-primary">Image</button>
            <button class="invisible contentButton button is-primary">Video</button>
            <button class="invisible contentButton button is-primary">Audio</button>
            <button class="invisible contentButton button is-primary">Text</button>
        </div>

    </section>
  </div>
</template>
<style lang="scss" scoped>
button.invisible {
    visibility: hidden;
}
</style>

<script>

if (process.client) {
    let edit = false;
    let buttons = document.querySelectorAll('button.contentButton');
    let addContent = document.querySelector('button.addContent');

    addContent.addEventListener('click', () => {
        if( edit === false) buttons.forEach(button => button.classList.remove('invisible'))
        else buttons.forEach(button => button.classList.add('invisible'))
        edit = !edit
    })
}

export default {
    head () {
    return {
      script: [
        { src: 'https://kit.fontawesome.com/62db70851e.js' }
      ]
    } 
  },
  asyncData({ params }) {
    return fetch("http://localhost:3000/api/steps/" + params.id, {
      method: "GET"
    })
      .then(response => {
        return response.json();
      })
      .then(response => {
        return { step: response };
      });
  },
  data() {
    return {
      id: this.$route.params.id
    };
  },
  methods: {
      editMode() {
          if(this.edit) this.edit = false
          else this.edit = true
      }
  }
};
</script>
