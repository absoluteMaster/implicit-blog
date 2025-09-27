---
title: "How to Use This Blog Vault"
date: 2025-01-18
status: published
type: guide
tags: [documentation, guide, blogging]
featured: true
excerpt: "Complete guide to using this Obsidian vault for blog publishing with Quartz"
---

# How to Use This Blog Vault

This Obsidian vault is perfectly integrated with Quartz to create a seamless blogging workflow. Here's everything you need to know to publish beautiful blog posts.

## 📁 Vault Structure

```
ObsidianVault/
├── 📝 Blog/                    # ← Published content (Quartz watches this)
│   ├── Posts/                 # Final published posts
│   ├── Drafts/                # Work-in-progress (hidden from site)
│   ├── Pages/                 # Static pages (About, Contact)
│   ├── Series/                # Multi-part content
│   ├── Templates/             # Post templates & this guide
│   ├── Assets/                # Images, files, media
│   └── index.md               # Blog homepage
├── 🔒 Personal/               # Private notes (never published)
├── 💼 Work/                   # Work notes (never published)
├── 💡 Ideas/                  # Blog ideas & brainstorming
└── 📚 Knowledge/              # Reference materials
```

## ✨ Publishing Workflow

### 1. **Start with an Idea**
- Brainstorm in `Ideas/` folder
- Research in `Knowledge/` folder
- Keep personal thoughts in `Personal/`

### 2. **Create a New Post**
1. Use the template: `Templates/blog-post-template.md`
2. Save it in `Drafts/` folder
3. Start with `status: draft`

### 3. **Write Your Post**
- Use all Obsidian features (wikilinks, tags, etc.)
- Add images to `Assets/` folder
- Link to other posts with `[[filename]]`

### 4. **Publish When Ready**
1. Move from `Drafts/` to `Posts/` folder
2. Change `status: draft` to `status: published`
3. Set your publication date
4. Quartz auto-rebuilds and shows it live!

## 🎛️ Frontmatter Controls

Every blog post needs frontmatter at the top:

```yaml
---
title: "Your Post Title"
date: 2025-01-18
status: published          # Controls visibility
tags: [tag1, tag2]         # Categorization
categories: [tutorials]    # Broad grouping
series: "Series Name"      # Multi-part posts
featured: true             # Highlight on homepage
excerpt: "Brief summary"   # Meta description
slug: "custom-url"         # Override URL
permalink: "/custom/path/" # Full path override
---
```

### Status Options
- `draft` → Not visible on site
- `review` → Ready for review (not published)
- `published` → Live on the site
- `archived` → Removed from site but kept in source

## 🔗 Linking Between Posts

Use Obsidian's wikilink syntax:
- `[[post-filename]]` → Links to another post
- `[[post-filename|Custom Text]]` → Link with custom text
- `[[about]]` → Links to the About page

**Important:** Wikilinks must match exact filenames (without .md)

## 📂 Folder Guidelines

### Posts/
- ✅ Final, published blog posts
- ✅ Status must be `published` or `review`
- ✅ Complete with proper frontmatter

### Drafts/
- ✅ Work-in-progress posts
- ✅ Status should be `draft`
- ✅ Safe to experiment and iterate

### Pages/
- ✅ Static pages (About, Contact, etc.)
- ✅ Usually `type: page` in frontmatter
- ✅ Permalinks recommended

### Series/
- ✅ Multi-part content
- ✅ Use `series: "Series Name"` in frontmatter
- ✅ Number them for order: `01-intro.md`, `02-setup.md`

### Templates/
- ✅ Post templates for consistency
- ✅ This guide and documentation
- ✅ Hidden from public site

### Assets/
- ✅ Images: `![Description](Assets/image.png)`
- ✅ Files and downloads
- ✅ Media assets

## 🚀 Advanced Tips

### Creating Series
1. Create folder in `Series/`
2. Use consistent frontmatter:
   ```yaml
   series: "Building a Blog"
   ```
3. Number files for order

### Using Tags Effectively
- Keep tags consistent and meaningful
- Use broad categories for organization
- Tags become browseable on your site

### Image Management
- Store all images in `Assets/`
- Use descriptive filenames
- Optimize images before adding

### Private Notes
- Everything outside `Blog/` folder is private
- Perfect for research, personal thoughts, work notes
- Never published to your site

## 🛠️ Technical Details

### What Gets Published
- Only content in `Blog/` folder
- Only files with `status: published` or `status: review`
- Excludes: `Drafts/`, `Templates/`, `README.md`

### File Processing
- Wikilinks become proper navigation
- Tags become browseable categories
- Frontmatter controls SEO and display
- Markdown becomes beautiful HTML

### Local Development
- Changes appear instantly at `http://localhost:8080`
- No deployment needed for local use
- Perfect for writing and previewing

## 🎯 Best Practices

1. **Start Small** → Begin with drafts, perfect them
2. **Be Consistent** → Use templates for uniform structure
3. **Link Liberally** → Connect related posts with wikilinks
4. **Tag Wisely** → Create a consistent tagging system
5. **Preview Often** → Check your local site frequently
6. **Organize Logically** → Use the folder structure intentionally

## 🆘 Troubleshooting

### Post Not Showing?
- Check status is `published` or `review`
- Verify file is in `Posts/` folder (not `Drafts/`)
- Ensure proper frontmatter format

### Broken Links?
- Wikilinks must match exact filenames
- Use `[[welcome-to-implicit]]` not `[[Welcome to Implicit]]`
- Check file actually exists

### Images Not Loading?
- Images must be in `Assets/` folder
- Use relative path: `Assets/image.png`
- Check filename spelling and case

---

## 🎉 You're Ready!

This vault is now your blogging command center. Write freely, publish confidently, and create beautiful content that connects with your readers.

**Happy blogging!** 🚀

---
*Last updated: 2025-01-18*
*For technical questions, check the Quartz documentation or modify the configuration files.*