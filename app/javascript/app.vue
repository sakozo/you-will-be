<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: ""
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
