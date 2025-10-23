# Data Model: Enhanced Project Entity

**Feature**: 002-enhance-index-design
**Created**: 2025-10-23
**Purpose**: Define the structure for project cards with enhanced metadata and visual differentiation

---

## Entity: Project (Enhanced)

### Attributes

| Attribute | Type | Required | Validation Rules | Description |
|-----------|------|----------|------------------|-------------|
| **title** | String | ✅ Yes | Non-empty, max 100 chars | Project display name |
| **url** | String | ✅ Yes | Valid HTTPS URL | Project GitHub Pages link |
| **description** | String | ✅ Yes | Max 300 chars | Brief project summary (supports English and Chinese) |
| **category** | Enum | ✅ Yes | One of: `management`, `learning`, `utility`, `portfolio` | Project type for visual differentiation |
| **technologies** | Array[String] | ⚪ Optional | Max 10 items, each max 20 chars | Technology tags (e.g., "Firebase", "Vanilla JS") |
| **status** | Enum | ⚪ Optional | One of: `active`, `beta`, `archived`, `experimental` | Project lifecycle stage |
| **features** | Array[String] | ⚪ Optional | 2-3 items, each max 80 chars | Key feature highlights |
| **icon** | String | ⚪ Optional | Single emoji character | Visual identifier (emoji from research.md) |
| **colorTheme** | String | ⚪ Optional | Hex color code | Accent color override (defaults to category color) |

### Category Enumeration

```typescript
enum ProjectCategory {
  MANAGEMENT = "management"   // Blue (#0066CC) - 📊 Bar Chart
  LEARNING = "learning"       // Green (#047857) - 📚 Books
  UTILITY = "utility"         // Purple (#7C3AED) - 🔧 Wrench
  PORTFOLIO = "portfolio"     // Red-Orange (#DC2626) - 🎨 Artist Palette
}
```

### Status Enumeration

```typescript
enum ProjectStatus {
  ACTIVE = "active"           // Green (#10B981) - ● symbol
  BETA = "beta"               // Blue (#3B82F6) - ⚡ symbol
  ARCHIVED = "archived"       // Gray (#6B7280) - ■ symbol
  EXPERIMENTAL = "experimental" // Amber (#F59E0B) - ▲ symbol
}
```

---

## HTML Structure Contract

### Enhanced Project Card Template

```html
<article class="project-card"
         data-category="[CATEGORY]"
         data-status="[STATUS]">

  <!-- Category Icon (optional) -->
  <div class="project-icon" role="img" aria-label="[CATEGORY_NAME] project">
    [EMOJI_ICON]
  </div>

  <!-- Project Header -->
  <header class="project-header">
    <h2 class="project-title">
      <a href="[PROJECT_URL]" class="project-link">[PROJECT_TITLE]</a>
    </h2>
  </header>

  <!-- Project Description -->
  <p class="project-description">[PROJECT_DESCRIPTION]</p>

  <!-- Technology Tags (optional) -->
  <div class="project-technologies" aria-label="Technologies used">
    <span class="tech-tag">[TECH_1]</span>
    <span class="tech-tag">[TECH_2]</span>
    <span class="tech-tag">[TECH_3]</span>
  </div>

  <!-- Key Features (optional) -->
  <ul class="project-features" aria-label="Key features">
    <li>[FEATURE_1]</li>
    <li>[FEATURE_2]</li>
    <li>[FEATURE_3]</li>
  </ul>

  <!-- Project Metadata Footer -->
  <footer class="project-meta">
    <!-- Category Badge -->
    <span class="category-badge" data-category="[CATEGORY]">
      <span class="visually-hidden">Category:</span>
      [CATEGORY_DISPLAY]
    </span>

    <!-- Status Badge (optional) -->
    <span class="status-badge"
          data-status="[STATUS]"
          role="status">
      <span class="badge-icon" aria-hidden="true">[STATUS_SYMBOL]</span>
      <span class="badge-text">[STATUS_DISPLAY]</span>
    </span>
  </footer>
</article>
```

### Minimal Project Card (Required Fields Only)

```html
<article class="project-card" data-category="[CATEGORY]">
  <header class="project-header">
    <h2 class="project-title">
      <a href="[PROJECT_URL]" class="project-link">[PROJECT_TITLE]</a>
    </h2>
  </header>
  <p class="project-description">[PROJECT_DESCRIPTION]</p>
  <footer class="project-meta">
    <span class="category-badge" data-category="[CATEGORY]">
      <span class="visually-hidden">Category:</span>
      [CATEGORY_DISPLAY]
    </span>
  </footer>
</article>
```

---

## Current Projects Data

### Project 1: SpecKit-Manager

```javascript
{
  title: "SpecKit-Manager",
  url: "https://ttieli.github.io/SpecKit-Manager/",
  description: "Spec Kit Project Management - Firebase-powered workflow tracker with auto-persistence and enhanced visualization",
  category: "management",
  technologies: ["Firebase", "Vanilla JS", "HTML5"],
  status: "active",
  features: [
    "Real-time workflow tracking",
    "Auto-save persistence",
    "Enhanced visualization"
  ],
  icon: "📊",
  colorTheme: null  // Use default category color
}
```

