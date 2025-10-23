# GitHub Pages Project Index

A centralized index page that lists all my GitHub Pages projects with titles, descriptions, and clickable links.

## Overview

This project provides a simple, static HTML page that serves as a directory for all my GitHub Pages projects. Visitors can quickly discover and access any project from a single, easy-to-navigate index.

## Features

- **Visual Project Differentiation**: Color-coded category badges (Management, Learning, Utility)
- **Rich Metadata Display**: Technology tags, status badges, and key feature highlights
- **Enhanced Design System**: Professional typography, spacing, and visual hierarchy
- **Project Icons**: Emoji icons for quick visual recognition
- **Responsive Design**: Works seamlessly on mobile (320px+), tablet, and desktop devices
- **Easy to Maintain**: Add new projects with enhanced styling in < 10 minutes
- **Fast Loading**: Static HTML with no dependencies or build tools
- **Accessible**: WCAG 2.1 Level AA compliant with screen reader support

## Quick Start

### Viewing Locally

1. Clone this repository:
   ```bash
   git clone https://github.com/[username]/github_pages_index.git
   cd github_pages_index
   ```

2. Open `index.html` in your browser:
   ```bash
   # macOS
   open index.html

   # Linux
   xdg-open index.html

   # Windows
   start index.html
   ```

   Or use a local server:
   ```bash
   python3 -m http.server 8000
   # Visit http://localhost:8000
   ```

### Deploying to GitHub Pages

1. Push your code to GitHub:
   ```bash
   git add .
   git commit -m "Initial commit: GitHub Pages project index"
   git push origin main
   ```

2. Enable GitHub Pages:
   - Go to repository **Settings** on GitHub
   - Navigate to the **Pages** section
   - Under **Source**, select **main** branch and **/ (root)** folder
   - Click **Save**

3. Your index will be live at:
   ```
   https://[username].github.io/github_pages_index/
   ```

## Adding a New Project

1. Open `index.html` in your text editor
2. Find the `<section class="projects-grid">` element
3. Copy an existing project card or use this enhanced template:

```html
<article class="project-card" data-category="[CATEGORY]" data-status="[STATUS]">
  <div class="project-icon" role="img" aria-label="[CATEGORY] project">[ICON]</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://username.github.io/new-project/" class="project-link">New Project Name</a>
    </h2>
  </header>
  <p class="project-description">Brief description of what this project does.</p>
  <div class="project-technologies" aria-label="Technologies used">
    <span class="tech-tag">Technology 1</span>
    <span class="tech-tag">Technology 2</span>
  </div>
  <ul class="project-features" aria-label="Key features">
    <li>Feature 1</li>
    <li>Feature 2</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="[CATEGORY]">
      <span class="visually-hidden">Category:</span>
      [CATEGORY_NAME]
    </span>
    <span class="status-badge" data-status="[STATUS]" role="status">
      <span class="badge-icon" aria-hidden="true">[SYMBOL]</span>
      <span class="badge-text">[STATUS_NAME]</span>
    </span>
  </footer>
</article>
```

4. Replace placeholders:
   - `[CATEGORY]`: `management`, `learning`, `utility`, or `portfolio`
   - `[CATEGORY_NAME]`: `Management`, `Learning`, `Utility`, or `Portfolio`
   - `[ICON]`: 📊 (management), 📚 (learning), 🔧 (utility), 🎨 (portfolio)
   - `[STATUS]`: `active`, `beta`, `archived`, or `experimental`
   - `[STATUS_NAME]`: `Active`, `Beta`, `Archived`, or `Experimental`
   - `[SYMBOL]`: ● (active), ⚡ (beta), ■ (archived), ▲ (experimental)

5. Save the file
6. Commit and push:

```bash
git add index.html
git commit -m "Add [project name] to index"
git push
```

7. Wait 1-2 minutes for GitHub Pages to rebuild

**Time to add a project**: < 10 minutes

## Design System Reference

### Category Colors

| Category | Color | Icon | Usage |
|----------|-------|------|-------|
| Management | Blue (#0066CC) | 📊 | Project management, tracking, administration tools |
| Learning | Green (#047857) | 📚 | Educational apps, learning tools, flashcards |
| Utility | Purple (#7C3AED) | 🔧 | Tools, utilities, helpers |
| Portfolio | Red-Orange (#DC2626) | 🎨 | Portfolio sites, showcases |

### Status Badges

| Status | Color | Symbol | Meaning |
|--------|-------|--------|---------|
| Active | Green (#10B981) | ● | Actively maintained |
| Beta | Blue (#3B82F6) | ⚡ | In beta testing |
| Archived | Gray (#6B7280) | ■ | No longer maintained |
| Experimental | Amber (#F59E0B) | ▲ | Experimental/proof-of-concept |

### Typography

- **System Font Stack**: No external fonts loaded for optimal performance
- **8pt Baseline Grid**: Consistent spacing (8px, 16px, 24px, 32px, etc.)
- **Responsive Sizes**: Automatically adjusts for mobile, tablet, and desktop

### Accessibility Features

- **ARIA Labels**: All metadata sections properly labeled for screen readers
- **Multi-modal Badges**: Never rely on color alone (includes symbols and text)
- **Keyboard Navigation**: Full keyboard support with visible focus states
- **Semantic HTML**: Proper use of `<header>`, `<footer>`, `<article>` tags

## Project Structure

```
github_pages_index/
├── index.html          # Main index page
├── css/
│   └── styles.css      # Styling
├── js/
│   └── main.js         # Optional JavaScript (future enhancements)
├── assets/
│   └── favicon.ico     # Site icon
├── README.md           # This file
└── .specify/           # Project specifications (not deployed)
```

## Technology Stack

- **HTML5**: Semantic markup
- **CSS3**: Responsive design with CSS Grid and Flexbox
- **JavaScript**: Vanilla JS (minimal, optional enhancements)
- **GitHub Pages**: Static hosting

No frameworks, no build tools, no dependencies.

## Browser Support

- Chrome (latest 2 versions)
- Firefox (latest 2 versions)
- Safari (latest 2 versions)
- Edge (latest 2 versions)

## Performance

- Page load time: < 3 seconds on standard broadband
- First Contentful Paint: < 1 second
- Lighthouse scores: Performance > 90, Accessibility > 90

## Contributing

This is a personal project index, but feel free to fork it for your own use!

## License

MIT License - feel free to use this template for your own project index.

## Contact

- GitHub: [@[username]](https://github.com/[username])
- Website: [https://[username].github.io](https://[username].github.io)

---

**Last Updated**: 2025-10-23
