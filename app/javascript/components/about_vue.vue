 <template>
  <div id="about">
    <div class="bg">
      <b-container class="what">
          <h3>Vacantとは？</h3>
          <p>
            山を買ってサバゲーフィールドに<br/>はたまたキャンプ場に。
          </p>
          <p>
            空き家を借りてマイオフィスに<br/>はたまたカフェに。
          </p>
          <p>
            私たちで、空き山・空き家を最高に面白い場所に変えていきましょう。<br/>Vacantはその未来を実現するために欠かせないツールです。
          </p>
          <h4>✔︎ ４コマで解説してみると</h4>
          <b-row class="pc-only">
            <b-col cols="4" class="left-col">
              <ul>
                <li>
                  <span>①. 社会的背景</span>
                </li>
                <li>
                  <span>②. 資産保有者側</span>
                </li>
                <li>
                  <span>③. 利用希望者側</span>
                </li>
                <li>
                  <span>④. 最も大切なこと</span>
                </li>
              </ul>
            </b-col>
            <b-col cols="8" class="right-col">
              <ul>
                <li><img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155231.png" /></li>
                <li><img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155304.png" /></li>
                <li><img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155216.png" /></li>
                <li><img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155222.png" /></li>
              </ul>
            </b-col>
          </b-row>
          <b-row class="mobile-only">
            <ul>
                <li>
                  <span>①. 社会的背景</span>
                  <img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155231.png" />
                </li>
                <li>
                  <span>②. 資産保有者側</span>
                  <img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155304.png" />
                </li>
                <li>
                  <span>③. 利用希望者側</span>
                  <img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155216.png" />
                </li>
                <li>
                  <span>④. 最も大切なこと</span>
                  <img src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190309/20190309155222.png" />
                </li>
              </ul>
          </b-row>
          <h4>✔︎ 例えば、こんな使い方！</h4>
          <p style="font-size: 50px; color: white; padding: 100px 0;">Coming soon...</p>
      </b-container>
    </div>

    
  </div>
</template>

<script>
export default {
  data: function() {
    return {};
  }
};
</script>
<style scoped lang="scss">
#about {
  @media screen and (max-width: 480px) {
    .pc-only {
      display: none;
    }

    .bg {
      background-image: url("../../assets/images/top-mobile.png");
      background-repeat: no-repeat;
      width: 100%;
      height: 100%;
      background-position: right;
      background-size: cover;

      .what {
        h3 {
          text-align: center;
          font-size: 35px;
          color: white;
          padding: 10px 0 5px 0;
          font-weight: bold;
        }

        h4 {
          text-align: center;
          font-size: 25px;
          color: white;
          padding: 30px 0 10px 0;
          font-weight: bold;
        }

        p {
          font-size: 16px;
          text-align: center;
        }

        ul {
          width: 100%;

          li:nth-child(odd) {
            text-align: center;
            margin-bottom: 70px;
            -moz-transform: rotate(-5deg);
            -webkit-transform: rotate(-5deg);
            -o-transform: rotate(-5deg);
            -ms-transform: rotate(-5deg);

            span {
              color: white;
              font-size: 18px;
            }

            img {
              width: 85%;
            }
          }

          li:nth-child(even) {
            text-align: center;
            margin-bottom: 70px;
            -moz-transform: rotate(5deg);
            -webkit-transform: rotate(5deg);
            -o-transform: rotate(5deg);
            -ms-transform: rotate(5deg);

            span {
              color: white;
              font-size: 18px;
            }

            img {
              width: 85%;
            }
          }
        }
      }
    }
  }

  @media screen and (min-width: 481px) {
    .mobile-only {
      display: none;
    }

    .bg {
      background-image: url("../../assets/images/top-pc.png");
      background-repeat: no-repeat;
      width: 100%;
      height: 100%;
      background-position: right;
      background-size: cover;

      .what {
        h3 {
          text-align: center;
          font-size: 50px;
          color: white;
          padding: 40px 0 30px 0;
          font-weight: bold;
        }

        h4 {
          text-align: center;
          font-size: 35px;
          color: white;
          padding: 60px 0 20px 0;
          font-weight: bold;
        }

        p {
          font-size: 20px;
          text-align: center;
        }

        .left-col {
          ul {
            li {
              height: 530px;

              span {
                position: relative;
                top: 50%;
                font-size: 40px;
                color: whitesmoke;
              }
            }
          }
        }

        .right-col {
          ul {
            width: 100%;

            li:nth-child(odd) {
              text-align: center;
              margin-bottom: 70px;
              -moz-transform: rotate(-5deg);
              -webkit-transform: rotate(-5deg);
              -o-transform: rotate(-5deg);
              -ms-transform: rotate(-5deg);

              img {
                width: 100%;
              }
            }

            li:nth-child(even) {
              text-align: center;
              margin-bottom: 70px;
              -moz-transform: rotate(5deg);
              -webkit-transform: rotate(5deg);
              -o-transform: rotate(5deg);
              -ms-transform: rotate(5deg);

              img {
                width: 100%;
              }
            }
          }
        }
      }
    }
  }
}
</style>