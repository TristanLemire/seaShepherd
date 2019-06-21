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
        <div class="field">
          <div class="control">
            <textarea :id="'textarea-'+content.id" :value="content.content" class="textarea" placeholder="Section content"></textarea>
            <div class="control"><input :id="'order-'+content.id" type="number" :value="content.order"/></div>
          </div>
        </div>
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

  let edit = false;
  let buttons = document.querySelectorAll("button.contentButton");
  let addContent = document.querySelector("button.addContent");

  addContent.addEventListener("click", () => {
    if (edit === false)
      buttons.forEach(button => button.classList.remove("invisible"));
    else buttons.forEach(button => button.classList.add("invisible"));
    edit = !edit;
  });

  // Image button

  // Text button
  let addText = document.querySelector(".textType");

  addText.addEventListener("click", () => {
    let contentSection = document.querySelector(".contentSection");
    let newInput = document.createElement("div");
    newInput.classList.add("notification", "is-info", "contentPart");
    //newInput.innerHTML += "<br><br>";

    newInput.innerHTML +=
      '<div class="field"> <div class="control"> <textarea class="textarea" placeholder="Section content"></textarea> </div>';
    newInput.innerHTML += '<div class="control"><input type="number"/></div> ';
    newInput.innerHTML += '</div>';
    contentSection.appendChild(newInput);

    let orderInput = newInput.querySelector('input');
    // Fetch to database
    let data = {
      type: "text",
      id_step: window.location.href.substring(33, window.location.href.length),
      order: orderInput.value || document.querySelectorAll('.contentPart').length
    };

    let url = "http://localhost:3000/api/contents";
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
        let contentId = content[0].id;
        let input = newInput.querySelector("textarea");
        input.addEventListener("blur", () => {
          let url = "http://localhost:3000/api/contents/" + contentId;
          let data = {
            content: input.value
          };

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

  // Text fields blur listeners
  setTimeout(() => {
    
    let textareas = document.querySelectorAll('textarea')
  textareas.forEach(textarea => {
    textarea.addEventListener('blur', () => {
      let textareaId = textarea.id.substring(9,textarea.length);
      let orderInput = document.querySelector('input#order-'+textareaId);

      let url = "http://localhost:3000/api/contents/" + textareaId;
          let data = {
              content: textarea.value,
              order: orderInput.value
          };

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
    })
  })
  }, 100);
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
