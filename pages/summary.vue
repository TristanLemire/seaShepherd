<template>
  <div class="template__summary">
    <Back/>
    <StepsMenu/>

    <section class="section__hero scrollto">
      <h1>CONGRATULATIONS</h1>
      <p>
        You've been through the Sea-Shepherd experience, we hope it has made you feel better.
        Discover your results without further delay with your answers to the questions you have been asked during your exploration!
      </p>
    </section>

    <section v-for="(table, index) in sortedTable" :key="index" class="section__stats scrollto">
      <h2>Summary of your answers</h2>
      <div class="stats__data">
        <div v-for="row in table" :key="row.id" class="data__values data__values--first">
          <div class="values__user values">
            <h3 class="question">{{ row.title }}</h3>
            <h3 class="answer">{{ row.answer }}</h3>
          </div>
        </div>
      </div>
    </section>
    <section class="section__score scrollto">
      <img src="~/assets/image/paulwatson-sig.png" alt>
      <div class="summary">
        <h3
          class="score__sentence"
        >According to your answers, you are eligible to be part of this journey!</h3>
      </div>
    </section>
  </div>
</template>

<script>
import Back from "~/components/Back.vue";
import StepsMenu from "~/components/StepsMenu.vue";

if (process.client) {
  // Scroll function
  setTimeout(() => {
    let sections = document.querySelectorAll(".scrollto");
    let arr = [];
    sections.forEach(section => {
      arr.push(section);
    });
    if (sections[1].className === "scrollto text") arr.splice(1, 1);
    sections = arr;
    let pos = 0;
    let scroll = 0;
    let flag = true;
    let offset = 0;

    window.addEventListener("wheel", e => {

      // If the function is allowed to run
      if (flag) {
        if (e.deltaY > 5 && pos < sections.length - 1) {
          pos += 1;
          offset = sections[pos].offsetTop;

          window.scrollTo({
            behavior: "smooth",
            top: offset
          });
          flag = false;

          // Allow the listener to work again
          setTimeout(() => {
            flag = true;
          }, 1000);
        } else if (e.deltaY < -5 && pos > 0) {
          pos -= 1;
          offset = sections[pos].offsetTop;

          window.scrollTo({
            behavior: "smooth",
            top: offset
          });

          flag = false;

          // Allow the listener to work again
          setTimeout(() => {
            flag = true;
          }, 1000);
        }
      }
    });
  }, 200);
}

export default {
  data() {
    return {
      questions: this.getAllQuestions(),
      replies: this.getAllReplies(),
      answers: this.getAllAnswers(),
      user: this.getUser(),
      table: this.getTable(),
      sortedTable: null
    };
  },
  methods: {
    getTable() {
      let table = [];
      if (process.client) {
        let user = JSON.parse(localStorage.getItem("user"))[0];
        // Get all user replies
        fetch("http://localhost:3000/api/reply", { method: "GET" })
          .then(response => {
            return response.json();
          })
          .then(replies => {
            let count = 0;
            replies.forEach(reply => {
              ++count;
              if (reply.id_user === user.id) {
                let row = {
                  id: reply.id,
                  title: "",
                  answer: ""
                };
                fetch("http://localhost:3000/api/questions", { method: "GET" })
                  .then(response => {
                    return response.json();
                  })
                  .then(questions => {
                    questions.forEach(question => {
                      if (question.id_step === reply.id_step) {
                        row.title = question.title;
                      }
                    });
                  })
                  .then(() => {
                    fetch("http://localhost:3000/api/answers", {
                      method: "GET"
                    })
                      .then(response => {
                        return response.json();
                      })
                      .then(answers => {
                        answers.forEach(answer => {
                          if (answer.id === reply.id_answer) {
                            row.answer = answer.answer;
                            table.push(row);
                            this.table = table;
                            if (count === replies.length) {
                              this.sortTable(table);
                            }
                          }
                        });
                      });
                  });
              }
            });
          });
      }
    },
    sortTable(table) {
      let sortedTable = [];
      let miniTable = [];
      for (let i = 1; i < table.length + 1; i++) {
        miniTable.push(table[i - 1]);
        if (i % 2 === 0) {
          sortedTable.push(miniTable);
          miniTable = [];
        }
      }
      this.sortedTable = sortedTable
    },
    getUser() {
      if (process.client) {
        this.user = JSON.parse(localStorage.getItem("user"))[0];
      }
    },
    getAllAnswers() {
      let url = "http://localhost:3000/api/answers";

      fetch(url, { method: "GET" })
        .then(response => {
          return response.json();
        })
        .then(response => {
          this.answers = response;
        });
    },
    getAllReplies() {
      let url = "http://localhost:3000/api/reply";

      fetch(url, { method: "GET" })
        .then(response => {
          return response.json();
        })
        .then(response => {
          this.replies = response;
        });
    },
    getAllQuestions() {
      let url = "http://localhost:3000/api/questions";

      fetch(url, { method: "GET" })
        .then(response => {
          return response.json();
        })
        .then(response => {
          this.questions = response;
        });
    }
  },
  components: {
    /* Logo, */
    StepsMenu,
    Back
  }
};
</script>

<style lang="scss">
html {
  background-color: #0d1b2a;
}

.template__summary {
  font-family: "Poppins", sans-serif;
  color: #fff;
}

section {
  width: 100vw;
  min-height: 100vh;
}

.section__hero {
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  h1 {
    font-size: 35px;
    font-weight: bold;
    position: absolute;
    top: 5%;
  }

  p {
    text-align: center;
    font-size: 16px;
    width: 64%;
  }
}

.section__stats {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  background: #0d1b2a;

  h2 {
    position: absolute;
    top: 7.4%;
  }

  .stats__data {
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    justify-content: space-between;
    width: 55%;
    min-height: 42vh;

    .data__values {
      margin-bottom: 10vh;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;

      .values {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
      }
    }
  }
}

.question,
.like {
  font-size: 22px;
  max-width: 25vw;
}

.answer,
.percentage {
  max-width: 25vw;
  font-size: 32px;
  font-weight: bold;
  margin-top: 32px;
}

.section__score {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;

  img {
    position: absolute;
    bottom: 14%;
    right: 8.9%;
    width: 26%;
  }

  .summary {
    width: 52%;
    min-height: 24vh;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;

    .score__sentence {
      font-size: 16px;
      position: relative;
      z-index: 2
    }

    .score__text {
      font-size: 22px;
    }

    .score__percentage {
      font-size: 32px;
      font-weight: bold;
    }
  }
}
</style>