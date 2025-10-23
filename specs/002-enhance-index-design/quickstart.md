# Quick Start: Enhanced Project Index Design

**Feature**: 002-enhance-index-design
**Created**: 2025-10-23
**Audience**: Developers implementing or maintaining the enhanced project index

---

## 5-Minute Quick Start

### Step 1: Copy CSS Custom Properties (2 min)

Open `css/styles.css` and add the CSS custom properties from `research.md` Appendix A to the `:root` selector:

```css
:root {
  /* Category Colors */
  --color-category-management-primary: #0066CC;
  --color-category-learning-primary: #047857;
  --color-category-utility-primary: #7C3AED;
  --color-category-portfolio-primary: #DC2626;

  /* Status Colors */
  --color-status-active-bg: #10B981;
  --color-status-beta-bg: #3B82F6;
  --color-status-archived-bg: #6B7280;
  --color-status-experimental-bg: #F59E0B;

  /* Spacing (8pt grid) */
  --spacing-2: 0.5rem;   /* 8px */
  --spacing-3: 0.75rem;  /* 12px */
  --spacing-4: 1rem;     /* 16px */
  --spacing-6: 1.5rem;   /* 24px */

  /* Typography */
  --font-family-base: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  --font-size-body: 1rem;
  --font-size-small: 0.875rem;

  /* ... see research.md Appendix A for complete list */
}
```

### Step 2: Add Utility Classes (1 min)

Add these essential utility classes to `css/styles.css`:

```css
/* Accessibility */
.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}

/* Focus States */
*:focus-visible {
  outline: 3px solid var(--color-focus-outline);
  outline-offset: 2px;
}

/* Category Badges */
.category-badge {
  display: inline-block;
  padding: var(--spacing-1) var(--spacing-3);
  border-radius: var(--radius-full);
  font-size: var(--font-size-small);
  font-weight: var(--font-weight-medium);
}

.category-badge[data-category="management"] {
  background-color: var(--color-category-management-bg);
  color: var(--color-category-management-text);
}

.category-badge[data-category="learning"] {
  background-color: var(--color-category-learning-bg);
  color: var(--color-category-learning-text);
}

/* Status Badges */
.status-badge {
  display: inline-flex;
  align-items: center;
  gap: var(--spacing-1);
  padding: var(--spacing-1) var(--spacing-3);
  border-radius: var(--radius-md);
  font-size: var(--font-size-small);
  font-weight: var(--font-weight-medium);
}

.status-badge[data-status="active"] {
  background-color: var(--color-status-active-bg);
  color: white;
}

/* ... see research.md for complete utility classes */
```

### Step 3: Update One Project Card (2 min)

Open `index.html` and enhance the first project card:

