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
            :id="'title-'+step.id"
            name="title"
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
            :id="'description-'+step.id"
            name="description"
            minlength="5"
            class="input"
            type="text"
            :value="step.description"
          >
        </div>
      </div>
      <div class="field">
        <label class="label has-text-light">Latitude</label>
        <div class="control">
          <input
            :id="'lat-'+step.id"
            name="latitude"
            minlength="5"
            class="input"
            type="text"
            :value="step.latitude"
          >
        </div>
      </div>
      <div class="field">
        <label class="label has-text-light">Longitude</label>
        <div class="control">
          <input
            :id="'lon-'+step.id"
            name="longitude"
            minlength="5"
            class="input"
            type="text"
            :value="step.longitude"
          >
        </div>
      </div>
    </section>

    <section class="notification is-dark contentSection">
      <h1 class="title">Content</h1>
      <div>
        <button class="button is-info addContent">Add content</button>
        <button class="invisible imageType contentButton button is-primary">Image / Video</button>
        <button class="invisible contentButton button is-primary">Audio</button>
        <button class="invisible textType contentButton button is-primary">Text</button>
      </div>
      <br>
      <div
        :id="'div-'+content.id"
        v-for="content in contents"
        :key="content.id"
        class="contentPart notification is-info"
      >
        <form v-if="content.type === 'text'" :id="content.id" action>
          <div class="field">
            <div class="control">
              <input class="input" :value="content.subtitle" name="subtitle" placeholder="Section subtitle"/>
            </div>
          </div>
          <div class="field">
            <div class="control">
              <textarea :value="content.content" class="textarea" placeholder="Section content"></textarea>
            </div>
          </div>
          <div class="field">
            <div class="control">
              <input class="number" name="order" type="number" :value="content.order">
            </div>
          </div>
          <input type="submit" class="button is-outlined is-light" value="Save modifications">
          <button class="button is-danger deleteContent">Delete</button>
        </form>
        <span v-if="content.type === 'image' || content.type === 'video'">
          <img v-if="content.type === 'image'" :src="'/'+content.source" alt="image">
          <br>
          <video controls v-if="content.type ==='video'" :src="'/'+content.source"></video>
          <form :id="content.id">
            <div class="field">
              <div class="control">
                <input :value="content.subtitle" name="subtitle" class="input" placeholder="Section subtitle"/>
              </div>
            </div>
            <div class="field">
              <div class="control">
                <textarea :value="content.content" class="textarea" placeholder="Section content"></textarea>
              </div>
            </div>
            <div class="field">
              <div class="control">
                <input class="number" name="order" type="number" :value="content.order">
              </div>
            </div>
            <input type="submit" class="button is-outlined is-light" value="Save modifications">
            <button class="button is-danger deleteContent">Delete</button>
          </form>
        </span>
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

  // Image button
  let addImage = document.querySelector(".imageType");

  addImage.addEventListener("click", () => {
    let div = document.createElement("div");
    div.classList.add("notification", "contentPart", "is-info");

    div.innerHTML +=
      '<form method="POST" action="/api/contents/upload" enctype="multipart/form-data"><div class="file"><label class="file-label"><input class="file-input" type="file" name="myImage"><span class="file-cta"><span class="file-icon"><i class="fas fa-upload"></i></span><span class="file-label">Choose a file…</span></span></label></div><br><input value="Add" type="submit" class="button is-light is-outlined"/></form>';
    document.querySelector(".contentSection").appendChild(div);

  });

  // Text button
  let addText = document.querySelector(".textType");

  addText.addEventListener("click", () => {
    // Create it in database
    let url = "http://localhost:3000/api/contents";
    let order = document.querySelectorAll(".contentPart").length;
    console.log('order: ', order);

    let data = {
      id_step: window.location.href.substring(33, window.location.href.length),
      order: order,
      type: "text"
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
          '"><div class="field"><div class="control"><input class="input" value="" name="subtitle" placeholder="Section subtitle"/></div></div><div class="field"><div class="control"><textarea class="textarea" placeholder="Section content"></textarea></div></div><div class="field"><div class="control"><input name="order" class="number" type="number" value="' +
          order +
          '"></div></div><input type="submit" class="button is-outlined is-light" value="Save modifications"><button class="button is-danger deleteContent">Delete</button></form>';
        document.querySelector(".contentSection").appendChild(div);

        // Add event listeners
        let form = document.querySelectorAll("form");
        form = form[form.length - 1];

        form.addEventListener("submit", e => {
          e.preventDefault();
          let content = form.querySelector("textarea");
          let order = form.querySelector("input[name=order]");
          let subtitle = form.querySelector("input[name=subtitle]");

          let data = {
            subtitle: subtitle.value,
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
          }).then(response => {
            console.log('response: ', response);
            window.location.reload();
          });
        });
      });
  });

  setTimeout(() => {
    let forms = document.querySelectorAll("form");
    forms.forEach(form => {
      let deleteButton = form.querySelector(".deleteContent");
      deleteButton.addEventListener("click", () => {
        let url = "http://localhost:3000/api/contents/" + form.id;
        fetch(url, {
          method: "DELETE"
        });
        let id = form.id;
        let div = document.querySelector("#div-" + id);
        div.style.display = "none";
      });
      form.addEventListener("submit", (e) => {
        e.preventDefault();
        let content = form.querySelector("textarea");
        let order = form.querySelector("input[name=order]");
        let subtitle = form.querySelector("input[name=subtitle]");

        let data = {
          content: content.value,
          order: order.value,
          subtitle: subtitle.value
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
        }).then(response => {
          window.location.reload();
        });
      });
    });
  }, 300);

  // Edit title, description, longitude and latitude
  let title = document.querySelector("input[name=title]");
  let description = document.querySelector("input[name=description]");
  let latitude = document.querySelector("input[name=latitude]");
  let longitude = document.querySelector("input[name=longitude]");

  title.addEventListener("keyup", () => {
    let id = title.id.substring(6, title.id.length);
    let url = "http://localhost:3000/api/steps/" + id;
    let data = {
      title: title.value
    };

    fetch(url, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    });
  });

  description.addEventListener("keyup", () => {
    let id = description.id.substring(12, description.id.length);
    let url = "http://localhost:3000/api/steps/" + id;
    let data = {
      description: description.value
    };

    fetch(url, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    });
  });

  longitude.addEventListener("keyup", () => {
    let id = longitude.id.substring(4, longitude.id.length);
    let url = "http://localhost:3000/api/steps/" + id;
    let data = {
      longitude: longitude.value
    };

    fetch(url, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    });
  });

  latitude.addEventListener("keyup", () => {
    let id = latitude.id.substring(4, latitude.id.length);
    let url = "http://localhost:3000/api/steps/" + id;
    let data = {
      latitude: latitude.value
    };

    fetch(url, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    });
  });
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



