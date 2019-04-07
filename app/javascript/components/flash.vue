<template>
  <div id="flasharea" :class="flashs.visible ? '' : 'goneFlash'">
    <template  v-for="(key, value) in flashs.main" >
      <div v-if="key !== ''" v-bind:key="key" :class="[`alert`,'alert-' + value]">
        <span class="flash-message">{{key}} </span>
        <span class="flash-dlt-button" @click="deleteFlash"> x </span>
      </div>
    </template>
  </div>
</template>

<script>
export default {
  props: ["flashs"],

  methods: {
    deleteFlash: function(){
      console.log(this.flashs.visible)
      this.flashs.visible = false
    }
  }

}
</script>

<style scoped>
  #flasharea{
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 100;
    opacity: 0.9;
  }

  .alert{
    text-align: center;
    position: relative;
    padding: 20px;
  }

  .flash-dlt-button{
    position: absolute;
    right: 2%;
    font-size: 40px;
    top: 0;
    color: black;
    cursor: pointer;
  }

  .goneFlash{
    transition-duration: 0.5s;
    transform:translate(0px,-100%);
  }

</style>


