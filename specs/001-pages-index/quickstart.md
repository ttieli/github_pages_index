# Quickstart Guide: GitHub Pages Project Index

**Feature**: GitHub Pages Project Index
**Branch**: 001-pages-index
**Date**: 2025-10-23

## Overview

This guide walks you through setting up, developing, and deploying the GitHub Pages Project Index. The entire process should take 15-30 minutes for the P1 MVP.

## Prerequisites

- Git installed on your machine
- GitHub account
- Text editor (VS Code, Sublime Text, Atom, or any HTML editor)
- Web browser (Chrome, Firefox, Safari, or Edge)
- Basic HTML/CSS knowledge (helpful but not required)

## Quick Start (5 Minutes to MVP)

### Step 1: Clone or Create Repository

```bash
# Option A: If repository exists
git clone https://github.com/[username]/github_pages_index.git
cd github_pages_index

# Option B: Create new repository
mkdir github_pages_index
cd github_pages_index
git init
git branch -M main
```

### Step 2: Create index.html

Create `index.html` in the root directory with this minimal structure:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My GitHub Pages Projects</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <header class="site-header">
    <h1 class="site-title">My GitHub Pages Projects</h1>
  </header>

  <main class="projects-container">
    <section class="projects-grid">

      <!-- Add your projects here using this template -->
      <article class="project-card">
        <h2 class="project-title">
          <a href="https://username.github.io/example-project/">Example Project</a>
        </h2>
        <p class="project-description">A brief description of this project.</p>
      </article>

      <!-- Copy and paste the above block for each project -->

    </section>
  </main>

  <footer class="site-footer">
    <p>&copy; 2025 Your Name</p>
  </footer>
</body>
</html>
```

### Step 3: Create CSS

Create `css/styles.css`:

```bash
mkdir css
```

Add this minimal CSS to `css/styles.css`:

```css
/* CSS Reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Base Styles */
body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
  line-height: 1.6;
  color: #333;
  padding: 20px;
}

/* Header */
.site-header {
  text-align: center;
  margin-bottom: 2rem;
}

.site-title {
  font-size: 2rem;
  color: #0066cc;
}

/* Projects Grid */
.projects-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
  max-width: 1200px;
  margin: 0 auto;
}

/* Project Card */
.project-card {
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 1.5rem;
  transition: box-shadow 0.2s ease;
}

.project-card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.project-title a {
  color: #0066cc;
  text-decoration: none;
}

.project-title a:hover {
  text-decoration: underline;
}

.project-description {
  margin-top: 0.5rem;
  color: #666;
}

/* Footer */
.site-footer {
  text-align: center;
  margin-top: 3rem;
  padding-top: 2rem;
  border-top: 1px solid #ddd;
  color: #666;
}

/* Responsive Design */
@media (min-width: 768px) {
  .projects-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 2rem;
  }
}