```html
<article class="project-card"
         data-category="management"
         data-status="active">

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

**Verify**: Open in browser, should see blue category badge and green status badge.

---

## Complete Implementation Guide

### Phase 1: Category Indicators (P1 - MVP)

**Goal**: Add visual category differentiation with color-coded badges

**Steps**:

1. **Add category data attribute** to each `<article class="project-card">`:
   ```html
   <article class="project-card" data-category="management">
   ```

2. **Wrap existing heading** in `<header>` tag:
   ```html
   <header class="project-header">
     <h2 class="project-title">
       <a href="..." class="project-link">Project Name</a>
     </h2>
   </header>
   ```

3. **Add footer with category badge** at end of each card:
   ```html
   <footer class="project-meta">
     <span class="category-badge" data-category="management">
       <span class="visually-hidden">Category:</span>
       Management
     </span>
   </footer>
   ```

4. **Apply CSS styling**:
   ```css
   .project-card[data-category="management"] {
     border-left: 4px solid var(--color-category-management-primary);
   }
   ```

**Testing Checklist**:
- [ ] All 4 projects have `data-category` attribute
- [ ] Each category shows distinct color (blue/green/purple/red)
- [ ] Category badges are readable (4.5:1+ contrast)
- [ ] Screen readers announce "Category: [Name]"

---

### Phase 2: Technology Tags & Status (P1)

**Goal**: Display technology stack and project status

**Steps**:

1. **Add technology tags** after description:
   ```html
   <div class="project-technologies" aria-label="Technologies used">
     <span class="tech-tag">Firebase</span>
     <span class="tech-tag">Vanilla JS</span>
   </div>
   ```

2. **Add status to article**:
   ```html
   <article class="project-card"
            data-category="management"
            data-status="active">
   ```

3. **Add status badge** to footer:
   ```html
   <span class="status-badge" data-status="active" role="status">
     <span class="badge-icon" aria-hidden="true">●</span>
     <span class="badge-text">Active</span>
   </span>
   ```

4. **Style tech tags**:
   ```css
   .tech-tag {
     display: inline-block;
     padding: var(--spacing-1) var(--spacing-2);
     background-color: var(--color-neutral-100);
     border-radius: var(--radius-sm);
     font-size: var(--font-size-small);
   }
   ```

**Testing Checklist**:
- [ ] Technology tags display as small pills/badges
- [ ] Max 5 tags visible ("+N more" if exceeded)
- [ ] Status badges use multi-modal design (color + symbol + text)
- [ ] Screen readers announce "Technologies used: [list]"

---

### Phase 3: Features & Icons (P2/P3)

**Goal**: Add key feature highlights and visual icons

**Steps**:

1. **Add project icon** as first child of article:
   ```html
   <div class="project-icon" role="img" aria-label="Management project">
     📊
   </div>
   ```

2. **Add features list** after tech tags:
   ```html
   <ul class="project-features" aria-label="Key features">
     <li>Real-time workflow tracking</li>
     <li>Auto-save persistence</li>
     <li>Enhanced visualization</li>
   </ul>
   ```

3. **Style features list**:
   ```css
   .project-features {
     list-style: none;
     padding: 0;
     margin: var(--spacing-4) 0;
   }

   .project-features li::before {
     content: "✓ ";
     color: var(--color-success);
     font-weight: var(--font-weight-bold);
   }
   ```

**Testing Checklist**:
- [ ] Icons render consistently across platforms
- [ ] Features list shows 2-3 items max
- [ ] Screen readers announce "Key features, list of N items"
- [ ] Icons have proper `role="img"` and `aria-label`

---

## Project Categorization Guide

### Automatic Category Detection

Use these keywords to determine category:

| Category | Keywords | Example Projects |
|----------|----------|------------------|
| **Management** | manager, 管理, tracking, workflow, budget, 额度 | SpecKit-Manager, Allowance Manager |
| **Learning** | learning, 学习, vocabulary, 词汇, cards, education | Vocabulary Cards |
| **Utility** | tool, 工具, scan, 扫描, utility, helper | Scan |
| **Portfolio** | portfolio, 作品集, showcase, gallery | (Future projects) |

### Manual Category Assignment

For the 4 current projects:

```javascript
const projects = [
  { name: "SpecKit-Manager", category: "management" },
  { name: "Allowance Manager", category: "management" },
  { name: "Vocabulary Cards", category: "learning" },
  { name: "Scan", category: "utility" }
];
```

---

## Adding a New Project

### Template for New Project Cards

```html
<article class="project-card"
         data-category="[CHOOSE: management|learning|utility|portfolio]"
         data-status="[CHOOSE: active|beta|archived|experimental]">

  <!-- Optional: Icon -->
  <div class="project-icon" role="img" aria-label="[CATEGORY] project">
    [EMOJI: 📊 📚 🔧 🎨]
  </div>

  <!-- Required: Header -->
  <header class="project-header">
    <h2 class="project-title">
      <a href="[GITHUB_PAGES_URL]" class="project-link">
        [PROJECT_NAME]
      </a>
    </h2>
  </header>

  <!-- Required: Description -->
  <p class="project-description">
    [BRIEF_DESCRIPTION - max 300 chars]
  </p>

  <!-- Optional: Technologies -->
  <div class="project-technologies" aria-label="Technologies used">
    <span class="tech-tag">[TECH_1]</span>
    <span class="tech-tag">[TECH_2]</span>
  </div>

  <!-- Optional: Features -->
  <ul class="project-features" aria-label="Key features">
    <li>[FEATURE_1]</li>
    <li>[FEATURE_2]</li>
  </ul>

  <!-- Required: Footer -->
  <footer class="project-meta">
    <span class="category-badge" data-category="[SAME_AS_ARTICLE]">
      <span class="visually-hidden">Category:</span>
      [CATEGORY_NAME]
    </span>
    <span class="status-badge" data-status="[SAME_AS_ARTICLE]" role="status">
      <span class="badge-icon" aria-hidden="true">[● ⚡ ■ ▲]</span>
      <span class="badge-text">[STATUS_NAME]</span>
    </span>
  </footer>

