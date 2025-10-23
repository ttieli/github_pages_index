# Research: GitHub Pages Project Index

**Feature**: GitHub Pages Project Index
**Branch**: 001-pages-index
**Date**: 2025-10-23

## Purpose

This document captures research findings and technical decisions for implementing a static index page that lists GitHub Pages projects. The research focuses on best practices for static HTML pages, responsive design patterns, and GitHub Pages deployment requirements.

## Research Areas

### 1. Static HTML/CSS/JS Best Practices

**Decision**: Use semantic HTML5 with minimal vanilla JavaScript

**Rationale**:
- Semantic HTML improves accessibility and SEO
- No framework overhead reduces page load time
- Vanilla JS sufficient for simple interactions (hover effects, optional filtering)
- Easier to maintain for developers with basic HTML knowledge (aligns with FR-007)

**Alternatives Considered**:
- **React/Vue framework**: Rejected - unnecessary complexity for a static list; violates Principle III (Simplicity Over Complexity)
- **Static site generator (Jekyll/Hugo)**: Rejected - adds build step complexity when hardcoded HTML is simpler for this use case
- **CSS framework (Bootstrap/Tailwind)**: Considered but not required for MVP; can add later if needed for P3 features

**Best Practices to Follow**:
- Use semantic HTML5 elements (`<header>`, `<main>`, `<nav>`, `<article>`, `<section>`)
- Implement progressive enhancement (works without JS, enhanced with JS)
- Follow accessibility guidelines (ARIA labels, keyboard navigation, focus management)
- Use CSS custom properties (CSS variables) for theming and maintainability

### 2. Responsive Design Patterns

**Decision**: Mobile-first CSS with CSS Grid and Flexbox

**Rationale**:
- CSS Grid ideal for card-based layouts (project tiles)
- Flexbox excellent for component-level alignment
- Mobile-first approach ensures baseline experience on all devices
- No media query frameworks needed - custom breakpoints sufficient

**Responsive Strategy**:
```
Mobile (320px-767px):   Single column, stacked cards
Tablet (768px-1023px):  2 columns
Desktop (1024px+):      3-4 columns with max-width container
```

**Alternatives Considered**:
- **Table-based layout**: Rejected - poor mobile experience, outdated approach
- **Float-based layout**: Rejected - CSS Grid/Flexbox are modern standards
- **Responsive framework**: Deferred to P3 if complexity warrants it

**Best Practices to Follow**:
- Use viewport meta tag for proper mobile rendering
- Implement fluid typography (rem/em units, clamp() function)
- Touch-friendly targets (minimum 44x44px for interactive elements)
- Test on real devices or browser dev tools

### 3. GitHub Pages Deployment

**Decision**: Deploy from repository root with index.html at root level

**Rationale**:
- GitHub Pages serves index.html from root or /docs folder automatically
- Root-level deployment is simplest (no configuration needed)
- Compatible with custom domains if needed in future
- No build step required for static HTML

**GitHub Pages Requirements**:
- Repository must be public (or GitHub Pro for private repos)
- Enable GitHub Pages in repository settings
- Select source: main branch, root folder
- Files starting with underscore are ignored (ensure no _files in deployment)
- Custom domain optional via CNAME file

**Alternatives Considered**:
- **/docs folder**: Deferred - root is simpler for initial deployment
- **gh-pages branch**: Rejected - unnecessary branch management for static site
- **GitHub Actions build**: Rejected - no build step needed

### 4. HTML Structure for Hardcoded Project Data

**Decision**: Use HTML `<article>` elements with data attributes for metadata

**Rationale**:
- Semantic HTML clearly represents each project as an independent article
- Data attributes (`data-category`, `data-status`) enable future filtering without changing HTML structure
- Easy to copy/paste project template when adding new entries
- Maintainable by developers with basic HTML knowledge

**HTML Pattern**:
```html
<article class="project-card" data-category="web-app" data-status="active">
  <h2 class="project-title">
    <a href="https://example.github.io/project1/">Project Title</a>
  </h2>
  <p class="project-description">Brief description of the project...</p>
  <div class="project-meta">
    <span class="category">Web App</span>
    <span class="status">Active</span>
  </div>
</article>
```

