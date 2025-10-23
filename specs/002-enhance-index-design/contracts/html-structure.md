# HTML Structure Contract: Enhanced Project Cards

**Feature**: 002-enhance-index-design
**Created**: 2025-10-23
**Purpose**: Define the HTML structure contract for enhanced project cards with metadata

---

## Contract Overview

This document defines the **required HTML structure** for project cards in the GitHub Pages index. All implementations MUST follow this structure to ensure:
1. CSS styling works correctly via data attributes and class names
2. Accessibility features function properly (ARIA, semantic HTML)
3. Responsive design behaves consistently
4. Future enhancements are compatible

---

## Required Attributes

### Article Element (Project Card Container)

```html
<article class="project-card"
         data-category="[REQUIRED]"
         data-status="[OPTIONAL]">
```

**Attributes:**

| Attribute | Required | Valid Values | Purpose |
|-----------|----------|--------------|---------|
| `class` | ✅ Yes | `"project-card"` | CSS selector for card styling |
| `data-category` | ✅ Yes | `management`, `learning`, `utility`, `portfolio` | Category-based color theming |
| `data-status` | ⚪ Optional | `active`, `beta`, `archived`, `experimental` | Status badge display |

**CSS Contract:**
```css
/* Category colors applied via data attribute */
.project-card[data-category="management"] { /* Blue theme */ }
.project-card[data-category="learning"] { /* Green theme */ }
.project-card[data-category="utility"] { /* Purple theme */ }
.project-card[data-category="portfolio"] { /* Red-Orange theme */ }
```

---

## Required Structure Elements

### 1. Project Header (Required)

```html
<header class="project-header">
  <h2 class="project-title">
    <a href="[PROJECT_URL]" class="project-link">[PROJECT_TITLE]</a>
  </h2>
</header>
```

**Semantic Requirements:**
- `<header>` provides semantic structure
- `<h2>` for proper heading hierarchy (site uses `<h1>` for page title)
- `<a>` for clickable project link with full URL

