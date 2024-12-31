<template>
  <div class="video-card">
    <div class="video-iframe-container">
      <iframe
        v-if="src"
        :src="src"
        title="title"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
      ></iframe>
    </div>
    
    <!-- Conditionally render the video description if title or description is provided -->
    <div v-if="title || description" class="video-description">
      <h3>{{ title }}</h3>
      <p>{{ description }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "VideoCard",
  props: {
    src: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      default: '',
    },
    description: {
      type: String,
      default: '',
    },
  },
};
</script>

<style scoped>
.video-card {
  display: block;
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
  border: 1px solid #ccc;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  text-decoration: none;
  color: inherit;
  transition: box-shadow 0.3s ease;
}

.video-card:hover {
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

/* Container to maintain 18:9 aspect ratio */
.video-iframe-container {
  position: relative;
  width: 100%;
  padding-top: 56.25%; /* 9/18 = 0.5, this gives the 18:9 aspect ratio */
}

.video-iframe-container iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border: none;
}

.video-description {
  padding: 16px;
  background-color: #f9fafb;
}

.video-description h3 {
  margin: 0 0 8px;
  font-size: 18px;
}

.video-description p {
  margin: 0;
  font-size: 14px;
  color: #666;
}
</style>