</article>
```

### Step-by-Step for Adding New Project

1. **Choose category** based on project type (see categorization guide above)
2. **Copy template** above
3. **Replace placeholders**:
   - `[CATEGORY]`: management, learning, utility, or portfolio
   - `[STATUS]`: active, beta, archived, or experimental
   - `[EMOJI]`: 📊 (mgmt), 📚 (learn), 🔧 (util), 🎨 (port)
   - `[PROJECT_NAME]`: Your project title
   - `[GITHUB_PAGES_URL]`: Full https:// URL
   - `[BRIEF_DESCRIPTION]`: 1-2 sentences, max 300 chars
   - `[TECH_1, TECH_2]`: Technology tags (2-5 recommended)
   - `[FEATURE_1, FEATURE_2]`: Key highlights (2-3 items)
4. **Verify** data-category matches in both `<article>` and `.category-badge`
5. **Verify** data-status matches in both `<article>` and `.status-badge`
6. **Test** in browser for visual appearance and accessibility

---

## Design System Reference

### Category Colors

| Category | Primary | Background | Text | Icon |
|----------|---------|------------|------|------|
| Management | #0066CC (Blue) | #E6F2FF | #004499 | 📊 |
| Learning | #047857 (Green) | #D1FAE5 | #065F46 | 📚 |
| Utility | #7C3AED (Purple) | #EDE9FE | #5B21B6 | 🔧 |
| Portfolio | #DC2626 (Red-Orange) | #FEE2E2 | #991B1B | 🎨 |

### Status Colors

| Status | Background | Text | Symbol |
|--------|------------|------|--------|
| Active | #10B981 (Green) | White | ● |
| Beta | #3B82F6 (Blue) | White | ⚡ |
| Archived | #6B7280 (Gray) | White | ■ |
| Experimental | #F59E0B (Amber) | Black | ▲ |

### Typography Scale

| Element | Size | Weight | Usage |
|---------|------|--------|-------|
| Page Title (H1) | 2.5rem (40px) | 700 | Site header |
| Card Title (H2) | 1.5rem (24px) | 600 | Project names |
| Body | 1rem (16px) | 400 | Descriptions |
| Small | 0.875rem (14px) | 400 | Badges, tags |

### Spacing System (8pt Grid)

| Variable | Value | Usage |
|----------|-------|-------|
| `--spacing-1` | 0.25rem (4px) | Badge padding |
| `--spacing-2` | 0.5rem (8px) | Tag padding |
| `--spacing-3` | 0.75rem (12px) | Badge padding |
| `--spacing-4` | 1rem (16px) | Section spacing |
| `--spacing-6` | 1.5rem (24px) | Card padding |
| `--spacing-8` | 2rem (32px) | Card gap |

---

## Accessibility Checklist

### Before Deployment

Run through this checklist to ensure accessibility compliance:

#### Color Contrast
- [ ] All text meets 4.5:1 contrast ratio (WCAG AA for normal text)
- [ ] Large text meets 3:1 contrast ratio (WCAG AA for large text)
- [ ] UI components meet 3:1 contrast ratio (badges, borders)
- [ ] Status badges never rely on color alone (use symbol + text + color)

#### Screen Readers
- [ ] Test with NVDA (Windows) or VoiceOver (Mac)
- [ ] All images/icons have `role="img"` and `aria-label`
- [ ] Status badges have `role="status"` for live announcements
- [ ] Technology and features sections have `aria-label`
- [ ] `.visually-hidden` class used for screen reader-only text

#### Keyboard Navigation
- [ ] All interactive elements reachable via Tab key
- [ ] Focus order follows logical reading order (top to bottom)
- [ ] Focus indicators visible (3:1 contrast ratio)
- [ ] No keyboard traps
- [ ] Enter key activates links

#### Semantic HTML
- [ ] Proper heading hierarchy (H1 → H2, no skips)
- [ ] Use `<header>`, `<footer>`, `<article>` semantic tags
- [ ] Links have descriptive text (not "Click here")
- [ ] Lists use `<ul>`/`<ol>` tags
- [ ] ARIA used to enhance, not replace, semantic HTML

#### Responsive Design
- [ ] Test at 320px (small mobile)
- [ ] Test at 768px (tablet)
- [ ] Test at 1024px (desktop)
- [ ] No horizontal scrolling
- [ ] All content readable at all sizes
- [ ] Touch targets minimum 44x44px

---

## Common Issues & Solutions

### Issue 1: Category Colors Not Showing

**Symptom**: All project cards look the same, no color differentiation

**Solution**:
1. Verify `data-category` attribute exists on `<article>` tag
2. Check CSS custom properties are defined in `:root`
3. Verify category-specific CSS selectors:
   ```css
   .project-card[data-category="management"] { /* ... */ }
   ```
4. Clear browser cache and hard refresh (Cmd+Shift+R / Ctrl+Shift+F5)

### Issue 2: Status Badges Not Appearing

**Symptom**: Category badge shows but status badge missing

**Solution**:
1. Verify `data-status` attribute on `<article>` tag
2. Check `.status-badge` HTML is inside `<footer class="project-meta">`
3. Verify `data-status` value matches badge:
   ```html
   <article data-status="active">
     <!-- ... -->
     <span class="status-badge" data-status="active">
   ```
4. For projects without status, omit entire `.status-badge` element

### Issue 3: Screen Reader Not Announcing Categories

**Symptom**: Screen reader skips over category information

**Solution**:
1. Add `.visually-hidden` span before category name:
   ```html
   <span class="category-badge" data-category="management">
     <span class="visually-hidden">Category:</span>
     Management
   </span>
   ```
2. Verify `.visually-hidden` CSS class exists in styles.css
3. Test with actual screen reader (NVDA/VoiceOver)

### Issue 4: Emojis Rendering Differently

**Symptom**: Emojis look different across browsers/devices

**Solution**:
1. Use universal emojis: 📊 📚 🔧 🎨 (high compatibility)
2. Add fallback with `aria-label` for accessibility
3. Consider CSS-only icons as alternative (see research.md)
4. Test on multiple platforms (Windows, Mac, iOS, Android)

### Issue 5: Layout Breaking on Mobile

**Symptom**: Cards overflow or text too small on mobile

**Solution**:
1. Verify mobile-first responsive CSS is applied
2. Check `<meta name="viewport">` tag in `<head>`:
   ```html
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   ```
3. Test responsive breakpoints (320px, 768px, 1024px)
4. Use `clamp()` for fluid typography if needed

---

## Testing Tools

### Accessibility Testing
- **axe DevTools** (browser extension): Automated accessibility testing
- **WAVE** (browser extension): Visual accessibility feedback
- **Lighthouse** (Chrome DevTools): Performance + accessibility audit
- **NVDA** (Windows) or **VoiceOver** (Mac): Screen reader testing

### Color Contrast Testing
- **WebAIM Contrast Checker**: https://webaim.org/resources/contrastchecker/
- **Chrome DevTools**: Built-in contrast ratio checker in Color Picker
- **Accessible Colors**: https://accessible-colors.com/

### Responsive Design Testing
- **Chrome DevTools Device Mode**: Test multiple screen sizes
- **Responsive Design Checker**: https://responsivedesignchecker.com/
- **BrowserStack**: Real device testing (paid)

### Browser Testing
- **Chrome** 90+ (recommended)
- **Firefox** 88+
- **Safari** 14+
- **Edge** 90+

---

## Performance Optimization

### CSS Best Practices
- Use CSS custom properties (faster than inline styles)
- Minimize specificity (avoid `!important`)
- Group related properties
- Use shorthand when possible

### HTML Best Practices
- Minimize nesting depth (max 3-4 levels)
- Omit optional elements when not needed
- Use semantic HTML (no empty `<div>` wrappers)
- Keep attribute order consistent

### Loading Performance
- No external font files (use system fonts)
- No image files for icons (use emoji or CSS)
- Inline critical CSS (< 6KB total)
- Lazy load future enhancements if needed

---

## Maintenance Guide

### When to Update

**Add new project**: Use template in "Adding a New Project" section above

**Update existing project**:
1. Change category/status: Update `data-*` attributes
2. Add/remove technologies: Edit `.project-technologies` section
3. Update features: Edit `.project-features` list
4. Archive project: Change `data-status="archived"`

**Update design system**:
1. Modify CSS custom properties in `:root`
2. Test all 4 category variants
3. Test all 4 status variants
4. Re-run accessibility audit

### Style Guide Compliance

Every project card update should:
- [ ] Follow HTML structure contract (see contracts/html-structure.md)
- [ ] Use CSS custom properties (no hardcoded values)
- [ ] Include required ARIA attributes
- [ ] Pass accessibility validation
- [ ] Test across responsive breakpoints

---

## Next Steps

1. ✅ **Implement Phase 1** (Category indicators) - 30 min
2. ✅ **Test accessibility** - 15 min
3. ✅ **Implement Phase 2** (Tech tags & status) - 30 min
4. ⚪ **Implement Phase 3** (Features & icons) - Optional
5. ✅ **Deploy to GitHub Pages** - 5 min
6. ✅ **Validate with real users** - Ongoing

---

**Document Status**: ✅ Complete
**Last Updated**: 2025-10-23
**Questions?** Refer to data-model.md, contracts/html-structure.md, or research.md for detailed specifications.
