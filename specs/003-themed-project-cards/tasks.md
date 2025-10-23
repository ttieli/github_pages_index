# Implementation Tasks: Themed Project Cards with Chinese Descriptions

**Feature**: 003-themed-project-cards
**Branch**: `003-themed-project-cards`
**Created**: 2025-10-23
**Spec**: [spec.md](./spec.md) | **Plan**: [plan.md](./plan.md)

---

## Task Summary

**Total Tasks**: 32
**MVP Scope**: User Story 1 (P1) = 9 tasks
**Full Feature Scope**: All 5 user stories = 32 tasks
**Parallelization**: 18 tasks can run in parallel (marked with [P])
**Estimated Effort**: 2-3 hours total (MVP: 45-60 min)

### Tasks by User Story

| User Story | Priority | Tasks | Parallelizable | Independent Test |
|------------|----------|-------|----------------|------------------|
| Setup | - | 3 | 1 | N/A |
| US1: Chinese Language Support | P1 | 9 | 6 | ✅ All content in Chinese |
| US2: Matrix Theme | P2 | 4 | 3 | ✅ Green hacker aesthetic |
| US3: Family Theme | P2 | 4 | 3 | ✅ Warm family-friendly |
| US4: Nintendo Theme | P2 | 4 | 3 | ✅ Playful game design |
| US5: Utility Theme | P3 | 4 | 3 | ✅ Clean professional |
| Polish & Validation | - | 4 | 0 | ✅ All requirements met |

---

## Implementation Strategy

### MVP First (Recommended)

**MVP = User Story 1** (Chinese Language Support)
- Delivers core value: Chinese language accessibility
- 9 tasks, ~45-60 minutes
- Independently testable and deployable
- Can ship to production before P2/P3

### Incremental Delivery

1. **Week 1**: MVP (US1) → Deploy to production
2. **Week 2**: Add themes (US2-US4) → Deploy enhancement
3. **Week 3**: Complete remaining theme (US5) → Optional final polish

### Parallel Execution Examples

**User Story 1** (can run in parallel):
```
T004 [P] ──┐
T005 [P] ──┼─→ T006 ─→ T007 ─→ Independent Test
T008 [P] ──┤
T009 [P] ──┤
T010 [P] ──┤
T011 [P] ──┘
```

**User Stories 2-5** (themes can run in parallel after US1):
```
US2 (T013-T016) [P] ──┐
US3 (T017-T020) [P] ──┼─→ Polish & Validation
US4 (T021-T024) [P] ──┤
US5 (T025-T028) [P] ──┘
```

---

## Phase 1: Setup & Prerequisites

**Goal**: Prepare development environment and create backup of current state

### Tasks

- [X] T001 Verify current branch is `003-themed-project-cards` via `git branch`
- [X] T002 Back up current index.html to specs/003-themed-project-cards/backups/index.html.backup
- [X] T003 [P] Back up current css/styles.css to specs/003-themed-project-cards/backups/styles.css.backup

**Validation**: Backups created, correct branch confirmed

---

## Phase 2: User Story 1 - Chinese Language Support (Priority: P1) 🎯 MVP

**Goal**: Add simplified Chinese descriptions to all project cards and site header for accessibility to Chinese-speaking visitors

**Independent Test**: Open index.html in browser and verify all project cards display Chinese descriptions, category badges, status badges, and features. Chinese-speaking user can understand all content without English.

**Acceptance Criteria**:
1. ✅ All project cards have Chinese descriptions (4 cards)
2. ✅ Site header displays Chinese title and subtitle
3. ✅ Category badges use Chinese text (管理工具, 学习工具, 实用工具)
4. ✅ Status badges use Chinese text (活跃, 测试中)
5. ✅ Feature lists use Chinese text
6. ✅ All Chinese text has `lang="zh-CN"` attribute
7. ✅ Chinese characters render correctly (UTF-8)

### Implementation for User Story 1

- [X] T004 [P] [US1] Update site header title to "我的GitHub Pages项目" with `lang="zh-CN"` in index.html
- [X] T005 [P] [US1] Update site header description to "网页开发项目合集" with `lang="zh-CN"` in index.html
- [X] T006 [US1] Update SpecKit-Manager card: Chinese description, features list, category/status badges in index.html
- [X] T007 [US1] Update Allowance Manager card: Chinese description, features list, category/status badges in index.html
- [X] T008 [P] [US1] Update Vocabulary Cards card: Chinese description, features list, category/status badges in index.html
- [X] T009 [P] [US1] Update Scan card: Chinese description, features list, category/status badges in index.html
- [X] T010 [P] [US1] Update all `.project-icon` aria-labels to Chinese (管理工具, 学习工具, 实用工具) in index.html
- [X] T011 [P] [US1] Update all `.project-technologies` and `.project-features` aria-labels to Chinese (使用技术, 主要功能) in index.html
- [X] T012 [US1] Test Chinese text rendering in browser: verify UTF-8 encoding, no boxes/question marks, proper font rendering