**Accessibility Contract:**
- Link text MUST be the project title (not "Click here")
- URL MUST be absolute (https://ttieli.github.io/...)
- Link receives focus styles via `.project-link:focus-visible`

---

### 2. Project Description (Required)

```html
<p class="project-description">[PROJECT_DESCRIPTION]</p>
```

**Content Requirements:**
- Plain text only (no HTML tags inside)
- Max 300 characters for mobile readability
- Supports UTF-8 (English and Chinese)

**CSS Contract:**
- Line clamping applied for very long descriptions (max 4 lines)
- Responsive font sizing via `--font-size-body`

---

### 3. Project Metadata Footer (Required)

```html
<footer class="project-meta">
  <!-- Category badge (required) -->
  <span class="category-badge" data-category="[CATEGORY]">
    <span class="visually-hidden">Category:</span>
    [CATEGORY_DISPLAY]
  </span>

  <!-- Status badge (optional) -->
  <span class="status-badge" data-status="[STATUS]" role="status">
    <span class="badge-icon" aria-hidden="true">[SYMBOL]</span>
    <span class="badge-text">[STATUS_TEXT]</span>
  </span>
</footer>
```

**Required Elements:**
- `<footer class="project-meta">` wraps all badges
- `.category-badge` with matching `data-category` attribute
- `.visually-hidden` span for screen readers ("Category:")

**Optional Elements:**
- `.status-badge` only if project has status defined
- `role="status"` announces status to screen readers
- `.badge-icon` with `aria-hidden="true"` (decorative)

---

## Optional Enhancement Elements

### 4. Project Icon (Optional - P3)

```html
<div class="project-icon" role="img" aria-label="[CATEGORY_NAME] project">
  [EMOJI_ICON]
</div>
```

**Placement:** First child of `<article>` (before `<header>`)

**Accessibility Requirements:**
- `role="img"` treats emoji as image
- `aria-label` describes icon meaning ("Management project")
- Emoji MUST be single character (📊, 📚, 🔧, 🎨)

**Fallback Behavior:**
- If emoji doesn't render, CSS can provide text alternative
- Icon is decorative; screen readers announce category via badge

---

### 5. Technology Tags (Optional - P1)

```html
<div class="project-technologies" aria-label="Technologies used">
  <span class="tech-tag">[TECH_1]</span>
  <span class="tech-tag">[TECH_2]</span>
  <span class="tech-tag">[TECH_3]</span>
  <!-- Max 5 visible, then "+N more" -->
</div>
```

**Placement:** After `<p class="project-description">`

**Content Requirements:**
- Max 5 visible tags (if more, show "+N more" indicator)
- Each tag max 20 characters
- Standardized names (see data-model.md)

**Accessibility Contract:**
- Container has `aria-label="Technologies used"`
- Screen readers announce as list: "Technologies used: Firebase, Vanilla JS, HTML5"

---

### 6. Key Features (Optional - P1)

```html
<ul class="project-features" aria-label="Key features">
  <li>[FEATURE_1]</li>
  <li>[FEATURE_2]</li>
  <li>[FEATURE_3]</li>
</ul>
```

**Placement:** After `.project-technologies` (or after description if no tech tags)

**Content Requirements:**
- 2-3 features (max 3 for scannability)
- Each feature max 80 characters
- Action-oriented phrases (see data-model.md)

**Accessibility Contract:**
- `<ul>` provides semantic list structure
- `aria-label="Key features"` announces context
- Screen readers announce item count: "Key features, list of 3 items"

---

## Complete Structure Hierarchy

### Full Enhanced Card (All Optional Elements Included)

```html
<article class="project-card"
         data-category="[CATEGORY]"
         data-status="[STATUS]">

  <!-- 1. Icon (optional) -->
  <div class="project-icon" role="img" aria-label="[CATEGORY] project">
    [EMOJI]
  </div>

  <!-- 2. Header (required) -->
  <header class="project-header">
    <h2 class="project-title">
      <a href="[URL]" class="project-link">[TITLE]</a>
    </h2>
  </header>

  <!-- 3. Description (required) -->
  <p class="project-description">[DESCRIPTION]</p>

  <!-- 4. Technologies (optional) -->
  <div class="project-technologies" aria-label="Technologies used">
    <span class="tech-tag">[TECH_1]</span>
    <span class="tech-tag">[TECH_2]</span>
  </div>

  <!-- 5. Features (optional) -->
  <ul class="project-features" aria-label="Key features">
    <li>[FEATURE_1]</li>
    <li>[FEATURE_2]</li>
  </ul>

  <!-- 6. Footer (required) -->
  <footer class="project-meta">
    <span class="category-badge" data-category="[CATEGORY]">
      <span class="visually-hidden">Category:</span>
      [CATEGORY_NAME]
    </span>
    <span class="status-badge" data-status="[STATUS]" role="status">
      <span class="badge-icon" aria-hidden="true">[SYMBOL]</span>
      <span class="badge-text">[STATUS_TEXT]</span>
    </span>
  </footer>

</article>
```

### Minimal Card (Required Elements Only)

```html
<article class="project-card" data-category="[CATEGORY]">
  <header class="project-header">
    <h2 class="project-title">
      <a href="[URL]" class="project-link">[TITLE]</a>
    </h2>
  </header>
  <p class="project-description">[DESCRIPTION]</p>
  <footer class="project-meta">
    <span class="category-badge" data-category="[CATEGORY]">
      <span class="visually-hidden">Category:</span>
      [CATEGORY_NAME]
    </span>
  </footer>
</article>
```

---

## CSS Class Naming Contract

### Required CSS Classes

| Class Name | Purpose | Applied To |
|------------|---------|------------|
| `.project-card` | Card container | `<article>` |
| `.project-header` | Header section | `<header>` |
| `.project-title` | Title wrapper | `<h2>` |
| `.project-link` | Project link | `<a>` |
| `.project-description` | Description text | `<p>` |
| `.project-meta` | Footer metadata section | `<footer>` |
| `.category-badge` | Category indicator | `<span>` |
| `.visually-hidden` | Screen reader only text | `<span>` |

### Optional CSS Classes

| Class Name | Purpose | Applied To |
|------------|---------|------------|
| `.project-icon` | Icon container | `<div>` |
| `.project-technologies` | Tech tags container | `<div>` |
| `.tech-tag` | Individual tech tag | `<span>` |
| `.project-features` | Features list | `<ul>` |
| `.status-badge` | Status indicator | `<span>` |
| `.badge-icon` | Status symbol | `<span>` |
| `.badge-text` | Status text | `<span>` |

**Naming Convention**: BEM-inspired (Block-Element pattern)
- Block: `.project-card`
- Elements: `.project-{element}`
- No modifiers needed (data attributes handle variants)

---

## Data Attribute Contract

### Category Mapping

| Category Value | Display Text | Color | Icon |
|----------------|--------------|-------|------|
| `management` | "Management" | Blue (#0066CC) | 📊 |
| `learning` | "Learning" | Green (#047857) | 📚 |
| `utility` | "Utility" | Purple (#7C3AED) | 🔧 |
| `portfolio` | "Portfolio" | Red-Orange (#DC2626) | 🎨 |

### Status Mapping

| Status Value | Display Text | Color | Symbol |
|--------------|--------------|-------|--------|
| `active` | "Active" | Green (#10B981) | ● |
| `beta` | "Beta" | Blue (#3B82F6) | ⚡ |
| `archived` | "Archived" | Gray (#6B7280) | ■ |
| `experimental` | "Experimental" | Amber (#F59E0B) | ▲ |

---

## Accessibility Requirements

### ARIA Attributes

**Required ARIA:**
- `role="img"` on `.project-icon` (if present)
- `aria-label` on `.project-icon` describing category
- `aria-label` on `.project-technologies` = "Technologies used"
- `aria-label` on `.project-features` = "Key features"
- `role="status"` on `.status-badge`
- `aria-hidden="true"` on `.badge-icon` (decorative)

**Forbidden ARIA:**
- Do NOT use `role="article"` (use semantic `<article>`)
- Do NOT use `role="heading"` (use semantic `<h2>`)
- Do NOT use `role="link"` (use semantic `<a>`)
- Semantic HTML takes priority over ARIA

### Screen Reader Flow

Screen readers should announce in this order:

1. "Management project" (icon aria-label, if present)
2. "SpecKit-Manager" (heading level 2, link)
3. "Spec Kit Project Management..." (description paragraph)
4. "Technologies used: Firebase, Vanilla JS, HTML5" (technologies)
5. "Key features, list of 3 items" (features list announcement)
   - "Real-time workflow tracking"
   - "Auto-save persistence"
   - "Enhanced visualization"
6. "Category: Management" (visually-hidden + badge text)
7. "Active" (status badge with role="status")

### Keyboard Navigation

**Tab Order:**
1. Project link (only focusable element per card)
2. Focus moves to next card's link

**Focus State:**
- `.project-link:focus-visible` receives 3px outline
- No focus on non-interactive elements
- Entire card should indicate focus when link is focused (via parent selector)

---

## Validation Rules

### HTML Validation

✅ **Must Pass:**
- W3C HTML5 validation (no errors)
- Heading hierarchy (H1 → H2, no skipped levels)
- All `data-*` attributes have valid enum values
- All ARIA attributes correctly applied
- UTF-8 encoding declared in `<head>`

❌ **Must Not Have:**
- Inline styles (`style="..."`)
- Empty `<div>` wrappers
- Duplicate `id` attributes
- Mismatched `data-category` on article vs badge

### Accessibility Validation

✅ **Must Pass:**
- axe DevTools (0 violations)
- WAVE (0 errors)
- Lighthouse Accessibility score 100
- NVDA/VoiceOver manual testing (correct announcement order)
- Keyboard navigation (all interactive elements reachable)

### Content Validation

✅ **Required Fields:**
- Title non-empty, max 100 chars
- URL valid HTTPS, GitHub Pages domain
- Description non-empty, max 300 chars
- Category one of 4 valid enum values

⚪ **Optional Fields:**
- Technologies array, max 10 items, each max 20 chars
- Status one of 4 valid enum values (or omit entirely)
- Features array, 2-3 items, each max 80 chars
- Icon single emoji character (or omit entirely)

---

## Migration Examples

### Current Structure (001-pages-index)

```html
<article class="project-card">
  <h2 class="project-title">
    <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">
      SpecKit-Manager
    </a>
  </h2>
  <p class="project-description">
    Spec Kit Project Management - Firebase-powered workflow tracker with auto-persistence and enhanced visualization
  </p>
</article>
```

### Enhanced Structure (002-enhance-index-design)

```html
<article class="project-card"
         data-category="management"
         data-status="active">
  <div class="project-icon" role="img" aria-label="Management project">📊</div>

  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">
        SpecKit-Manager
      </a>
    </h2>
  </header>

  <p class="project-description">
    Spec Kit Project Management - Firebase-powered workflow tracker with auto-persistence and enhanced visualization
  </p>

  <div class="project-technologies" aria-label="Technologies used">
    <span class="tech-tag">Firebase</span>
    <span class="tech-tag">Vanilla JS</span>
    <span class="tech-tag">HTML5</span>
  </div>

  <ul class="project-features" aria-label="Key features">
    <li>Real-time workflow tracking</li>
    <li>Auto-save persistence</li>
    <li>Enhanced visualization</li>
  </ul>

  <footer class="project-meta">
    <span class="category-badge" data-category="management">
      <span class="visually-hidden">Category:</span>
      Management
    </span>
    <span class="status-badge" data-status="active" role="status">
      <span class="badge-icon" aria-hidden="true">●</span>
      <span class="badge-text">Active</span>
    </span>
  </footer>
</article>
```

**Changes:**
1. Wrapped `<h2>` in `<header class="project-header">`
2. Added `data-category="management"` and `data-status="active"` to `<article>`
3. Added `.project-icon` div with emoji and ARIA
4. Added `.project-technologies` section
5. Added `.project-features` list
6. Added `<footer class="project-meta">` with category and status badges
7. Added `.visually-hidden` spans for screen readers

---

## Testing Contract

### Unit Tests (CSS)

Verify via browser DevTools:

```css
/* Test category color application */
.project-card[data-category="management"] → background should use blue theme
.project-card[data-category="learning"] → background should use green theme

/* Test status badge colors */
.status-badge[data-status="active"] → green badge
.status-badge[data-status="beta"] → blue badge
```

### Integration Tests (HTML + CSS)

1. ✅ All 4 category variants render with correct colors
2. ✅ All 4 status variants render with correct badge styles
3. ✅ Optional sections (tech/features) conditionally appear
4. ✅ Minimal cards (no optional sections) still look complete
5. ✅ Responsive layout works 320px-1920px+

### Accessibility Tests

1. ✅ Screen reader announces all content in correct order
2. ✅ Keyboard navigation reaches all links
3. ✅ Focus indicators visible and meet 3:1 contrast
4. ✅ Color is never the only differentiator (multi-modal badges)
5. ✅ All interactive elements have accessible names

---

## Performance Contract

### HTML Size

- **Minimal card**: ~200 bytes
- **Full enhanced card**: ~800-1000 bytes
- **4 projects**: ~3-4 KB total HTML (negligible impact)

### CSS Size

- **Custom properties**: ~3 KB (colors, spacing, typography)
- **Utility classes**: ~1 KB (badges, visually-hidden, focus states)
- **Card styles**: ~2 KB (layout, responsive, interactions)
- **Total**: ~6 KB additional CSS (acceptable for enhanced design)

### Render Performance

- **No layout shift**: Fixed aspect ratio or min-height prevents CLS
- **First Contentful Paint**: <1.5s (no blocking resources)
- **Interaction ready**: Immediate (no JavaScript required)

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2025-10-23 | Initial contract for enhanced project cards |

---

**Document Status**: ✅ Complete
**Compliance**: All contracts must be followed for CSS and accessibility to function correctly
**Next Step**: Generate quickstart.md guide for using this structure
