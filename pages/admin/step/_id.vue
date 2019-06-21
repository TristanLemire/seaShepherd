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
            <button @click="editMode" class="button is-info addContent">Add content</button>
            <button v-if="edit" class="button is-primary">Add image</button>
            <button v-if="edit" class="button is-primary">Add video</button>
            <button v-if="edit" class="button is-primary">Add audio</button>
            <button v-if="edit" class="button is-primary">Add text</button>
        </div>

    </section>
  </div>
</template>

<script>

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
      id: this.$route.params.id,
      edit: false
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
