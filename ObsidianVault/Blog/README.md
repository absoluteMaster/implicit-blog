# Blog Content Structure

This folder contains all content that will be published to your blog via Quartz.

## Folder Organization

- **Posts/**: Published blog posts
- **Drafts/**: Work-in-progress posts (not published)
- **Pages/**: Static pages (About, Contact, etc.)
- **Series/**: Multi-part content series
- **Templates/**: Post and page templates
- **Assets/**: Images, files, and media

## Publishing Workflow

1. Create new post using template in `Templates/`
2. Work on it in `Drafts/` folder
3. When ready, move to `Posts/` and change status to "published"
4. Quartz will automatically rebuild and show the post

## Status Options

- `draft`: Not visible on site
- `review`: Ready for review (not published)
- `published`: Live on the site
- `archived`: Removed from site but kept in source

## Linking Between Posts

Use Obsidian wikilinks: `[[Other Post Title]]` to link between posts.
These will automatically become proper links on your published site.