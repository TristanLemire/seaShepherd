# First Year Final Project

**Project name:** Shepherd of the Sea

**Description:** This project is a web documentary about the NGO Sea Shepherd, their missions and their way of organization during missions.

**Team:** 
* Cassandra Doux
* Virgil Limongi
* Kento Monthubert
* Jason Gauvin
* Edwin Vautier
* Tristan Lemire

---

## Technos

Front: **Nuxt** / **Vue** / **Bulma**(Back-office)

Back: **Knex** / **Postgresql** / **Node**

Libraries: **Amchart**(map)

---

## Setup

For detailed explanation on how things work, checkout [Nuxt.js docs](https://nuxtjs.org).

```bash
npm i # install dependencies
```

We are using postgres and knex for our database, if you don't have it, run the following command: 

```bash
npm run installall
```

Then you have to create the db, you can do it with the following command: 
```bash
createdb sea-shepherd
```

Once it's done, you can import the database with this command: 

```bash
psql sea-shepherd < dbexport.pgsql
```

---

## Export the DB

```
pg_dump sea-shepherd > dbexport.pgsql
```

---

## DB

![](./assets/bdd.png)

---
## API

We've created an API to manage all site content, the API is available on the `/api` route.

### Routes

|route       |description                                 |
|------------|--------------------------------------------|
|`/steps`    |The steps of the doc                        |
|`/users`    |The users of the doc                        |
|`/questions`|The questions we ask to users               |
|`/answers`  |The answer possibilities of a question      |
|`/reply`    |The reply of the user                       |
|`/contents` |A content of the step (Image - Vidéo - Text)|

## Back-office

The back office can be accessed at the `/admin` route.
By default, the username and password are:
```
username: admin
password: admin
```