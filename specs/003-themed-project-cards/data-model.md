# Data Model: Themed Project Cards with Chinese Descriptions

**Feature**: 003-themed-project-cards
**Date**: 2025-10-23
**Purpose**: Define the enhanced HTML structure and theme data model for project cards with Chinese support

---

## Overview

This feature extends the existing project card structure from feature 002 by adding:
1. **Chinese language content** (simplified Chinese descriptions)
2. **Theme data attributes** (`data-theme`) for visual styling differentiation
3. **Language attributes** (`lang="zh-CN"`) for accessibility and proper font rendering

No new entities are created - this feature enhances existing HTML elements with additional attributes and bilingual content.

---

## Enhanced Project Card Entity

### Attributes

| Attribute | Type | Required | Values | Purpose |
|-----------|------|----------|--------|---------|
| `class` | string | Yes | `"project-card"` | Base styling class (from feature 002) |
| `data-category` | string | Yes | `management`, `learning`, `utility`, `portfolio` | Category classification (from feature 002) |
| `data-status` | string | Yes | `active`, `beta`, `archived`, `experimental` | Project status (from feature 002) |
| `data-theme` | string | Yes | `matrix`, `family`, `nintendo`, `utility` | Visual theme variant (new in feature 003) |
| `lang` (on description) | string | Optional | `zh-CN` | Language code for Chinese content (new in feature 003) |

### Content Elements

| Element | Description | Language | Example |
|---------|-------------|----------|---------|
| Project Icon | Emoji representing project type | Universal | 📊, 📚, 🔧 |
| Project Title | Project name (English) | English | "SpecKit-Manager" |
| Project Description | Brief explanation | **Chinese** | "SpecKit项目管理器 - 基于Firebase的工作流追踪工具" |
| Technology Tags | Tech stack indicators | English/Mixed | "Firebase", "Vanilla JS", "HTML5" |
| Feature Highlights | Key capabilities | **Chinese** | "实时工作流追踪", "自动保存" |
| Category Badge | Project category | **Chinese** | "管理工具", "学习工具", "实用工具" |
| Status Badge | Development status | **Chinese** | "活跃", "测试中" |

---

## Theme Variants

### Matrix Theme (`data-theme="matrix"`)

**Applied to**: SpecKit-Manager (管理工具 - 编程黑客风)

