# HTML Structure Contract: Themed Project Cards

**Feature**: 003-themed-project-cards
**Version**: 1.0.0
**Date**: 2025-10-23
**Purpose**: Define the contract for themed project card HTML structure with Chinese language support

---

## Contract Overview

This contract defines the required HTML structure, attributes, and content for themed project cards with Chinese descriptions. All implementations MUST adhere to this structure to ensure consistent styling and accessibility.

---

## Required Attributes

### Project Card Element

**Element**: `<article>`

**Required Attributes**:

| Attribute | Type | Values | Validation | Example |
|-----------|------|--------|------------|---------|
| `class` | string | `"project-card"` | MUST be exactly `"project-card"` | `class="project-card"` |
| `data-category` | string | `management \| learning \| utility \| portfolio` | MUST be one of the four values | `data-category="management"` |
| `data-status` | string | `active \| beta \| archived \| experimental` | MUST be one of the four values | `data-status="active"` |
| `data-theme` | string | `matrix \| family \| nintendo \| utility` | MUST be one of the four values | `data-theme="matrix"` |

**Example**:
```html
<article class="project-card"
         data-category="management"
         data-status="active"
         data-theme="matrix">
  <!-- card content -->
</article>
```

---

## Theme-to-Project Mapping

This contract enforces specific theme assignments to projects:

| Project Name | data-theme | data-category | Rationale |
|--------------|------------|---------------|-----------|
| SpecKit-Manager | `matrix` | `management` | Programming/developer tool → hacker aesthetic |
| Allowance Manager | `family` | `management` | Family budgeting → warm, approachable design |
| Vocabulary Cards | `nintendo` | `learning` | Game-based learning → playful Nintendo style |
| Scan | `utility` | `utility` | Technical tool → clean, professional design |

**Validation Rule**: Implementations MUST use the correct `data-theme` value for each project as specified above.

---

## Required Child Elements

### 1. Project Icon

**Element**: `<div class="project-icon">`

**Required Attributes**:
- `role="img"`
- `aria-label="[Chinese category description]"`

**Content**: Single emoji character

**Example**:
```html
<div class="project-icon" role="img" aria-label="管理工具">📊</div>
```

---

### 2. Project Header

**Element**: `<header class="project-header">`

**Required Child**: `<h2 class="project-title">` containing `<a class="project-link">`

**Example**:
```html
<header class="project-header">
  <h2 class="project-title">
    <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">
      SpecKit-Manager
    </a>
  </h2>
</header>
```

**Validation**:
- Link `href` MUST be a valid URL
- Link text SHOULD be the project name (can be English - proper noun)

---

### 3. Project Description

**Element**: `<p class="project-description">`

**Required Attributes**:
- `lang="zh-CN"` (for Chinese content)

**Content**: Simplified Chinese text describing the project

**Validation**:
- Text MUST be in simplified Chinese characters
- Length SHOULD be 50-150 characters
- Text MUST NOT contain HTML tags (plain text only)

**Example**:
```html
<p class="project-description" lang="zh-CN">
  SpecKit项目管理器 - 基于Firebase的工作流追踪工具,支持自动保存和可视化增强
</p>
```

---

### 4. Project Technologies (Optional but Recommended)

**Element**: `<div class="project-technologies">`

**Required Attributes**:
- `aria-label="使用技术"` (Chinese)

**Required Children**: One or more `<span class="tech-tag">`

**Example**:
```html
<div class="project-technologies" aria-label="使用技术">
  <span class="tech-tag">Firebase</span>
  <span class="tech-tag">JavaScript</span>
  <span class="tech-tag">HTML5</span>
</div>
```

**Validation**:
- Technology tags SHOULD be concise (1-2 words)
- Technology tags MAY be in English (technical terms)
- Minimum 1 tag, maximum 5 tags recommended

---

### 5. Project Features

**Element**: `<ul class="project-features">`

**Required Attributes**:
- `aria-label="主要功能"` (Chinese)
- `lang="zh-CN"` (optional but recommended)

**Required Children**: 2-4 `<li>` elements with Chinese feature descriptions

**Example**:
```html
<ul class="project-features" aria-label="主要功能" lang="zh-CN">
  <li>实时工作流追踪</li>
  <li>自动保存持久化</li>
  <li>可视化增强</li>
</ul>
```

**Validation**:
- Each `<li>` MUST contain Chinese text
- Minimum 2 features, maximum 4 features
- Each feature SHOULD be 4-12 characters

---

### 6. Project Meta Footer

**Element**: `<footer class="project-meta">`

**Required Children**:
1. Category badge: `<span class="category-badge">`
2. Status badge: `<span class="status-badge">`

**Category Badge Example**:
```html
<span class="category-badge" data-category="management" lang="zh-CN">
  <span class="visually-hidden">类别:</span>
  管理工具
</span>
```

**Status Badge Example**:
```html
<span class="status-badge" data-status="active" role="status" lang="zh-CN">
  <span class="badge-icon" aria-hidden="true">●</span>
  <span class="badge-text">活跃</span>
</span>
```

**Validation**:
- Category badge `data-category` MUST match parent article's `data-category`
- Status badge `data-status` MUST match parent article's `data-status`
- Badge text MUST be in Chinese
- Category badge MUST include `.visually-hidden` prefix
- Status badge MUST include `.badge-icon` and `.badge-text`

