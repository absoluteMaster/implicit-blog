# Media Guide for Blog Posts

This guide explains how to use the enhanced media system for rich, engaging blog posts.

## 📁 Media Storage

All media files should be stored in the `Assets/` folder:

```
Assets/
├── post-images/           # Featured images and thumbnails
├── galleries/             # Image collections
├── videos/               # Video files
├── audio/                # Podcast/audio content
└── documents/            # PDFs, downloads
```

## 🖼️ Featured Images

### In Frontmatter
```yaml
# Main image for social sharing and post listings
featuredImage: "Assets/post-images/my-post-banner.jpg"

# Small preview image (optional - will use featuredImage if empty)
thumbnail: "Assets/post-images/my-post-thumb.jpg"
```

### Best Practices
- **Featured Image:** 1200x630px (optimal for social sharing)
- **Thumbnail:** 400x225px (for post listings)
- **Format:** JPG for photos, PNG for graphics/logos
- **Size:** Keep under 500KB for fast loading

## 🎞️ Image Galleries

### Multiple Images
```yaml
gallery: [
  "Assets/galleries/image1.jpg",
  "Assets/galleries/image2.jpg",
  "Assets/galleries/image3.jpg"
]
```

### In Post Content
```markdown
## Gallery

![Image 1](Assets/galleries/image1.jpg)
*Caption for image 1*

![Image 2](Assets/galleries/image2.jpg)
*Caption for image 2*
```

## 🎥 Video Content

### YouTube Videos
```yaml
video: "https://www.youtube.com/watch?v=VIDEO_ID"
```

### Local Video Files
```yaml
video: "Assets/videos/my-video.mp4"
```

### In Post Content
```markdown
## Video Content

<video controls>
  <source src="Assets/videos/demo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
```

## 🎵 Audio Content

### Podcast Episodes
```yaml
audio: "Assets/audio/episode-01.mp3"
```

### In Post Content
```markdown
## Listen to This

<audio controls>
  <source src="Assets/audio/interview.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>
```

## 📄 Documents & Downloads

### PDFs and Files
```markdown
📄 [Download the Guide](Assets/documents/complete-guide.pdf)

📊 [Spreadsheet Template](Assets/documents/template.xlsx)
```

## 🎨 Styling Media

### Image Styling
```markdown
![Image with custom styling](Assets/image.jpg){.center .shadow}

<!-- Center alignment -->
<div align="center">
  <img src="Assets/image.jpg" alt="Centered image" width="600">
</div>
```

### Gallery Layout
```html
<div class="image-gallery">
  <img src="Assets/gallery/1.jpg" alt="Image 1">
  <img src="Assets/gallery/2.jpg" alt="Image 2">
  <img src="Assets/gallery/3.jpg" alt="Image 3">
</div>
```

## 🔍 SEO & Social Media

### Enhanced Frontmatter
```yaml
# SEO & Social
description: "Custom meta description for SEO"
keywords: [keyword1, keyword2, keyword3]
author: "Your Name"

# Social sharing
featuredImage: "Assets/social-banner.jpg"  # Used by social platforms
```

### Open Graph Tags
The featuredImage automatically becomes the preview image when shared on:
- Twitter
- Facebook
- LinkedIn
- Discord
- Other social platforms

## 📱 Responsive Images

### Multiple Sizes
```markdown
<!-- Responsive image with srcset -->
<img src="Assets/image-800.jpg"
     srcset="Assets/image-400.jpg 400w,
             Assets/image-800.jpg 800w,
             Assets/image-1200.jpg 1200w"
     sizes="(max-width: 600px) 400px,
            (max-width: 900px) 800px,
            1200px"
     alt="Responsive image">
```

## ⚡ Performance Tips

### Image Optimization
1. **Compress images** before uploading
2. **Use WebP format** when possible
3. **Resize appropriately** - don't upload huge images
4. **Lazy loading** is handled automatically

### File Naming
```
✅ Good: blog-post-feature-image.jpg
✅ Good: tutorial-step-1-screenshot.png
❌ Bad: IMG_20250118_154233.jpg
❌ Bad: Screenshot 2025-01-18 at 3.42.33 PM.png
```

## 🎯 Content Types

### Article with Featured Image
```yaml
featuredImage: "Assets/article-banner.jpg"
thumbnail: "Assets/article-thumb.jpg"
```

### Tutorial with Screenshots
```yaml
featuredImage: "Assets/tutorial-cover.jpg"
gallery: [
  "Assets/tutorial/step1.png",
  "Assets/tutorial/step2.png",
  "Assets/tutorial/step3.png"
]
```

### Video Post
```yaml
featuredImage: "Assets/video-poster.jpg"
video: "https://youtube.com/watch?v=VIDEO_ID"
```

### Podcast Episode
```yaml
featuredImage: "Assets/podcast-cover.jpg"
audio: "Assets/podcast/episode-01.mp3"
```

## 🔗 Integration with Posts Page

The `posts.md` page automatically uses:
- `featuredImage` for featured posts section
- `thumbnail` for post listings
- `excerpt` for post previews

Example in posts listing:
```markdown
### [[my-post|Post Title]]
*January 18, 2025*

![Thumbnail](Assets/my-post-thumb.jpg)

Brief excerpt about the post content...

**Tags:** #tag1, #tag2
```

---

## 🚀 Quick Checklist

Before publishing a post with media:

- [ ] Images stored in appropriate `Assets/` subfolder
- [ ] Featured image added to frontmatter
- [ ] Thumbnail created (optional)
- [ ] Images optimized for web
- [ ] Alt text provided for accessibility
- [ ] Media referenced correctly in post content
- [ ] Posts page updated if manually curated

**Happy blogging with rich media!** 📸🎬🎵