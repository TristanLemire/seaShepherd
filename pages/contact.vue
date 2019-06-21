<template>
  <div class="contact">
    <Menu />
    <h1>CONTACT</h1>
    <div class="contact__content">
      <div>
        <div>
          <h2>Global Headquarters</h2>
          <p>52 Alexander Boersstraat <br>
          1071 KZ Amsterdam, The Netherlands <br>
          Tel : +31 20 233 7701 <br>
          Email info @seashepherdglobal.org
          </p>
        </div>

        <div>
          <h2 class="content__title--press">Press Inquiries</h2>
          <p>Heather Stimmler, Global Media Director <br>
          Tel : +339 7719 7742 (Europe) <br>
          Email media @seashepherdglobal.org
          </p>
          <p>
            For Press Inquiries regarding SSCS (North America) <br>
            Tel : +1 212 220 2302 (USA) <br>
            Email media @seashepherd.org
            </p>
        </div>
      </div>

      <div class="contact__row"></div>

      <div>
        <div>
          <h2>Donations</h2>
          <p>Jan Hazeleger, CFO <br>
          Email finance @seashepherdglobal.org
          </p>
        </div>

        <div>
          <h2 class="content__title--volunteer">Volunteer Crew</h2>
          <p>General crew inquiries: <br>
          www.seashepherdglobal.org/get-involved/volunteer-sea/
          </p>
          <p>If you're a ticketed navigator or engineer <br>
            crewing @seashepherdglobal.org</p>
        </div>
      </div>

      <div class="contact__row"></div>

      <div>
        <div>
          <h2>Sea Shepherd Store</h2>
          <p>52 Alexander Boersstraat <br>
          1071 KZAmsterdam, The Netherlands <br>
          Opening hours: <br>
          Tue-Sun 11am – 5pm <br>
          Tel : +31 20 233 7701 <br>
          Email : cs@seashepherdstore.com
          </p>
        </div>

        <div>
          <h2 class="content__title--online">Online Store</h2>
          <p>www.seashepherdstore.com <br>
          Email : shop@sea-shepherd.de
          </p>
        </div>
      </div>

    </div>
    <h3>Please read our Frequently Asked Questions (FAQs) before sending your email. We run a very tight ship at Global headquarters, and our top priority is managing the daily operations of our direct-action campaigns. We don’t have “administrative staff” to answer calls and emails, so please be patient when awaiting a reply. </h3>
  </div>
</template>

<script>
  import Menu from '~/components/Menu.vue';

  export default {
    components: {
      Menu
    }
  }
</script>

<style lang="scss">

  .contact {
    color: #fff;
    background-color: #0D1B2A;
    min-height: 100vh;
    width: 100vw;
    font-family: "Poppins", sans-serif;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;

    .contact__content {
      display: flex;
      flex-direction: row;
      justify-content: center;
      width: 78vw;
      height: 58vh;

      div:nth-child(5) {
        text-align: right;
      }

      .contact__row {
        background: #415A77;
        width: 2px;
        height: 100%;
        margin: 0 24px 0 24px;
      }
    }
  }

  p {
    margin-top: 32px;
  }

  h1 {
    font-weight: bold;
    font-size: 35px;
  }

  h2 {
    font-weight: bold;
    font-size: 24px;
  }

  h3 {
    font-size: 14px;
    text-align: center;
    margin-bottom: 24px;
  }

  .content__title--press {
    margin-top: 74px;
  }

  .content__title--volunteer {
    margin-top: 114px;
  }

  .content__title--online {
    margin-top: 34px;
  }
</style>