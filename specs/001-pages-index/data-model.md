# Data Model: GitHub Pages Project Index

**Feature**: GitHub Pages Project Index
**Branch**: 001-pages-index
**Date**: 2025-10-23

## Overview

This document defines the data structure for representing GitHub Pages projects in the index. Since the implementation uses hardcoded HTML (per FR-007), the "data model" describes the HTML structure and attributes rather than database schemas or JSON objects.

## Entities

### Project

Represents a single GitHub Pages project entry displayed on the index page.

**HTML Representation**:
```html
<article class="project-card" data-category="[CATEGORY]" data-status="[STATUS]">
  <h2 class="project-title">
    <a href="[PROJECT_URL]">[PROJECT_TITLE]</a>
  </h2>
  <p class="project-description">[PROJECT_DESCRIPTION]</p>
  <div class="project-meta">
    <span class="category">[CATEGORY_DISPLAY]</span>
    <span class="status">[STATUS_DISPLAY]</span>
  </div>
</article>
```

**Fields**:

| Field | Type | Required | Description | Validation Rules | User Story |
|-------|------|----------|-------------|------------------|------------|
| **title** | String | Yes | Display name of the project | 1-100 characters; no HTML tags | P1 |
| **url** | String (URL) | Yes | Full URL to the project's GitHub Pages site | Valid URL starting with https://; must be accessible | P1 |
| **description** | String | No | Brief summary of what the project does | 0-500 characters; can be empty but recommended | P1 |
| **category** | String | No | Project type/classification | Lowercase slug (e.g., "web-app", "blog", "portfolio"); used for filtering | P3 |
| **categoryDisplay** | String | No | Human-readable category name | Display text (e.g., "Web App", "Blog", "Portfolio") | P3 |
| **status** | String | No | Current project status | One of: "active", "archived", "experimental", "beta" | P3 |
| **statusDisplay** | String | No | Human-readable status | Display text (e.g., "Active", "Archived", "Experimental") | P3 |

**Field Details**:

#### title (Required)
- **Purpose**: Display name shown as the clickable link
- **Format**: Plain text, no HTML
- **Example**: "My Portfolio Website", "React Todo App", "Data Visualization Dashboard"
- **Validation**: Must not be empty; trim whitespace; escape HTML entities
- **Accessibility**: Used in link text for screen readers

#### url (Required)
- **Purpose**: Target URL for navigation
- **Format**: Absolute URL with protocol
- **Example**: "https://username.github.io/project-name/", "https://custom-domain.com/"
- **Validation**: Valid URL format; HTTPS preferred; must be publicly accessible
- **Behavior**: Opens in same tab by default (can be customized with `target="_blank"` for new tab)

#### description (Optional but Recommended)
- **Purpose**: Brief explanation to help visitors understand the project
- **Format**: Plain text; can include basic punctuation
- **Example**: "A responsive portfolio showcasing web development projects", "Interactive data visualization using D3.js"
- **Validation**: Trim whitespace; escape HTML entities; line breaks converted to spaces
- **Empty State**: If missing, card displays with title and link only

#### category (Optional - P3)
- **Purpose**: Used for filtering/grouping projects
- **Format**: Lowercase slug (kebab-case)
- **Example**: "web-app", "blog", "portfolio", "documentation", "experiment"
- **Validation**: Alphanumeric plus hyphens only; no spaces
- **Storage**: HTML `data-category` attribute

#### categoryDisplay (Optional - P3)
- **Purpose**: Human-readable category shown to users
- **Format**: Title case or natural language
- **Example**: "Web App", "Blog", "Portfolio", "Documentation", "Experiment"
- **Validation**: Plain text; no HTML
- **Relationship**: Corresponds to `category` slug

#### status (Optional - P3)
- **Purpose**: Indicates project lifecycle stage
- **Format**: Lowercase keyword
- **Example**: "active", "archived", "experimental", "beta", "maintenance"
- **Validation**: Must be one of predefined values
- **Storage**: HTML `data-status` attribute

#### statusDisplay (Optional - P3)
- **Purpose**: Human-readable status shown to users
- **Format**: Title case
- **Example**: "Active", "Archived", "Experimental", "Beta", "In Maintenance"
- **Styling**: Can use badges or color coding (green=active, gray=archived, etc.)

