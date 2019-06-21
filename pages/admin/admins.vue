<template>
  <div>
    <Hero :active="active"/>
    <div class="container">
      <br>
      <br>
      <form class="column is-5">
        <div class="field">
          <label class="label">Admin name</label>
          <div class="control">
            <input
              autofocus
              autocomplete="username"
              name="username"
              minlength="5"
              class="input"
              type="text"
              placeholder="e.g Alex Smith"
            >
          </div>
        </div>

        <div class="field">
          <label class="label">Password</label>
          <div class="control">
            <input
              autocomplete="current-password"
              name="password"
              minlength="5"
              class="input"
              type="password"
            >
          </div>
        </div>
        <input type="submit" class="button is-info" value="Add admin">
      </form>
      <br>
      <br>
      <table class="table is-fullwidth">
        <thead>
          <tr>
            <th class="has-text-weight-bold">ID</th>
            <th class="has-text-weight-bold">Name</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="admin in adminList" :key="admin.id">
            <td>{{ admin.id }}</td>
            <td>{{ admin.name }}</td>
            <td>
              <button :id="'edit-'+admin.id" class="button is-primary edit">Edit</button>
              <button :id="'delete-'+admin.id" class="button is-danger deleteButton">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <br>
    <br>
    <br>
    <br>
  </div>
</template>

<script>
import Hero from "~/components/Hero.vue";

if (process.client) {
  // Form submit
  let form = document.querySelector("form");
  form.addEventListener("submit", e => {
    e.preventDefault();

    let username = form.querySelector("input[name=username]").value;
    let password = form.querySelector("input[name=password]").value;
    let url = "http://localhost:3000/api/admins";

    let data = {
      name: username,
      password: password
    };

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
  });

  // Edit
  let editButtons = document.querySelectorAll(".edit");
  editButtons.forEach(button => {
    button.addEventListener("click", () => {
      let tds = document.querySelectorAll('tbody tr td:nth-child(2)');
      tds.forEach(td => {
        let input = td.querySelector('input');
        if(input) {
          let value = input.value;
          td.innerHTML = '';
          td.innerHTML = input.value;
        }
      })
      let buttonId = button.id
      buttonId = buttonId.substring(5,buttonId.length);

      let trs = document.querySelectorAll("tbody tr");
      trs.forEach(tr => {
        let td = tr.querySelector("td");
        if (buttonId === td.innerHTML) {
          td = tr.querySelector("td:nth-child(2)");
          let adminName = td.innerHTML;
          if(!td.querySelector('input')) td.innerHTML = '<input autofocus class="control editInput" value="' + adminName + '"/>';
          let input = td.querySelector("input");
          input.addEventListener("blur", () => {
                td.innerHTML = adminName;
          });
          input.addEventListener("keypress", e => {
            if (e.keyCode === 13) {
              adminName = input.value
              let data = { name: input.value };
              fetch('http://localhost:3000/api/admins/'+buttonId, {
                method: "PUT",
                mode: "cors",
                cache: "no-cache",
                credentials: "same-origin",
                headers: {
                  "Content-Type": "application/json"
                },
                referrer: "no-referrer", // no-referrer, *client
                body: JSON.stringify(data) // body data type must match "Content-Type" header
              });
              input.removeEventListener("blur", () => {
                td.innerHTML = adminName;
              })

              td.innerHTML = '';
              td.innerHTML = adminName;
            }
          });
        }
      });
    });
  });

  // Delete
  let deleteButtons = document.querySelectorAll('.deleteButton')

  deleteButtons.forEach(button => {
    button.addEventListener('click', () => {
      let buttonId =  button.id
      buttonId = buttonId.substring(7, buttonId.length);

      let trs = document.querySelectorAll('tbody tr');
      trs.forEach(tr => {
        let td = tr.querySelector('td');

        if (td.innerHTML === buttonId) {
          let url = 'http://localhost:3000/api/admins/' + buttonId

          fetch(url, {
                method: "DELETE"
          }).then(() => {
            window.location.reload();
          })
        }
      })
    })
  })

}

export default {
  data() {
    return {
      active: "admins"
    };
  },
  asyncData({ params }) {
    return fetch("http://localhost:3000/api/admins", { method: "GET" })
      .then(response => {
        return response.json();
      })
      .then(response => {
        return { adminList: response };
      });
  },
  components: {
    Hero
  },
  methods: {
    // getAdmins() {
    //   let url = "http://localhost:3000/api/admins";
    //   fetch(url, { method: "GET" })
    //     .then(response => {
    //       return response.json();
    //     })
    //     .then(response => {
    //       this.adminList = response;
    //     });
    // }
  }
};
</script>