@media (min-width: 1024px) {
  .projects-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

### Step 4: Test Locally

Open `index.html` in your browser:

```bash
# macOS
open index.html

# Linux
xdg-open index.html

# Windows
start index.html

# Or use a local server (recommended)
python3 -m http.server 8000
# Then visit http://localhost:8000
```

### Step 5: Deploy to GitHub Pages

```bash
# Add all files
git add .

# Commit
git commit -m "Initial commit: GitHub Pages project index"

# Push to GitHub (if not already connected)
git remote add origin https://github.com/[username]/github_pages_index.git
git push -u origin main

# Enable GitHub Pages
# 1. Go to repository Settings on GitHub
# 2. Scroll to "Pages" section
# 3. Under "Source", select "main" branch and "/ (root)" folder
# 4. Click "Save"
# 5. Wait 1-2 minutes for deployment
# 6. Visit https://[username].github.io/github_pages_index/
```

🎉 **Your project index is now live!**

## Development Workflow

### Adding a New Project

1. Open `index.html` in your text editor
2. Find the `<section class="projects-grid">` element
3. Copy this template:

```html
<article class="project-card">
  <h2 class="project-title">
    <a href="https://username.github.io/new-project/">New Project Name</a>
  </h2>
  <p class="project-description">Brief description of what this project does.</p>
</article>
```

4. Paste it inside `<section class="projects-grid">`
5. Replace the placeholders:
   - `https://username.github.io/new-project/` → actual project URL
   - `New Project Name` → actual project title
   - `Brief description...` → actual description (keep it short, 1-2 sentences)
6. Save the file
7. Test locally (open in browser)
8. Commit and push:

```bash
git add index.html
git commit -m "Add [project name] to index"
git push
```

9. Wait 1-2 minutes for GitHub Pages to rebuild
10. Verify changes at your live site

**Time to add a project**: < 5 minutes ✅ (meets SC-005)

### Editing an Existing Project

1. Open `index.html`
2. Find the project card you want to edit (search for the project title)
3. Update the desired fields (title, URL, or description)
4. Save, test locally, commit, and push

### Removing a Project

1. Open `index.html`
2. Find the project card's `<article>` element
3. Delete the entire `<article>...</article>` block
4. Save, test, commit, and push

## Testing Checklist

Before deploying changes, verify:

- [ ] HTML opens in browser without errors
- [ ] All project links work (click each one)
- [ ] Page looks good on mobile (resize browser to 320px width)
- [ ] Page looks good on tablet (768px width)
- [ ] Page looks good on desktop (1024px+ width)
- [ ] No broken images or missing CSS
- [ ] Hover effects work on links
- [ ] Footer displays correctly

### Recommended Testing Tools

**HTML Validation**:
- W3C Validator: https://validator.w3.org/
- Upload your `index.html` or paste the code

**CSS Validation**:
- W3C CSS Validator: https://jigsaw.w3.org/css-validator/
- Upload your `css/styles.css`

**Accessibility**:
- WAVE: https://wave.webaim.org/
- Enter your live URL after deployment

**Performance**:
- Google Lighthouse (Chrome DevTools)
- Open DevTools → Lighthouse → Generate report
- Aim for Performance > 90, Accessibility > 90

## Customization (Optional)

### Change Colors

Edit `css/styles.css`:

```css
/* Change primary color */
.site-title {
  color: #ff6600; /* Change from #0066cc */
}

.project-title a {
  color: #ff6600;
}
```

### Add a Logo or Icon

Add to `<header>` in `index.html`:

```html
<header class="site-header">
  <img src="assets/logo.png" alt="Logo" class="site-logo">
  <h1 class="site-title">My GitHub Pages Projects</h1>
</header>
```

Create `assets/` folder and add your logo image.

### Add Favicon

Add to `<head>` in `index.html`:

```html
<link rel="icon" href="assets/favicon.ico" type="image/x-icon">
```

Place `favicon.ico` in the `assets/` folder.

## Troubleshooting

### Page Not Loading on GitHub Pages

- **Check Settings**: Ensure GitHub Pages is enabled in repository settings
- **Wait**: Deployment can take 1-2 minutes
- **Branch**: Verify correct branch selected (usually `main`)
- **File Name**: Ensure file is named `index.html` (case-sensitive on Linux servers)

### Broken Links

- **Protocol**: Use full URLs with `https://`
- **Typos**: Check for spelling errors in URLs
- **Visibility**: Ensure linked projects are public and accessible

### CSS Not Loading

- **Path**: Verify `<link rel="stylesheet" href="css/styles.css">` path is correct
- **File Exists**: Ensure `css/styles.css` file exists and is committed
- **Cache**: Try hard refresh (Cmd+Shift+R on Mac, Ctrl+Shift+R on Windows)

### Mobile Display Issues

- **Viewport**: Ensure `<meta name="viewport">` tag is present in `<head>`
- **Responsive CSS**: Check that media queries are included in CSS
- **Test**: Use browser DevTools responsive mode to test different screen sizes

## Next Steps

### P1 MVP Complete ✅

You now have a functional project index! To enhance it:

### P2: Enhanced Navigation

Add these features:
- Visual hover effects (already included in basic CSS)
- Better visual separation between projects
- Improved link styling

### P3: Metadata and Filtering

Add categories and status:

```html
<article class="project-card" data-category="web-app" data-status="active">
  <h2 class="project-title">
    <a href="https://username.github.io/project/">Project Name</a>
  </h2>
  <p class="project-description">Description</p>
  <div class="project-meta">
    <span class="category badge">Web App</span>
    <span class="status badge badge-active">Active</span>
  </div>
</article>
```

Add badge CSS:

```css
.project-meta {
  display: flex;
  gap: 0.5rem;
  margin-top: 1rem;
}

.badge {
  padding: 0.25rem 0.75rem;
  background: #f0f0f0;
  border-radius: 12px;
  font-size: 0.875rem;
}

.badge-active {
  background: #d4edda;
  color: #155724;
}

.badge-archived {
  background: #f8d7da;
  color: #721c24;
}
```

## Resources

- **GitHub Pages Docs**: https://docs.github.com/en/pages
- **HTML Reference**: https://developer.mozilla.org/en-US/docs/Web/HTML
- **CSS Grid Guide**: https://css-tricks.com/snippets/css/complete-guide-grid/
- **Accessibility**: https://www.w3.org/WAI/WCAG21/quickref/

## Support

For issues with this project:
- Review the spec: `specs/001-pages-index/spec.md`
- Check the plan: `specs/001-pages-index/plan.md`
- Consult data model: `specs/001-pages-index/data-model.md`

## Summary

**Time to Deploy MVP**: 15-30 minutes
**Time to Add Project**: < 5 minutes
**No Build Tools Required**: Pure HTML/CSS
**No Framework Dependencies**: Works everywhere

This simple, maintainable solution aligns with the project's constitutional principles of simplicity and quality. Start with P1, deploy, then iterate to P2 and P3 as needed.