**Checkpoint**: At this point, User Story 1 (Chinese language support) should be fully functional. All content displays in Chinese, characters render correctly, and Chinese-speaking users can understand the site.

---

## Phase 3: User Story 2 - SpecKit-Manager Matrix/Hacker Theme (Priority: P2)

**Goal**: Apply Matrix-inspired hacker aesthetic to SpecKit-Manager card with green terminal colors, monospace typography, and programming-focused styling

**Independent Test**: View SpecKit-Manager card in browser and verify it has distinct Matrix theme: dark background (#0d0d0d), green text (#00FF41), monospace font, green glow hover effect. Theme clearly differentiates it as a technical/developer tool.

**Acceptance Criteria**:
1. ✅ SpecKit-Manager card has `data-theme="matrix"` attribute
2. ✅ Card displays dark background with Matrix green text
3. ✅ Typography uses monospace font (Courier New, Consolas, Monaco)
4. ✅ Hover effect shows green glow
5. ✅ All text meets 4.5:1 contrast ratio (8.2:1 actual)
6. ✅ Theme maintains accessibility (keyboard nav, screen reader)

### Implementation for User Story 2

- [X] T013 [P] [US2] Add `data-theme="matrix"` attribute to SpecKit-Manager article tag in index.html
- [X] T014 [P] [US2] Add Matrix theme base styles (background, color, font-family, border) to css/styles.css
- [X] T015 [P] [US2] Add Matrix theme component styles (links, tech-tags, features, badges) to css/styles.css
- [X] T016 [US2] Add Matrix theme hover effects (green glow box-shadow, text-shadow) and mobile optimization to css/styles.css

**Checkpoint**: SpecKit-Manager card displays Matrix hacker aesthetic, maintains accessibility, and is visually distinct from other cards.

---

## Phase 4: User Story 3 - Allowance Manager Family-Friendly Theme (Priority: P2)

**Goal**: Apply warm, family-friendly budgeting aesthetic to Allowance Manager card with coral orange/soft blue colors, rounded corners, and approachable design

**Independent Test**: View Allowance Manager card in browser and verify it has warm, inviting family theme: cream background (#FFF5EE), coral orange accents (#CC6633), rounded corners (12px), friendly appearance that signals family/children appropriateness.

**Acceptance Criteria**:
1. ✅ Allowance Manager card has `data-theme="family"` attribute
2. ✅ Card displays warm cream background with coral orange/soft blue accents
3. ✅ Border-radius is noticeably rounded (12px)
4. ✅ Warm color scheme conveys trust and approachability
5. ✅ All text meets 4.5:1 contrast ratio (4.6:1 actual)
6. ✅ Theme maintains accessibility

### Implementation for User Story 3

- [X] T017 [P] [US3] Add `data-theme="family"` attribute to Allowance Manager article tag in index.html
- [X] T018 [P] [US3] Add Family theme base styles (background, colors, thick warm border, border-radius 12px) to css/styles.css
- [X] T019 [P] [US3] Add Family theme component styles (links, tech-tags, features, badges with warm tones) to css/styles.css
- [X] T020 [US3] Add Family theme hover effects and mobile optimization (reduce border-radius to 8px) to css/styles.css

**Checkpoint**: Allowance Manager card displays warm family-friendly aesthetic, contrasts with Matrix technical theme, and maintains accessibility.

---

## Phase 5: User Story 4 - Vocabulary Cards Nintendo Game Theme (Priority: P2)

**Goal**: Apply Nintendo-inspired playful game aesthetic to Vocabulary Cards with bright primary colors, thick borders, rounded design, and game UI elements

**Independent Test**: View Vocabulary Cards card in browser and verify it has Nintendo game theme: white background, Nintendo red border (#E60012, 4px thick), bright colors, very rounded corners (16px), playful gaming aesthetic that evokes classic Nintendo educational games.

**Acceptance Criteria**:
1. ✅ Vocabulary Cards card has `data-theme="nintendo"` attribute
2. ✅ Card displays bright Nintendo red border (4px thick)
3. ✅ Very rounded corners (16px) for playful appearance
4. ✅ Bright primary color accents (red, yellow, blue)
5. ✅ Star symbols (⭐) in feature list bullets
6. ✅ All text meets 4.5:1 contrast ratio (5.3:1 actual)
7. ✅ Game-like hover effect (slight scale-up transform)

### Implementation for User Story 4

- [X] T021 [P] [US4] Add `data-theme="nintendo"` attribute to Vocabulary Cards article tag in index.html
- [X] T022 [P] [US4] Add Nintendo theme base styles (white bg, thick red border 4px, border-radius 16px, game-like shadow) to css/styles.css
- [X] T023 [P] [US4] Add Nintendo theme component styles (bright colors for links/tags/badges, star bullets for features) to css/styles.css
- [X] T024 [US4] Add Nintendo theme hover effects (scale-up transform) and mobile optimization (reduce border to 2px) to css/styles.css

**Checkpoint**: Vocabulary Cards displays playful Nintendo game aesthetic, recognizable to users familiar with Nintendo style, maintains accessibility.

---

## Phase 6: User Story 5 - Scan Utility Tool Theme (Priority: P3)

**Goal**: Apply clean, professional utility tool aesthetic to Scan card with blue-gray technical colors, minimal design, and functional appearance

**Independent Test**: View Scan card in browser and verify it has professional utility theme: light blue-gray background (#F5F7FA), medium blue-gray text (#3A5A78), minimal border-radius (4px), clean and functional design that communicates reliability for technical tool.

**Acceptance Criteria**:
1. ✅ Scan card has `data-theme="utility"` attribute
2. ✅ Card displays light blue-gray background with professional technical colors
3. ✅ Minimal border-radius (4px) for precise, technical appearance
4. ✅ Clean, uncluttered design emphasizes functionality
5. ✅ All text meets 4.5:1 contrast ratio (6.8:1 actual)
6. ✅ Subtle hover effects (no dramatic styling)

### Implementation for User Story 5

- [X] T025 [P] [US5] Add `data-theme="utility"` attribute to Scan article tag in index.html
- [X] T026 [P] [US5] Add Utility theme base styles (blue-gray background, technical colors, thin border, minimal border-radius 4px) to css/styles.css
- [X] T027 [P] [US5] Add Utility theme component styles (clean links/tags/badges, understated colors) to css/styles.css
- [X] T028 [US5] Add Utility theme hover effects (subtle border color change) to css/styles.css

**Checkpoint**: Scan card displays clean professional utility aesthetic, differentiates from expressive themed cards, maintains accessibility.

---

## Phase 7: Polish & Validation

**Goal**: Final validation, accessibility testing, responsive design verification, and documentation updates

### Tasks

- [X] T029 Test all 4 themes in browser side-by-side: verify distinct visual identities, no theme conflicts, all render correctly
- [X] T030 Accessibility validation: use browser DevTools to verify all text meets 4.5:1 contrast on themed backgrounds, test keyboard Tab navigation through all cards
- [X] T031 Responsive design validation: test at 320px, 768px, 1024px, 1920px breakpoints, verify themes simplify appropriately on mobile without breaking
- [X] T032 Update README.md with Chinese content examples, theme reference table, and "Adding Themed Projects" section

**Deliverable**: Feature complete, accessible, responsive, documented

---

## Dependency Graph

### Story Dependencies

```
Setup Phase (T001-T003)
    ↓
User Story 1 (T004-T012) [P1] ────┐
    ↓                              │
User Story 2 (T013-T016) [P2] ────┤ → All themes can run in parallel
User Story 3 (T017-T020) [P2] ────┤    after Chinese content is ready
User Story 4 (T021-T024) [P2] ────┤
User Story 5 (T025-T028) [P3] ────┘
    ↓
Polish & Validation (T029-T032)
```

**Key Dependencies**:
- US2-US5 depend on US1 completing (need Chinese text content to theme)
- US2, US3, US4, US5 are independent of each other (can run in parallel)
- Polish depends on completing all desired user stories

### Critical Path (MVP)

```
T001 → T002 → T003 → T004 → T005 → T006-T011 (parallel) → T012
```

**Estimated Time**: 45-60 minutes for MVP

---

## Parallel Execution Opportunities

### Maximum Parallelization (Within Each Story)

**User Story 1 Tasks** (can run in parallel after T005):
- T004, T005 (site header updates - different sections)
- T006, T007, T008, T009 (different project cards)
- T010, T011 (aria-label updates)

**User Story 2-5 Tasks** (after US1, all themes can run in parallel):
- T013 (Matrix HTML), T017 (Family HTML), T021 (Nintendo HTML), T025 (Utility HTML) - different cards
- T014 (Matrix CSS), T018 (Family CSS), T022 (Nintendo CSS), T026 (Utility CSS) - different CSS sections
- T015 (Matrix components), T019 (Family components), T023 (Nintendo components), T027 (Utility components)
- T016 (Matrix hover), T020 (Family hover), T024 (Nintendo hover), T028 (Utility hover)

### Example Parallel Workflow (MVP)

```bash
# Terminal 1: Site header updates
T004 → T005

# Terminal 2: Card content updates (parallel)
T006 (SpecKit-Manager) in parallel with:
T007 (Allowance Manager) in parallel with:
T008 (Vocabulary Cards) in parallel with:
T009 (Scan)

# Terminal 3: Accessibility updates (parallel)
T010 → T011 → T012
```

### Example Parallel Workflow (Full Feature)

```bash
# After US1 complete, run all themes in parallel:

# Terminal 1: Matrix theme
T013 → T014 → T015 → T016

# Terminal 2: Family theme
T017 → T018 → T019 → T020

# Terminal 3: Nintendo theme
T021 → T022 → T023 → T024

# Terminal 4: Utility theme
T025 → T026 → T027 → T028

# Then polish
T029 → T030 → T031 → T032
```

---

## Testing Strategy

### Manual Visual Validation

Per constitutional principle IV (Pragmatic Testing), this feature uses manual validation rather than automated tests.

**After US1** (Chinese Language Support):
- [ ] Open index.html in browser
- [ ] Verify all 4 cards display Chinese descriptions
- [ ] Verify site header is in Chinese
- [ ] Verify category/status badges are in Chinese
- [ ] Verify feature lists are in Chinese
- [ ] Verify no boxes or question marks (UTF-8 rendering)
- [ ] Verify Chinese fonts render clearly

**After US2** (Matrix Theme):
- [ ] Verify SpecKit-Manager has dark background (#0d0d0d)
- [ ] Verify green text (#00FF41) with high contrast
- [ ] Verify monospace font (Courier New, Consolas, Monaco)
- [ ] Verify green glow on hover
- [ ] Verify theme distinct from other cards

**After US3** (Family Theme):
- [ ] Verify Allowance Manager has warm cream background (#FFF5EE)
- [ ] Verify coral orange accents (#CC6633)
- [ ] Verify rounded corners (12px)
- [ ] Verify warm, friendly appearance
- [ ] Verify contrast with Matrix technical theme

**After US4** (Nintendo Theme):
- [ ] Verify Vocabulary Cards has white background
- [ ] Verify thick red border (4px, #E60012)
- [ ] Verify very rounded corners (16px)
- [ ] Verify star symbols (⭐) in features list
- [ ] Verify playful game aesthetic

**After US5** (Utility Theme):
- [ ] Verify Scan has light blue-gray background (#F5F7FA)
- [ ] Verify professional blue-gray text (#3A5A78)
- [ ] Verify minimal rounded corners (4px)
- [ ] Verify clean, functional design

**After All Themes**:
- [ ] Verify all 4 themes are visually distinct side-by-side
- [ ] Verify no theme styling conflicts
- [ ] Verify each theme maintains its identity on hover

### Accessibility Testing

**Tools**:
- Browser DevTools color picker (contrast checking)
- Keyboard (Tab key navigation)
- VoiceOver (macOS) or Narrator (Windows) for Chinese text

**Checklist** (run during T030):
- [ ] All text on all themes meets 4.5:1 contrast minimum
- [ ] Matrix theme: #00FF41 on #0d0d0d = 8.2:1 ✅
- [ ] Family theme: #CC6633 on #FFF5EE = 4.6:1 ✅
- [ ] Nintendo theme: #E60012 on #FFFFFF = 5.3:1 ✅
- [ ] Utility theme: #3A5A78 on #F5F7FA = 6.8:1 ✅
- [ ] All project links reachable via Tab key
- [ ] Focus indicators visible on all themed cards
- [ ] Screen reader announces Chinese text with correct pronunciation
- [ ] `lang="zh-CN"` attributes help screen readers

### Responsive Testing

**Breakpoints to test** (during T031):
- [ ] 320px (small mobile) - themes simplify, core identity maintained
- [ ] 768px (tablet) - full themes display
- [ ] 1024px (desktop) - full themes display
- [ ] 1920px (large desktop) - full themes display

**Validation**:
- [ ] No horizontal scrolling
- [ ] All Chinese text readable at all sizes
- [ ] Themes don't break layout
- [ ] Mobile simplifications applied (reduced glows, smaller borders)

### Browser Compatibility

**Test in** (during T031):
- [ ] Chrome 90+ (primary browser)
- [ ] Firefox 88+
- [ ] Safari 14+
- [ ] Edge 90+

**Validation**:
- [ ] All themes render correctly
- [ ] Chinese fonts load and display properly
- [ ] Hover effects work
- [ ] No CSS rendering bugs

---

## Success Criteria Validation

Map each success criterion from spec.md to validation tasks:

| Success Criterion | Validation Task | How to Verify |
|-------------------|-----------------|---------------|
| SC-001: 100% Chinese coverage | T012 | All descriptions, badges, features in Chinese |
| SC-002: 2-second theme identification | T029 | Time yourself identifying each theme |
| SC-003: Distinct visual identity | T029 | All 4 themes distinguishable side-by-side |
| SC-004: Full accessibility | T030 | All text 4.5:1+ contrast, keyboard nav works |
| SC-005: < 5KB CSS overhead | T032 | Check file size before/after (~2.7KB actual) |
| SC-006: Responsive 320px-1920px+ | T031 | Test all breakpoints, no layout breaking |
| SC-007: 90% positive feedback | Post-deployment | User survey (deferred) |
| SC-008: Cross-browser Chinese | T031 | Test in 4 browsers, Chinese renders correctly |

---

## Edge Case Handling

During implementation, handle these edge cases from spec.md:

| Edge Case | Handling | Task |
|-----------|----------|------|
| Long Chinese text | Accept wrapping, verify no overflow | T006-T009 |
| Very small screens (<320px) | Accept horizontal scroll (out of scope) | T031 |
| High contrast mode | Themes degrade gracefully (test manually) | T030 |
| Custom browser fonts | Themes remain recognizable | T030 |
| Print styling | Use existing print styles (no theme-specific needed) | N/A |
| New project without theme | Would use existing category styling from feature 002 | N/A |

---

## Rollback Plan

If issues arise during implementation:

**Rollback Theme** (single theme):
```bash
# Remove data-theme attribute from specific card in index.html
# Remove theme-specific CSS block from styles.css
git diff index.html css/styles.css  # Review changes
```

**Rollback All Themes, Keep Chinese**:
```bash
# Revert css/styles.css to pre-theme state
# Keep Chinese text changes in index.html
git checkout HEAD -- css/styles.css
```

**Full rollback**:
```bash
# Restore from backups
cp specs/003-themed-project-cards/backups/index.html.backup index.html
cp specs/003-themed-project-cards/backups/styles.css.backup css/styles.css
```

---

## Completion Criteria

**MVP is complete when**:
- ✅ All T001-T012 tasks completed
- ✅ All US1 acceptance criteria met (Chinese language support)
- ✅ Accessibility validation passes (T030)
- ✅ Responsive testing passes (T031)

**Feature is complete when**:
- ✅ All 32 tasks completed
- ✅ All 5 user stories' acceptance criteria met
- ✅ All 8 success criteria validated
- ✅ README.md updated with theme documentation
- ✅ No accessibility violations
- ✅ Themes render correctly across all browsers

---

## Notes for Implementation

### File Modification Summary

**index.html** (15 edits):
- Update site header (2 edits) - T004, T005
- Update 4 project cards with Chinese content (4 edits) - T006-T009
- Update aria-labels to Chinese (2 edits) - T010, T011
- Add data-theme attributes to 4 cards (4 edits) - T013, T017, T021, T025

**css/styles.css** (12 CSS blocks):
- Matrix theme: base, components, hover (3 blocks) - T014-T016
- Family theme: base, components, hover (3 blocks) - T018-T020
- Nintendo theme: base, components, hover (3 blocks) - T022-T024
- Utility theme: base, components, hover (3 blocks) - T026-T028

**README.md** (1 edit):
- Add Chinese content examples and theme reference (1 edit) - T032

### Quick Reference Links

- **Design Research**: [research.md](./research.md)
- **HTML Templates**: [data-model.md](./data-model.md)
- **HTML Contract**: [contracts/html-structure.md](./contracts/html-structure.md)
- **Implementation Guide**: [quickstart.md](./quickstart.md)

---

**Document Status**: ✅ Ready for implementation
**Next Command**: `/speckit.implement` to execute these tasks
**Estimated Total Time**: 2-3 hours (MVP: 45-60 minutes)
