<template>
  <div>
    <a
      v-if="to"
      :href="to"
      class="card"
      rel="noopener noreferrer"
    >
      <div class="card-content">
        <h3>{{ title }}</h3>
        <p>{{ description }}</p>
      </div>
    </a>
    <div v-else class="card">
      <div class="card-content">
        <h3>{{ title }}</h3>
        <p>{{ description }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      required: true
    },
    description: {
      type: String,
      required: true
    },
    to: {
      type: String,
      required: false // Opsional
    }
  }
};
</script>

<style>
.card {
  display: block;
  text-decoration: none;
  color: inherit;
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 16px;
  transition: box-shadow 0.3s ease;
}
.card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.card-content h3 {
  margin: 0 0 8px;
  font-size: 18px;
}
.card-content p {
  margin: 0;
  font-size: 14px;
  color: #666;
}
</style>