**HTML Implementation**:
```html
<article class="project-card" data-category="management" data-status="active">
  <div class="project-icon" role="img" aria-label="Management project">📊</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">SpecKit-Manager</a>
    </h2>
  </header>
  <p class="project-description">Spec Kit Project Management - Firebase-powered workflow tracker with auto-persistence and enhanced visualization</p>
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

### Project 2: Allowance Manager

```javascript
{
  title: "Allowance Manager",
  url: "https://ttieli.github.io/allowance-manager/",
  description: "家庭额度管理系统 - 帮助家庭管理和追踪日常开支额度",
  category: "management",
  technologies: ["Vanilla JS", "LocalStorage", "HTML5"],
  status: "active",
  features: [
    "Family budget tracking",
    "Daily expense limits",
    "Local data storage"
  ],
  icon: "📊",
  colorTheme: null
}
```

### Project 3: Vocabulary Cards

```javascript
{
  title: "Vocabulary Cards",
  url: "https://ttieli.github.io/vocabulary-cards/",
  description: "交互式词汇卡片应用，帮助学习和记忆新单词",
  category: "learning",
  technologies: ["Vanilla JS", "HTML5", "CSS3"],
  status: "active",
  features: [
    "Interactive flashcards",
    "Vocabulary memorization",
    "Learning progress tracking"
  ],
  icon: "📚",
  colorTheme: null
}
```

### Project 4: Scan

```javascript
{
  title: "Scan",
  url: "https://ttieli.github.io/Scan/",
  description: "扫描工具应用",
  category: "utility",
  technologies: ["Vanilla JS"],
  status: "beta",
  features: [
    "Document scanning",
    "Image processing"
  ],
  icon: "🔧",
  colorTheme: null
}
```

---

## Validation Rules

### Category Assignment Logic

**Automatic category detection keywords** (if not manually specified):

- **management**: "manager", "管理", "tracking", "workflow", "budget", "额度"
- **learning**: "learning", "学习", "vocabulary", "词汇", "cards", "卡片", "education"
- **utility**: "tool", "工具", "scan", "扫描", "utility", "helper"
- **portfolio**: "portfolio", "作品集", "showcase", "gallery"

### Technology Tag Normalization

Common technology names should be standardized:

- "JavaScript" → "Vanilla JS" (for framework-free projects)
- "Firebase Realtime Database" → "Firebase"
- "Local Storage" → "LocalStorage"
- "HTML5/CSS3" → "HTML5", "CSS3" (separate tags)

### Feature Highlights Guidelines

- **Length**: 2-3 features per project (max 3 for scannability)
- **Focus**: User-facing benefits, not technical implementation
- **Style**: Action-oriented phrases (e.g., "Track expenses" not "Expense tracking feature")
- **Length**: Each feature max 80 characters for mobile readability

---

## Accessibility Requirements

### Screen Reader Announcements

Each project card should announce in this order:

1. **Category** (via visually-hidden text): "Category: Management"
2. **Title** (via heading): "SpecKit-Manager"
3. **Description** (paragraph)
4. **Technologies** (via aria-label): "Technologies used: Firebase, Vanilla JS, HTML5"
5. **Features** (via aria-label + list): "Key features: [list items]"
6. **Status** (via role="status"): "Active"

### ARIA Attributes Required

- `role="img"` + `aria-label` for decorative icons/emojis
- `aria-label` for technology and feature sections
- `role="status"` for status badges
- `.visually-hidden` class for screen reader-only text
- Semantic HTML (`<article>`, `<header>`, `<footer>`) takes priority over ARIA

---

## Edge Cases Handled

### 1. Missing Technologies
**Scenario**: Project has no technology tags
**Solution**: Omit entire `.project-technologies` section from HTML

### 2. Missing Features
**Scenario**: Project has no feature highlights
**Solution**: Omit entire `.project-features` section from HTML

### 3. Missing Status
**Scenario**: Project has no status defined
**Solution**: Omit `.status-badge` but keep `.category-badge`

### 4. Long Descriptions
**Scenario**: Description exceeds 300 characters
**Solution**: Truncate with ellipsis, add `title` attribute with full text

### 5. Many Technology Tags (10+)
**Scenario**: Project lists 15 technologies
**Solution**: Show first 5 tags, add "+N more" indicator with `title` tooltip

### 6. Non-English Characters
**Scenario**: Chinese/multilingual content
**Solution**: Use UTF-8 encoding, test with proper `lang` attributes if needed

---

## Performance Considerations

### HTML Size Impact

- **Minimal card** (required fields only): ~200 bytes
- **Full enhanced card** (all metadata): ~800-1000 bytes
- **4 projects fully enhanced**: ~3-4 KB additional HTML
- **Impact**: Negligible (<1% of typical page size)

### CSS Custom Properties Usage

All styling uses CSS custom properties from research.md:
- `--color-category-[category]-primary`
- `--color-status-[status]-bg`
- `--spacing-*` values
- No inline styles required

---

## Migration Path

### Phase 1: Add Category Badges (P1 - MVP)
1. Add `data-category` attribute to existing `<article>` tags
2. Add `.project-meta` footer with `.category-badge`
3. Apply category colors via CSS

### Phase 2: Add Technologies & Status (P1)
1. Insert `.project-technologies` section
2. Add `data-status` attribute where applicable
3. Add `.status-badge` to footer

### Phase 3: Add Features & Icons (P2/P3)
1. Add `.project-icon` div with emoji
2. Insert `.project-features` list
3. Enhance with full metadata

Each phase is independently testable and deployable.

---

**Document Status**: ✅ Complete
**Last Updated**: 2025-10-23
**Next Step**: Generate HTML structure contract in `/contracts/` directory
