<template>
  <div>
    <Hero :active="active"/>
    <div class="container">
      <br><br>
      <form class="column is-5">
        <div class="field">
          <label class="label">Step title</label>
          <div class="control">
            <input
              autofocus
              name="title"
              minlength="5"
              class="input"
              type="text"
              placeholder="e.g Departure"
            >
          </div>
        </div>

        <div class="field">
          <label class="label">Step description</label>
          <div class="control">
            <input
              name="description"
              minlength="5"
              class="input"
              type="text"
              placeholder="e.g Our friends are now leaving the ground on their boat."
            >
          </div>
        </div>
        <input type="submit" class="button is-info" value="Add step">
      </form>
      <br>
      <br>
      <table class="table is-fullwidth">
        <thead>
          <tr>
            <th class="has-text-weight-bold">ID</th>
            <th class="has-text-weight-bold">Title</th>
            <th class="has-text-weight-bold">Description</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="step in stepList" :key="step.id">
            <td>{{ step.id }}</td>
            <td>{{ step.title }}</td>
            <td>{{ step.description }}</td>
            <td>
              <button :id="'edit-'+step.id" class="button is-info edit">Edit</button>
              <button :id="'delete-'+step.id" class="button is-danger deleteButton">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
  </div>
</template>

<script>
import Hero from "~/components/Hero.vue";
if (process.client) {
  // Redirect if not an admin
  if(!localStorage.getItem('connected') || localStorage.getItem('connected') !== 'true') window.location.href = 'http://localhost:3000/login';

  // Form submission
  let form = document.querySelector('form');

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    let title = form.querySelector('input[name=title]').value
    let description = form.querySelector('input[name=description]').value

    let data = {
      title: title,
      description: description
    }
    let url = 'http://localhost:3000/api/steps';
    fetch(url, {
      method: "POST",
      mode: "cors",
      cache: "no-cache",
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json"
      },
      referrer: "no-referrer", // no-referrer, *client
      body: JSON.stringify(data) // body data type must match "Content-Type" header
    })
      .then(response => response.json()) // parses JSON response into native Javascript objects
      .then(response => {
        window.location.reload();
      });
  })


  // Delete
  let deleteButtons = document.querySelectorAll(".deleteButton");

  deleteButtons.forEach(button => {
    button.addEventListener("click", () => {
      let buttonId =  button.id
      buttonId = buttonId.substring(7, buttonId.length);

      let trs = document.querySelectorAll('tbody tr');
      trs.forEach(tr => {
        let td = tr.querySelector('td');

        if (td.innerHTML === buttonId) {
          let url = 'http://localhost:3000/api/steps/' + buttonId

          fetch(url, {
                method: "DELETE"
          }).then(() => {
            window.location.reload();
          })
        }
      })
    });
  });

  // Edit
  let editButtons = document.querySelectorAll('.edit');
  
  editButtons.forEach(button => {
    button.addEventListener('click', () => {
      let buttonId = button.id
      buttonId = buttonId.substring(5,buttonId.length);
      window.location.href = 'http://localhost:3000/admin/step/'+buttonId;
    })
  })
}

export default {
  data() {
    return {
      active: "steps"
    };
  },
  asyncData({ params }) {
    return fetch("http://localhost:3000/api/steps", { method: "GET" })
      .then(response => {
        return response.json();
      })
      .then(response => {
        return { stepList: response };
      });
  },
  components: {
    Hero
  },
  methods: {}
};
</script>
