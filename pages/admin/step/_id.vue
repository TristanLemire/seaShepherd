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
          <input name="username" minlength="5" class="input" type="text" :value="step.title">
        </div>
      </div>
      <div class="field">
        <label class="label has-text-light">Description</label>
        <div class="control">
          <input name="username" minlength="5" class="input" type="text" :value="step.description">
        </div>
      </div>
    </section>

    <section class="notification is-dark contentSection">
      <h1 class="title">Content</h1>
      <div>
        <button class="button is-info addContent">Add content</button>
        <button class="invisible imageType contentButton button is-primary">Image</button>
        <button class="invisible contentButton button is-primary">Video</button>
        <button class="invisible contentButton button is-primary">Audio</button>
        <button class="invisible textType contentButton button is-primary">Text</button>
      </div>
      <br>
      <div v-for="content in contents" :key="content.id" class="contentPart notification is-info">
        <form :id="content.id" action>
          <div class="field">
            <div class="control">
              <textarea :value="content.content" class="textarea" placeholder="Section content"></textarea>
            </div>
          </div>
          <div class="field">
            <div class="control">
              <input class="control" type="number" :value="content.order">
            </div>
          </div>
          <input type="submit" class="button is-outlined is-light" value="Save modifications">
          <button class="button is-danger deleteContent">Delete</button>
        </form>
      </div>
    </section>
    <br>
    <br>
    <br>
    <br>
  </div>
</template>
<style lang="scss" scoped>
button.invisible {
  visibility: hidden;
}
</style>

<script>
if (process.client) {
  // Redirect if not admin
  if (
    !localStorage.getItem("connected") ||
    localStorage.getItem("connected") !== "true"
  )
    window.location.href = "http://localhost:3000/login";

  // Buttons display
  let edit = false;
  let buttons = document.querySelectorAll("button.contentButton");
  let addContent = document.querySelector("button.addContent");

  addContent.addEventListener("click", () => {
    if (edit === false)
      buttons.forEach(button => button.classList.remove("invisible"));
    else buttons.forEach(button => button.classList.add("invisible"));
    edit = !edit;
  });

  // Text button
  let addText = document.querySelector(".textType");

  addText.addEventListener("click", () => {
    // Create it in database
    let url = "http://localhost:3000/api/contents";
    let order = document.querySelectorAll(".contentPart").length;

    let data = {
      id_step: window.location.href.substring(33, window.location.href.length),
      order: order
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
      .then(response => {
        return response.json();
      })
      .then(content => {
        let id = content[0].id;
        // Create the new html form

        let div = document.createElement("div");
        div.classList.add("notification", "contentPart", "is-info");

        div.innerHTML +=
          '<form id="' +
          id +
          '"><div class="field"><div class="control"><textarea class="textarea" placeholder="Section content"></textarea></div></div><div class="field"><div class="control"><input class="control" type="number" value="' +
          order +
          '"></div></div><input type="submit" class="button is-outlined is-light" value="Save modifications"><button class="button is-danger deleteContent">Delete</button></form>';
        document.querySelector(".contentSection").appendChild(div);

        // Add event listeners
        let form = document.querySelectorAll("form");
        form = form[form.length - 1];
        console.log("form: ", form);

        form.addEventListener("submit", e => {
          e.preventDefault();
          let content = form.querySelector("textarea");
          let order = form.querySelector("input");

          let data = {
            content: content.value,
            order: order.value
          };
          let url = "http://localhost:3000/api/contents/" + form.id;

          fetch(url, {
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
        });
      });
  });

  setTimeout(() => {
    let forms = document.querySelectorAll("form");
    forms.forEach(form => {
      let deleteButton = form.querySelector('.deleteContent');
      deleteButton.addEventListener('click', () => {
        let url = 'http://localhost:3000/api/contents/'+form.id;
        fetch(url, {
          method: 'DELETE'
        })
        form.style.display = 'none';
      })
      form.addEventListener("submit", e => {
        e.preventDefault();
        let content = form.querySelector("textarea");
        let order = form.querySelector("input");

        let data = {
          content: content.value,
          order: order.value
        };
        let url = "http://localhost:3000/api/contents/" + form.id;

        fetch(url, {
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
      });
    });
  }, 100);
  // Text fields blur listeners
  // TODO: mettre le listener sur les formulaires ajoutés au chargement de la page
  // ? la méthode est PUT (ils sont déjà créés)
}

export default {
  head() {
    return {
      script: [{ src: "https://kit.fontawesome.com/62db70851e.js" }]
    };
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
      contents: this.getContent()
    };
  },
  methods: {
    editMode() {
      if (this.edit) this.edit = false;
      else this.edit = true;
    },
    getContent() {
      let idStep = this.$route.params.id;
      fetch("http://localhost:3000/api/contents/" + idStep, {
        method: "GET"
      })
        .then(response => {
          return response.json();
        })
        .then(response => {
          this.contents = response;
        });
    }
  }
};
</script>