**Visual Characteristics**:
- Dark background (#0d0d0d)
- Matrix green text (#00FF41)
- Monospace typography
- Green glow hover effect
- Terminal-inspired aesthetic

**HTML Example**:
```html
<article class="project-card"
         data-category="management"
         data-status="active"
         data-theme="matrix">
  <div class="project-icon" role="img" aria-label="管理工具">📊</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">
        SpecKit-Manager
      </a>
    </h2>
  </header>
  <p class="project-description" lang="zh-CN">
    SpecKit项目管理器 - 基于Firebase的工作流追踪工具,支持自动保存和可视化增强
  </p>
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">Firebase</span>
    <span class="tech-tag">JavaScript</span>
    <span class="tech-tag">HTML5</span>
  </div>
  <ul class="project-features" aria-label="主要功能">
    <li>实时工作流追踪</li>
    <li>自动保存持久化</li>
    <li>可视化增强</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="management">
      <span class="visually-hidden">类别:</span>
      管理工具
    </span>
    <span class="status-badge" data-status="active" role="status">
      <span class="badge-icon" aria-hidden="true">●</span>
      <span class="badge-text">活跃</span>
    </span>
  </footer>
</article>
```

---

### Family Theme (`data-theme="family"`)

**Applied to**: Allowance Manager (家庭额度管理 - 合家欢记账风)

**Visual Characteristics**:
- Warm cream background (#FFF5EE)
- Coral orange accents (#CC6633)
- Soft blue highlights (#1F7ACC)
- Rounded corners (12px)
- Friendly, approachable design

**HTML Example**:
```html
<article class="project-card"
         data-category="management"
         data-status="active"
         data-theme="family">
  <div class="project-icon" role="img" aria-label="家庭管理工具">💰</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/allowance-manager/" class="project-link">
        Allowance Manager
      </a>
    </h2>
  </header>
  <p class="project-description" lang="zh-CN">
    儿童零花钱管理工具 - 帮助家长追踪和管理孩子的零用钱额度
  </p>
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">JavaScript</span>
    <span class="tech-tag">本地存储</span>
    <span class="tech-tag">HTML5</span>
  </div>
  <ul class="project-features" aria-label="主要功能">
    <li>家庭预算追踪</li>
    <li>日常开支限额</li>
    <li>本地数据存储</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="management">
      <span class="visually-hidden">类别:</span>
      管理工具
    </span>
    <span class="status-badge" data-status="active" role="status">
      <span class="badge-icon" aria-hidden="true">●</span>
      <span class="badge-text">活跃</span>
    </span>
  </footer>
</article>
```

---

### Nintendo Theme (`data-theme="nintendo"`)

**Applied to**: Vocabulary Cards (词汇卡片 - 任天堂游戏风)

**Visual Characteristics**:
- White background (#FFFFFF)
- Nintendo red primary (#E60012)
- Bright yellow/blue accents
- Thick playful borders (4px)
- Very rounded corners (16px)
- Game-like hover effects

**HTML Example**:
```html
<article class="project-card"
         data-category="learning"
         data-status="active"
         data-theme="nintendo">
  <div class="project-icon" role="img" aria-label="学习工具">📚</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/vocabulary-cards/" class="project-link">
        Vocabulary Cards
      </a>
    </h2>
  </header>
  <p class="project-description" lang="zh-CN">
    游戏化英语学习卡片 - 通过互动游戏方式学习英语词汇
  </p>
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">JavaScript</span>
    <span class="tech-tag">HTML5</span>
    <span class="tech-tag">CSS3</span>
  </div>
  <ul class="project-features" aria-label="主要功能">
    <li>互动单词卡片</li>
    <li>词汇记忆训练</li>
    <li>学习进度追踪</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="learning">
      <span class="visually-hidden">类别:</span>
      学习工具
    </span>
    <span class="status-badge" data-status="active" role="status">
      <span class="badge-icon" aria-hidden="true">●</span>
      <span class="badge-text">活跃</span>
    </span>
  </footer>
</article>
```

---

### Utility Theme (`data-theme="utility"`)

**Applied to**: Scan (扫描工具 - 专业工具风)

**Visual Characteristics**:
- Light blue-gray background (#F5F7FA)
- Professional blue-gray text (#3A5A78)
- Minimal border-radius (4px)
- Clean, functional design
- Subtle hover effects

**HTML Example**:
```html
<article class="project-card"
         data-category="utility"
         data-status="beta"
         data-theme="utility">
  <div class="project-icon" role="img" aria-label="实用工具">🔧</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/Scan/" class="project-link">
        Scan
      </a>
    </h2>
  </header>
  <p class="project-description" lang="zh-CN">
    内网二维码扫描工具 - 用于局域网环境的二维码识别工具
  </p>
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">JavaScript</span>
  </div>
  <ul class="project-features" aria-label="主要功能">
    <li>文档扫描</li>
    <li>图像处理</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="utility">
      <span class="visually-hidden">类别:</span>
      实用工具
    </span>
    <span class="status-badge" data-status="beta" role="status">
      <span class="badge-icon" aria-hidden="true">⚡</span>
      <span class="badge-text">测试中</span>
    </span>
  </footer>
</article>
```

---

## Site Header Enhancement

### Chinese Language Support

**HTML Example**:
```html
<header class="site-header">
  <div class="header-container">
    <h1 class="site-title" lang="zh-CN">我的GitHub Pages项目</h1>
    <p class="site-description" lang="zh-CN">网页开发项目合集</p>
  </div>
</header>
```

**Bilingual Alternative** (if desired):
```html
<header class="site-header">
  <div class="header-container">
    <h1 class="site-title">
      <span lang="zh-CN">我的GitHub Pages项目</span>
      <span class="subtitle" lang="en">My GitHub Pages Projects</span>
    </h1>
    <p class="site-description" lang="zh-CN">网页开发项目合集</p>
  </div>
</header>
```

---

## Chinese Content Mapping

### Category Badge Translations

| English | Chinese | data-category |
|---------|---------|---------------|
| Management | 管理工具 | management |
| Learning | 学习工具 | learning |
| Utility | 实用工具 | utility |
| Portfolio | 作品集 | portfolio |

### Status Badge Translations

| English | Chinese | data-status |
|---------|---------|-------------|
| Active | 活跃 | active |
| Beta | 测试中 | beta |
| Archived | 已归档 | archived |
| Experimental | 实验性 | experimental |

### Common UI Text Translations

| English | Chinese | Context |
|---------|---------|---------|
| "Technologies used" | "使用技术" | aria-label for tech tags |
| "Key features" | "主要功能" | aria-label for features list |
| "Category:" | "类别:" | visually-hidden prefix |
| "Project" | "项目" | Generic term |

---

## Validation Rules

### Required Attributes
1. Every `<article class="project-card">` MUST have `data-theme` attribute
2. Every Chinese text element SHOULD have `lang="zh-CN"` attribute
3. Theme value MUST match one of: `matrix`, `family`, `nintendo`, `utility`

### Content Requirements
1. All project descriptions MUST be in simplified Chinese
2. Category and status badges MUST use Chinese text
3. Feature lists MUST be in Chinese
4. Technology tags MAY remain in English (technical terms)
5. Project titles (links) MAY remain in English (proper nouns)

### Accessibility Requirements
1. `aria-label` attributes on icon and list containers MUST be in Chinese
2. `.visually-hidden` text for category badges MUST be in Chinese
3. All text MUST meet 4.5:1 contrast ratio on theme background

---

## State Transitions

N/A - This is a static site with no dynamic state changes. Themes are applied declaratively via HTML attributes.

---

## Data Flow

```
1. HTML Markup
   ↓
2. Browser Parses HTML
   ↓
3. CSS Reads data-theme Attribute
   ↓
4. Theme-Specific Styles Applied
   ↓
5. Page Rendered with Themes
```

No JavaScript or API calls involved - purely declarative HTML + CSS.

---

## Migration from Feature 002

### Changes to Existing Cards

**Add to each `<article>` tag**:
- `data-theme="[theme-name]"` attribute

**Replace content**:
- English descriptions → Chinese descriptions
- English category badges → Chinese category badges
- English status badges → Chinese status badges
- English feature lists → Chinese feature lists

**Add new attributes**:
- `lang="zh-CN"` on description paragraphs
- `lang="zh-CN"` on feature lists
- `lang="zh-CN"` on category/status badges

**Preserve from Feature 002**:
- All existing class names
- `data-category` and `data-status` attributes
- HTML structure (header, footer, icons, tech tags)
- Accessibility attributes (role, aria-label, visually-hidden)

---

## Example: Complete Card Transformation

### Before (Feature 002 - English)
```html
<article class="project-card" data-category="management" data-status="active">
  <div class="project-icon" role="img" aria-label="Management project">📊</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">SpecKit-Manager</a>
    </h2>
  </header>
  <p class="project-description">Spec Kit Project Management - Firebase-powered workflow tracker</p>
  <div class="project-technologies" aria-label="Technologies used">
    <span class="tech-tag">Firebase</span>
  </div>
  <ul class="project-features" aria-label="Key features">
    <li>Real-time workflow tracking</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="management">Management</span>
    <span class="status-badge" data-status="active">Active</span>
  </footer>
</article>
```

### After (Feature 003 - Chinese + Theme)
```html
<article class="project-card" data-category="management" data-status="active" data-theme="matrix">
  <div class="project-icon" role="img" aria-label="管理工具">📊</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">SpecKit-Manager</a>
    </h2>
  </header>
  <p class="project-description" lang="zh-CN">SpecKit项目管理器 - 基于Firebase的工作流追踪工具</p>
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">Firebase</span>
  </div>
  <ul class="project-features" aria-label="主要功能" lang="zh-CN">
    <li>实时工作流追踪</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="management" lang="zh-CN">管理工具</span>
    <span class="status-badge" data-status="active" lang="zh-CN">活跃</span>
  </footer>
</article>
```

**Key Changes**:
1. Added `data-theme="matrix"`
2. Added `lang="zh-CN"` to all Chinese text
3. Replaced English descriptions/labels with Chinese
4. Preserved all structure and accessibility features

---

## Summary

This data model defines how existing HTML project cards are enhanced with:
1. **Theme data attributes** for visual differentiation
2. **Chinese language content** for accessibility
3. **Language attributes** for proper rendering and screen reader support

All changes are additive and backward-compatible - no existing structure is removed, only enhanced.
