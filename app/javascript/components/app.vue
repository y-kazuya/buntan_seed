<template>
  <div id="app">
    <p>{{ name }}</p>
    <ul>
      <li v-for="location in locations" v-bind:key="location">
        <span>{{ location }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      name: "kyuma",
      locations: ["Canada", "Thailand", "Indonesia"]
    };
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
