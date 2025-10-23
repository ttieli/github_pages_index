# HTML Structure Contract

**Feature**: GitHub Pages Project Index
**Date**: 2025-10-23
**Purpose**: Define the expected HTML structure and CSS class naming conventions

## Overview

Since this is a static HTML page with no API endpoints, this "contract" documents the HTML structure and CSS class conventions that must be followed for consistency and maintainability.

## Page Structure Contract

### Document Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Index of all my GitHub Pages projects">
  <title>GitHub Pages Project Index</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <header class="site-header">
    <!-- Header content -->
  </header>

  <main class="projects-container">
    <!-- Main content -->
  </main>

  <footer class="site-footer">
    <!-- Footer content -->
  </footer>

  <script src="js/main.js" defer></script>
</body>
</html>
```

**Required Elements**:
- `<!DOCTYPE html>`: HTML5 doctype
- `<html lang="en">`: Language attribute for accessibility
- `<meta charset="UTF-8">`: Character encoding
- `<meta name="viewport">`: Mobile responsiveness
- `<title>`: Page title (SEO and browser tab)
- `<link rel="stylesheet">`: CSS file reference
- `<header>`, `<main>`, `<footer>`: Semantic structure
- `<script defer>`: JavaScript (optional, deferred loading)

## Component Contracts

### Header Component

**Purpose**: Site branding and navigation (if needed)

```html
<header class="site-header">
  <div class="header-container">
    <h1 class="site-title">My GitHub Pages Projects</h1>
    <p class="site-description">A collection of my web projects</p>
  </div>
</header>
```

**Required Classes**:
- `.site-header`: Container for header
- `.site-title`: Main heading
- `.site-description` (optional): Subtitle or tagline

### Main Content Container

**Purpose**: Holds the projects grid

```html
<main class="projects-container">
  <section class="projects-grid">
    <!-- Project cards -->
  </section>
</main>
```

**Required Classes**:
- `.projects-container`: Main content wrapper
- `.projects-grid`: CSS Grid container for project cards

### Project Card Component (P1 MVP)

**Purpose**: Display a single project

```html
<article class="project-card">
  <h2 class="project-title">
    <a href="[URL]" class="project-link">[Title]</a>
  </h2>
  <p class="project-description">[Description]</p>
</article>
```

**Required Classes**:
- `.project-card`: Card container (article element)
- `.project-title`: Project name (h2 element)
- `.project-link`: Clickable link (a element)
- `.project-description`: Description text (p element)

**Required Attributes**:
- `href` on `.project-link`: Valid URL to the project

### Project Card with Metadata (P3)

**Purpose**: Display project with additional metadata

```html
<article class="project-card" data-category="[category-slug]" data-status="[status]">
  <h2 class="project-title">
    <a href="[URL]" class="project-link">[Title]</a>
  </h2>
  <p class="project-description">[Description]</p>
  <div class="project-meta">
    <span class="category badge">[Category]</span>
    <span class="status badge badge-[status]">[Status]</span>
  </div>
</article>
```

**Additional Classes** (P3):
- `.project-meta`: Container for metadata
- `.category`: Category tag
- `.status`: Status tag
- `.badge`: Generic badge styling
- `.badge-active`, `.badge-archived`, etc.: Status-specific styling

**Additional Attributes** (P3):
- `data-category`: Lowercase category slug (for filtering)
- `data-status`: Status value (for filtering and styling)

### Footer Component

**Purpose**: Site footer with optional links

```html
<footer class="site-footer">
  <div class="footer-container">
    <p class="footer-text">
      &copy; 2025 [Your Name]. View on
      <a href="https://github.com/[username]/[repo]" class="footer-link">GitHub</a>
    </p>
  </div>
</footer>
```

**Required Classes**:
- `.site-footer`: Footer container
- `.footer-container`: Inner wrapper
- `.footer-text`: Footer text content
- `.footer-link` (optional): Links in footer

## CSS Class Naming Convention (BEM)

**Block Element Modifier (BEM)** pattern:

- **Block**: `.project-card`
- **Element**: `.project-card__title`, `.project-card__description`
- **Modifier**: `.project-card--featured`, `.project-card--archived`

**Simplified Convention** (used in this project):
- **Block**: `.project-card`
- **Child**: `.project-title`, `.project-description` (nested within block)
- **State**: `.badge-active`, `.badge-archived` (modifies appearance)

**Rationale**: Simplified convention easier for HTML editors; still maintains clarity.

## Responsive Behavior Contract

### Breakpoints

```css
/* Mobile-first (default) */
/* 320px - 767px: single column */

/* Tablet */
@media (min-width: 768px) {
  /* 2 columns */
}

/* Desktop */
@media (min-width: 1024px) {
  /* 3-4 columns */
}
```

### Grid Layout Contract

**Mobile** (default):
```css
.projects-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
}
```

**Tablet**:
```css
@media (min-width: 768px) {
  .projects-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 2rem;
  }
}
```

**Desktop**:
```css
@media (min-width: 1024px) {
  .projects-grid {
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
  }
}
```

## Accessibility Contract

### Required Accessibility Features

1. **Semantic HTML**: Use proper heading hierarchy (h1 → h2)
2. **Link Accessibility**:
   - Descriptive link text (avoid "click here")
   - Visible focus states
   - Minimum 44x44px touch target
3. **Color Contrast**: 4.5:1 minimum for normal text
4. **Keyboard Navigation**: All interactive elements accessible via Tab key
5. **ARIA Labels** (if needed):
   ```html
   <a href="[URL]" aria-label="Visit [Project Name] project page">[Title]</a>
   ```

### Focus States

All interactive elements MUST have visible focus indicators:

```css
.project-link:focus {
  outline: 2px solid #0066cc;
  outline-offset: 2px;
}
```

## Empty State Contract

When no projects exist:

```html
<main class="projects-container">
  <section class="projects-grid">
    <div class="empty-state">
      <p class="empty-state-text">No projects available yet.</p>
    </div>
  </section>
</main>
```

**Required Classes**:
- `.empty-state`: Container for empty message
- `.empty-state-text`: Message text

## JavaScript Interaction Contract (P2/P3)

### Hover Effects (P2)

CSS-based hover effects (no JavaScript required):

```css
.project-card {
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.project-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.project-link:hover {
  color: #0066cc;
  text-decoration: underline;
}
```

### Filtering (P3 - Optional)

If implementing JavaScript filtering:

```javascript
// Filter by category
function filterByCategory(category) {
  const cards = document.querySelectorAll('.project-card');
  cards.forEach(card => {
    const cardCategory = card.dataset.category;
    card.style.display =
      (category === 'all' || cardCategory === category) ? 'block' : 'none';
  });
}
```

## Validation Requirements

1. **HTML Validation**: Must pass W3C HTML validator
2. **CSS Validation**: Must pass W3C CSS validator
3. **Accessibility**: Must pass WAVE or axe accessibility checker
4. **Lighthouse**: Performance score > 90, Accessibility score > 90

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2025-10-23 | Initial structure contract for P1 MVP |

## Notes for Implementers

- Follow the class naming conventions exactly for CSS consistency
- Maintain semantic HTML structure for SEO and accessibility
- Test on mobile devices or browser dev tools at 320px, 768px, 1024px
- Run HTML through validator before deployment
- Keep structure simple; avoid nested divs unless necessary