**Alternatives Considered**:
- **JSON data file**: Rejected - adds JavaScript loading complexity; chosen for hardcoded approach (per FR-007)
- **Unordered list `<ul>`**: Rejected - `<article>` is more semantically appropriate
- **Definition list `<dl>`**: Considered but `<article>` better represents independent projects

### 5. CSS Architecture

**Decision**: Single CSS file with BEM naming convention

**Rationale**:
- BEM (Block Element Modifier) improves CSS maintainability
- Single file avoids HTTP request overhead for small project
- CSS custom properties enable theming without preprocessor
- Mobile-first media queries for responsive design

**CSS Organization**:
```
1. CSS Reset/Normalize
2. CSS Custom Properties (variables)
3. Base styles (html, body, typography)
4. Layout (container, grid system)
5. Components (project-card, header, footer)
6. Utilities (margin, padding, text helpers)
7. Media queries (tablet, desktop breakpoints)
```

**Alternatives Considered**:
- **CSS preprocessor (Sass/Less)**: Rejected - adds build step; CSS variables sufficient
- **Multiple CSS files**: Rejected - single file simpler for small project
- **CSS-in-JS**: Rejected - requires JavaScript framework

### 6. Accessibility Considerations

**Decision**: WCAG 2.1 Level AA compliance

**Rationale**:
- Legal and ethical requirement for public websites
- Improves usability for all users
- Search engine optimization benefit

**Accessibility Features**:
- Semantic HTML structure
- Sufficient color contrast (4.5:1 for normal text)
- Keyboard navigation support
- Focus visible states for interactive elements
- ARIA labels where semantic HTML insufficient
- Alt text for images (if added in future)
- Skip links for keyboard users

**Testing Approach**:
- Browser accessibility tools (Chrome DevTools Lighthouse, axe DevTools)
- Keyboard-only navigation testing
- Screen reader testing (optional but recommended)

### 7. Performance Optimization

**Decision**: Inline critical CSS, defer non-critical resources

**Rationale**:
- Inline critical CSS eliminates render-blocking request
- Minimal JavaScript can be deferred or loaded async
- No external dependencies means fast load times

**Performance Strategy**:
- Inline critical CSS in `<head>` (above-the-fold styles)
- Link external CSS with media queries for conditional loading
- Optimize images with appropriate formats (WebP with fallbacks)
- Use lazy loading for images below fold (if many projects)
- Minify HTML/CSS/JS for production (manual or GitHub Actions)

**Metrics to Monitor**:
- First Contentful Paint (FCP) < 1 second
- Total page load < 3 seconds
- Lighthouse Performance score > 90

## Technical Decisions Summary

| Area | Decision | Justification |
|------|----------|---------------|
| **HTML** | Semantic HTML5, hardcoded data | Simplicity, maintainability, aligns with FR-007 |
| **CSS** | Single file, BEM, CSS Grid/Flexbox | Modern standards, mobile-first, no build step |
| **JavaScript** | Vanilla JS (minimal/optional) | No framework overhead, progressive enhancement |
| **Deployment** | GitHub Pages root folder | Zero configuration, simple setup |
| **Structure** | `<article>` with data attributes | Semantic, extensible for P3 metadata features |
| **Accessibility** | WCAG 2.1 Level AA | Legal compliance, better UX |
| **Performance** | Inline critical CSS, optimize assets | Meets < 3s load goal |

## Risks and Mitigations

| Risk | Impact | Mitigation |
|------|--------|-----------|
| **Scalability**: 100+ projects may cause long page | Medium | Implement pagination or filtering in P3 if needed |
| **Maintenance burden**: Manual HTML editing error-prone | Low | Clear template pattern, validation tools recommended |
| **Browser compatibility**: CSS Grid not in IE11 | Very Low | IE11 unsupported, focus on modern browsers |
| **Accessibility gaps**: Manual testing may miss issues | Medium | Use automated tools (Lighthouse, axe), follow best practices |

## Next Steps (Phase 1)

1. Generate data-model.md (structure of Project entity)
2. Create contracts/ (N/A for static site, document HTML structure instead)
3. Generate quickstart.md (setup and deployment guide)
4. Update agent context with technology decisions
