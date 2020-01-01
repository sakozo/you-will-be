<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!!"
    }
  }
}
</script>

<style scoped>
p {
  /* font-size: 10px; */
  text-align: left;
}
</style>