## Data Validation Rules

### Required Field Validation
```javascript
// Pseudo-validation rules (not implemented in P1 MVP)
function validateProject(project) {
  if (!project.title || project.title.trim() === '') {
    throw new Error('Project title is required');
  }

  if (!project.url || !isValidUrl(project.url)) {
    throw new Error('Project URL is required and must be valid');
  }

  if (project.description && project.description.length > 500) {
    throw new Error('Description must be 500 characters or less');
  }

  return true;
}
```

**Note**: Since data is hardcoded in HTML, validation is manual during editing. W3C HTML validator can catch structural errors.

## HTML Structure Patterns

### Minimal Project (P1 MVP)
```html
<article class="project-card">
  <h2 class="project-title">
    <a href="https://username.github.io/awesome-project/">Awesome Project</a>
  </h2>
  <p class="project-description">A cool project that does amazing things.</p>
</article>
```

### Project with Metadata (P3)
```html
<article class="project-card" data-category="web-app" data-status="active">
  <h2 class="project-title">
    <a href="https://username.github.io/awesome-project/">Awesome Project</a>
  </h2>
  <p class="project-description">A cool project that does amazing things.</p>
  <div class="project-meta">
    <span class="category badge">Web App</span>
    <span class="status badge badge-active">Active</span>
  </div>
</article>
```

### Project with No Description
```html
<article class="project-card">
  <h2 class="project-title">
    <a href="https://username.github.io/another-project/">Another Project</a>
  </h2>
  <!-- Description omitted; card still displays correctly -->
</article>
```

## Collection Structure

The complete project list is contained in a semantic HTML container:

```html
<main class="projects-container">
  <h1 class="page-title">My GitHub Pages Projects</h1>

  <section class="projects-grid">
    <!-- Project cards go here -->
    <article class="project-card">...</article>
    <article class="project-card">...</article>
    <article class="project-card">...</article>
  </section>
</main>
```

**CSS Grid Layout**:
- Mobile: 1 column
- Tablet: 2 columns
- Desktop: 3-4 columns (auto-fit)

## Empty State

When no projects exist:

```html
<main class="projects-container">
  <h1 class="page-title">My GitHub Pages Projects</h1>

  <section class="projects-grid">
    <p class="empty-state">No projects available yet. Check back soon!</p>
  </section>
</main>
```

## Adding New Projects (Template)

To add a new project, copy this template into the `<section class="projects-grid">`:

```html
<!-- START PROJECT TEMPLATE -->
<article class="project-card" data-category="" data-status="">
  <h2 class="project-title">
    <a href="https://[USERNAME].github.io/[REPO-NAME]/">[Project Title]</a>
  </h2>
  <p class="project-description">[Brief description of the project]</p>
  <div class="project-meta">
    <span class="category">[Category]</span>
    <span class="status">[Status]</span>
  </div>
</article>
<!-- END PROJECT TEMPLATE -->
```

**Instructions for Editors**:
1. Copy the template
2. Replace placeholders in square brackets with actual values
3. Remove `data-category` and `data-status` attributes if not using P3 features
4. Remove `<div class="project-meta">` if not using P3 features
5. Save and deploy

## Data Relationships

Since this is a flat static page with no database:
- **No relationships**: Each project is independent
- **No foreign keys**: No references between projects
- **No constraints**: Beyond HTML validation

Future enhancement (not in current scope): If implementing filtering, projects would be grouped by category or status using JavaScript, but no permanent relationships exist.

## State Transitions

Projects have no dynamic state in the current implementation. The "status" field (P3) is static metadata that describes the project's lifecycle stage but doesn't change without manual editing.

Possible future states (informational only):
- **Active**: Project is live and maintained
- **Beta**: Project is functional but in testing
- **Experimental**: Proof of concept or work in progress
- **Archived**: Project is no longer maintained but preserved
- **Maintenance**: Receiving bug fixes only, no new features

## Conclusion

This data model prioritizes simplicity and ease of manual editing, aligning with the constitutional principle of avoiding over-engineering. The HTML-based structure allows non-technical users with basic HTML knowledge to add or update projects (SC-005: < 5 minutes to add a project).