---

## Complete HTML Template

```html
<article class="project-card"
         data-category="{category}"
         data-status="{status}"
         data-theme="{theme}">

  <!-- Project Icon -->
  <div class="project-icon" role="img" aria-label="{category-chinese}">
    {emoji}
  </div>

  <!-- Project Header -->
  <header class="project-header">
    <h2 class="project-title">
      <a href="{project-url}" class="project-link">
        {project-name}
      </a>
    </h2>
  </header>

  <!-- Project Description (Chinese) -->
  <p class="project-description" lang="zh-CN">
    {chinese-description}
  </p>

  <!-- Technology Tags -->
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">{tech-1}</span>
    <span class="tech-tag">{tech-2}</span>
    <span class="tech-tag">{tech-3}</span>
  </div>

  <!-- Feature Highlights (Chinese) -->
  <ul class="project-features" aria-label="主要功能" lang="zh-CN">
    <li>{feature-1-chinese}</li>
    <li>{feature-2-chinese}</li>
    <li>{feature-3-chinese}</li>
  </ul>

  <!-- Project Meta Footer -->
  <footer class="project-meta">
    <!-- Category Badge (Chinese) -->
    <span class="category-badge" data-category="{category}" lang="zh-CN">
      <span class="visually-hidden">类别:</span>
      {category-chinese}
    </span>

    <!-- Status Badge (Chinese) -->
    <span class="status-badge" data-status="{status}" role="status" lang="zh-CN">
      <span class="badge-icon" aria-hidden="true">{status-symbol}</span>
      <span class="badge-text">{status-chinese}</span>
    </span>
  </footer>

</article>
```

---

## Chinese Text Reference

### Category Translations

```
management → 管理工具
learning → 学习工具
utility → 实用工具
portfolio → 作品集
```

### Status Translations

```
active → 活跃 (symbol: ●)
beta → 测试中 (symbol: ⚡)
archived → 已归档 (symbol: ■)
experimental → 实验性 (symbol: ▲)
```

### Common aria-label Values

```
"使用技术" - Technologies used
"主要功能" - Key features
"管理工具" - Management project
"学习工具" - Learning project
"实用工具" - Utility project
```

---

## Accessibility Requirements

1. **Language Attributes**: All Chinese text elements MUST have `lang="zh-CN"`
2. **ARIA Labels**: All container elements MUST have appropriate `aria-label` in Chinese
3. **Screen Reader Context**: Use `.visually-hidden` for contextual prefixes ("类别:")
4. **Icon Roles**: Project icon MUST have `role="img"` and descriptive `aria-label`
5. **Status Announcements**: Status badge MUST have `role="status"`
6. **Hidden Decorations**: Badge symbols MUST have `aria-hidden="true"`

---

## CSS Styling Contract

### Required CSS Selectors

Implementations MUST support these selectors:

```css
/* Theme-specific selectors */
.project-card[data-theme="matrix"] { }
.project-card[data-theme="family"] { }
.project-card[data-theme="nintendo"] { }
.project-card[data-theme="utility"] { }

/* Existing selectors from feature 002 (preserved) */
.project-card[data-category="management"] { }
.project-card[data-status="active"] { }
.project-icon { }
.project-header { }
.project-title { }
.project-link { }
.project-description { }
.project-technologies { }
.tech-tag { }
.project-features { }
.project-meta { }
.category-badge { }
.status-badge { }
.badge-icon { }
.badge-text { }
.visually-hidden { }
```

### Theme CSS Custom Properties

Each theme SHOULD define these custom properties:

```css
.project-card[data-theme="matrix"] {
  --theme-bg: #0d0d0d;
  --theme-text: #00FF41;
  --theme-border: #003300;
  --theme-accent: #00CC00;
  --theme-hover-shadow: 0 0 10px rgba(0, 255, 65, 0.3);
}
```

---

## Validation Checklist

Before implementation, verify:

- [ ] All required attributes present on `<article>`
- [ ] Correct theme assigned to each project per mapping table
- [ ] All Chinese text has `lang="zh-CN"` attribute
- [ ] All ARIA labels are in Chinese
- [ ] Category and status attributes match between article and badges
- [ ] Project icon has `role="img"` and Chinese `aria-label`
- [ ] Feature list has 2-4 items
- [ ] Technology tags have 1-5 items
- [ ] All text meets 4.5:1 contrast ratio on theme background
- [ ] HTML structure matches template exactly

---

## Breaking Changes from Feature 002

**None** - This contract extends feature 002 structure without breaking changes.

**Additive Changes**:
1. New `data-theme` attribute on article
2. New `lang="zh-CN"` attributes on Chinese text
3. Chinese text replaces English in descriptions, badges, features
4. Chinese aria-labels replace English

**Preserved from Feature 002**:
- All class names
- All data-category and data-status values
- HTML structure and nesting
- Accessibility patterns

---

## Version History

- **1.0.0** (2025-10-23): Initial contract for themed project cards with Chinese support

---

## Enforcement

This contract is enforced through:
1. **Manual validation** during implementation review
2. **Browser DevTools** inspection of HTML attributes
3. **Accessibility audit** via axe DevTools or Lighthouse
4. **Visual regression testing** to verify themes apply correctly

Non-compliance with this contract will result in visual themes not applying correctly or accessibility failures.
