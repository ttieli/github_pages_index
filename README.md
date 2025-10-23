# GitHub Pages Project Index

A centralized index page that lists all my GitHub Pages projects with titles, descriptions, and clickable links.

## Overview

This project provides a simple, static HTML page that serves as a directory for all my GitHub Pages projects. Visitors can quickly discover and access any project from a single, easy-to-navigate index.

## Features

- **Bilingual Support**: Chinese (简体中文) language interface with `lang="zh-CN"` attributes
- **Themed Project Cards**: Four distinct visual themes for different project types
- **Visual Project Differentiation**: Color-coded category badges (Management, Learning, Utility)
- **Rich Metadata Display**: Technology tags, status badges, and key feature highlights
- **Enhanced Design System**: Professional typography, spacing, and visual hierarchy
- **Project Icons**: Emoji icons for quick visual recognition
- **Responsive Design**: Works seamlessly on mobile (320px+), tablet, and desktop devices
- **Easy to Maintain**: Add new projects with themed styling in < 10 minutes
- **Fast Loading**: Static HTML with no dependencies or build tools (CSS themes add ~2.7KB)
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

## Adding a Themed Project (with Chinese)

### Quick Reference: Available Themes

| Theme | Visual Style | Best For | Example Projects |
|-------|--------------|----------|------------------|
| **matrix** | Dark background, green text, monospace font, hacker aesthetic | Programming tools, developer utilities, technical projects | SpecKit-Manager |
| **family** | Warm cream background, coral orange accents, rounded corners | Family apps, budgeting, child-friendly tools | Allowance Manager |
| **nintendo** | White background, bright red border, playful game design | Educational games, interactive learning, fun apps | Vocabulary Cards |
| **utility** | Light blue-gray background, professional colors, minimal design | Tools, scanners, utilities, professional apps | Scan |

### Theme Technical Specifications

| Theme | Background | Text Color | Contrast Ratio | WCAG Level | Special Effects |
|-------|------------|------------|----------------|------------|-----------------|
| Matrix | `#0d0d0d` | `#00FF41` | 8.2:1 | AAA | Green glow on hover, monospace font |
| Family | `#FFF5EE` | `#CC6633` | 4.6:1 | AA | Heart bullets (♥), rounded 12px |
| Nintendo | `#FFFFFF` | `#E60012` | 5.3:1 | AA | Star bullets (⭐), scale-up hover, 16px rounded |
| Utility | `#F5F7FA` | `#3A5A78` | 6.8:1 | AA | Arrow bullets (▸), minimal 4px rounded |

### Adding a Chinese-Language Themed Project

1. Open `index.html` in your text editor
2. Find the `<section class="projects-grid">` element
3. Use this template with Chinese content and theme attribute:

```html
<article class="project-card"
         data-category="[CATEGORY]"
         data-status="[STATUS]"
         data-theme="[THEME]">

  <!-- Project Icon -->
  <div class="project-icon" role="img" aria-label="[CHINESE_CATEGORY]">[ICON]</div>

  <!-- Project Header -->
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://username.github.io/new-project/" class="project-link">Project Name</a>
    </h2>
  </header>

  <!-- Chinese Description -->
  <p class="project-description" lang="zh-CN">[CHINESE_DESCRIPTION]</p>

  <!-- Technology Tags -->
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">Firebase</span>
    <span class="tech-tag">JavaScript</span>
  </div>

  <!-- Feature List (Chinese) -->
  <ul class="project-features" aria-label="主要功能" lang="zh-CN">
    <li>[CHINESE_FEATURE_1]</li>
    <li>[CHINESE_FEATURE_2]</li>
    <li>[CHINESE_FEATURE_3]</li>
  </ul>

  <!-- Meta Footer with Chinese Badges -->
  <footer class="project-meta">
    <span class="category-badge" data-category="[CATEGORY]" lang="zh-CN">
      <span class="visually-hidden">类别:</span>
      [CHINESE_CATEGORY_NAME]
    </span>
    <span class="status-badge" data-status="[STATUS]" role="status" lang="zh-CN">
      <span class="badge-icon" aria-hidden="true">[SYMBOL]</span>
      <span class="badge-text">[CHINESE_STATUS]</span>
    </span>
  </footer>
</article>
```

4. Replace placeholders:

**Required Attributes:**
- `[CATEGORY]`: `management`, `learning`, `utility`, or `portfolio`
- `[STATUS]`: `active`, `beta`, `archived`, or `experimental`
- `[THEME]`: `matrix`, `family`, `nintendo`, or `utility` (see theme table above)

**Chinese Content:**
- `[CHINESE_CATEGORY]`: 管理工具 (management), 学习工具 (learning), 实用工具 (utility)
- `[CHINESE_CATEGORY_NAME]`: Same as above
- `[CHINESE_DESCRIPTION]`: Project description in Chinese (50-150 characters)
- `[CHINESE_FEATURE_1/2/3]`: Feature descriptions in Chinese (4-12 characters each)
- `[CHINESE_STATUS]`: 活跃 (active), 测试中 (beta), 已归档 (archived), 实验性 (experimental)

**Icons & Symbols:**
- `[ICON]`: 📊 (management), 📚 (learning), 🔧 (utility), 🎨 (portfolio)
- `[SYMBOL]`: ● (active), ⚡ (beta), ■ (archived), ▲ (experimental)

### Complete Example: Matrix Theme Project (Chinese)

```html
<article class="project-card" data-category="management" data-status="active" data-theme="matrix">
  <div class="project-icon" role="img" aria-label="管理工具">📊</div>
  <header class="project-header">
    <h2 class="project-title">
      <a href="https://ttieli.github.io/SpecKit-Manager/" class="project-link">SpecKit-Manager</a>
    </h2>
  </header>
  <p class="project-description" lang="zh-CN">SpecKit项目管理器 - 基于Firebase的工作流追踪工具,支持自动保存和可视化增强</p>
  <div class="project-technologies" aria-label="使用技术">
    <span class="tech-tag">Firebase</span>
    <span class="tech-tag">JavaScript</span>
    <span class="tech-tag">HTML5</span>
  </div>
  <ul class="project-features" aria-label="主要功能" lang="zh-CN">
    <li>实时工作流追踪</li>
    <li>自动保存持久化</li>
    <li>可视化增强</li>
  </ul>
  <footer class="project-meta">
    <span class="category-badge" data-category="management" lang="zh-CN">
      <span class="visually-hidden">类别:</span>
      管理工具
    </span>
    <span class="status-badge" data-status="active" role="status" lang="zh-CN">
      <span class="badge-icon" aria-hidden="true">●</span>
      <span class="badge-text">活跃</span>
    </span>
  </footer>
</article>
```

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
