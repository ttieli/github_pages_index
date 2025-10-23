# GitHub Pages Project Index

A centralized index page that lists all my GitHub Pages projects with titles, descriptions, and clickable links.

## Overview

This project provides a simple, static HTML page that serves as a directory for all my GitHub Pages projects. Visitors can quickly discover and access any project from a single, easy-to-navigate index.

## Features

- **Simple Project Listing**: View all projects at a glance with titles and descriptions
- **Responsive Design**: Works seamlessly on mobile, tablet, and desktop devices
- **Easy to Maintain**: Add new projects by editing the HTML file directly
- **Fast Loading**: Static HTML with no dependencies or build tools
- **Accessible**: WCAG 2.1 Level AA compliant

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
3. Copy an existing project card or use this template:

```html
<article class="project-card">
  <h2 class="project-title">
    <a href="https://username.github.io/new-project/">New Project Name</a>
  </h2>
  <p class="project-description">Brief description of what this project does.</p>
</article>
```

4. Replace the URL, title, and description with your project's information
5. Save the file
6. Commit and push:

```bash
git add index.html
git commit -m "Add [project name] to index"
git push
```

7. Wait 1-2 minutes for GitHub Pages to rebuild

**Time to add a project**: < 5 minutes

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
