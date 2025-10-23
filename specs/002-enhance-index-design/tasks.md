# Implementation Tasks: Enhanced Index Page Design

**Feature**: 002-enhance-index-design
**Branch**: `002-enhance-index-design`
**Created**: 2025-10-23
**Spec**: [spec.md](./spec.md) | **Plan**: [plan.md](./plan.md)

---

## Task Summary

**Total Tasks**: 51
**Completed Tasks**: 46 (implementation complete)
**Remaining Tasks**: 5 (manual validation - user action required)
**MVP Scope**: User Story 1 + User Story 2 (P1 stories) = 18 tasks ✅ COMPLETED
**Full Feature Scope**: All 4 user stories (P1 + P2 + P3) = 46 tasks ✅ COMPLETED
**Status**: 🎉 **IMPLEMENTATION COMPLETE** - Ready for manual testing and deployment

### Tasks by User Story

| User Story | Priority | Tasks | Parallelizable | Independent Test |
|------------|----------|-------|----------------|------------------|
| Setup | - | 3 | 0 | N/A |
| US1: Visual Differentiation | P1 | 7 | 4 | ✅ Categories visually distinct |
| US2: Enhanced Information | P1 | 8 | 5 | ✅ Metadata displayed clearly |
| US3: Visual Hierarchy | P2 | 6 | 3 | ✅ Professional appearance |
| US4: Icons | P3 | 4 | 2 | ✅ Icons visible |
| Polish & Validation | - | 3 | 0 | ✅ All requirements met |

---

## Implementation Strategy

### MVP First (Recommended)

**MVP = User Story 1 + User Story 2** (P1 priorities)
- Delivers core value: Visual differentiation + Enhanced metadata
- 18 tasks, ~2-3 hours
- Independently testable and deployable
- Can ship to production before P2/P3

### Incremental Delivery

1. **Week 1**: MVP (US1 + US2) → Deploy to production
2. **Week 2**: US3 (Visual Polish) → Deploy enhancement
3. **Week 3**: US4 (Icons) → Optional final polish

### Parallel Execution Examples

**Setup Phase** (sequential):
```
T001 → T002 → T003
```

**User Story 1** (parallelizable):
```
T004 [P] ──┐
T005 [P] ──┼─→ T006 ─→ T007 ─→ T008 [P] ──┐
T009 [P] ──┘                     T010 [P] ──┴─→ Independent Test
```

**User Story 2** (parallelizable):
```
T011 [P] ──┐
T012 [P] ──┼─→ T013 ─→ T014 ─→ T015 [P] ──┐
T016 [P] ──┤                    T017 [P] ──┼─→ Independent Test
T018 [P] ──┘                    T019       ──┘
```

---

## Phase 1: Setup & Prerequisites

**Goal**: Prepare CSS foundation and backup current state

### Tasks

- [X] T001 Create feature branch from main (`git checkout -b 002-enhance-index-design`)
- [X] T002 Back up current index.html and css/styles.css to specs/002-enhance-index-design/backups/
- [X] T003 Add CSS custom properties from research.md Appendix A to css/styles.css `:root` section

**Validation**: Branch created, backups saved, CSS variables defined

---

## Phase 2: User Story 1 - Visual Project Differentiation (P1)

**Goal**: Add category-based visual differentiation with color-coded badges

**Independent Test**: Open index.html and verify each project has distinct visual characteristics (colors, badges) that reflect its category. Should be able to identify management vs learning vs utility projects within 2 seconds.

**Acceptance Criteria**:
1. ✅ Different color schemes visible for different project types
2. ✅ Category styling hints at project purpose
3. ✅ Can quickly identify project types by visual appearance

### Tasks

- [X] T004 [P] [US1] Add `.visually-hidden` utility class to css/styles.css for screen reader-only text
- [X] T005 [P] [US1] Add `.category-badge` base styles to css/styles.css with border-radius and padding
- [X] T006 [US1] Add category-specific badge styles to css/styles.css for management, learning, utility, portfolio using data attribute selectors
- [X] T007 [US1] Wrap existing `<h2 class="project-title">` in `<header class="project-header">` for all 4 projects in index.html
- [X] T008 [P] [US1] Add `data-category` attribute to SpecKit-Manager article (`data-category="management"`) in index.html
- [X] T009 [P] [US1] Add `data-category` attribute to Allowance Manager article (`data-category="management"`) in index.html
- [X] T010 [P] [US1] Add `data-category` attribute to Vocabulary Cards article (`data-category="learning"`) in index.html
- [X] T011 [P] [US1] Add `data-category` attribute to Scan article (`data-category="utility"`) in index.html
- [X] T012 [US1] Add `<footer class="project-meta">` with category badge to all 4 project cards in index.html using template from data-model.md
- [X] T013 [US1] Add category-based border-left styling to `.project-card[data-category]` selectors in css/styles.css (4px solid colored border)
- [X] T014 [US1] Test visual differentiation in browser: verify 4 distinct category colors (blue/green/purple) are visible on cards

**Deliverable**: All project cards have visible category badges with distinct colors

---

## Phase 3: User Story 2 - Enhanced Project Information Display (P1)

**Goal**: Add technology tags, status badges, and feature highlights to project cards

**Independent Test**: View each project card and verify technology tags, status badges, and key features are displayed with clear visual organization.

**Acceptance Criteria**:
1. ✅ Technology tags indicate what project is built with
2. ✅ Status badges show if project is active/beta/archived
3. ✅ 2-3 key feature highlights visible
4. ✅ Metadata visually organized (not cluttered)

### Tasks

- [X] T015 [P] [US2] Add `.tech-tag` styles to css/styles.css (small pill design with neutral background)
- [X] T016 [P] [US2] Add `.project-technologies` container styles to css/styles.css (flexbox with gap)
- [X] T017 [P] [US2] Add `.status-badge` base styles to css/styles.css (inline-flex with gap, padding, border-radius)
- [X] T018 [P] [US2] Add status-specific badge styles to css/styles.css for active, beta, archived, experimental using data attribute selectors
- [X] T019 [P] [US2] Add `.project-features` list styles to css/styles.css (remove bullets, add checkmark::before)
- [X] T020 [US2] Add technology tags to SpecKit-Manager card in index.html (Firebase, Vanilla JS, HTML5)
- [X] T021 [US2] Add technology tags to Allowance Manager card in index.html (Vanilla JS, LocalStorage, HTML5)
- [X] T022 [US2] Add technology tags to Vocabulary Cards card in index.html (Vanilla JS, HTML5, CSS3)
- [X] T023 [US2] Add technology tags to Scan card in index.html (Vanilla JS)
- [X] T024 [US2] Add `data-status="active"` and status badge to SpecKit-Manager footer in index.html
- [X] T025 [US2] Add `data-status="active"` and status badge to Allowance Manager footer in index.html
- [X] T026 [US2] Add `data-status="active"` and status badge to Vocabulary Cards footer in index.html
- [X] T027 [US2] Add `data-status="beta"` and status badge to Scan footer in index.html (⚡ symbol)
- [X] T028 [US2] Add feature highlights list to SpecKit-Manager card in index.html (3 features from data-model.md)
- [X] T029 [US2] Add feature highlights list to Allowance Manager card in index.html (3 features from data-model.md)
- [X] T030 [US2] Add feature highlights list to Vocabulary Cards card in index.html (3 features from data-model.md)
- [X] T031 [US2] Add feature highlights list to Scan card in index.html (2 features from data-model.md)
- [X] T032 [US2] Test metadata display in browser: verify all technology tags, status badges, and features are visible and well-organized

**Deliverable**: All cards display technology tags, status badges, and feature highlights

---

## Phase 4: User Story 3 - Improved Visual Hierarchy (P2)

**Goal**: Enhance typography, spacing, and color harmony for professional appearance

**Independent Test**: View the page and assess visual quality - spacing should be consistent, typography should have clear hierarchy, colors should be harmonious, and interactions should feel smooth.

**Acceptance Criteria**:
1. ✅ Consistent spacing and alignment across all elements
2. ✅ Clear typography hierarchy with well-chosen sizes and weights
3. ✅ Harmonious color scheme enhances readability
4. ✅ Smooth transitions and polished interactive states

### Tasks

- [X] T033 [P] [US3] Update typography variables in css/styles.css to use system font stack from research.md
- [X] T034 [P] [US3] Add responsive font sizing for .project-title, .project-description, and body text in css/styles.css
- [X] T035 [P] [US3] Update spacing system in css/styles.css using 8pt grid (--spacing-* variables)
- [X] T036 [US3] Add smooth transitions to .project-card hover states in css/styles.css (transform, box-shadow)
- [X] T037 [US3] Implement :focus-visible styles for .project-link in css/styles.css (3px outline, 2px offset)
- [X] T038 [US3] Add responsive spacing adjustments for mobile (320px), tablet (768px), desktop (1024px+) in css/styles.css
- [X] T039 [US3] Test visual hierarchy in browser at 3 breakpoints: verify spacing consistency, typography hierarchy, and smooth interactions

**Deliverable**: Page has professional visual polish with improved typography and spacing

---

## Phase 5: User Story 4 - Project Icons (P3)

**Goal**: Add emoji icons to project cards for visual recognition

**Independent Test**: View project cards and verify each has a unique emoji icon that represents its category.

**Acceptance Criteria**:
1. ✅ Each card has distinctive icon representing the project
2. ✅ Can recognize projects by their visual identifier
3. ✅ Each project has unique and appropriate icon

### Tasks

- [X] T040 [P] [US4] Add `.project-icon` styles to css/styles.css (size, positioning, margin)
- [X] T041 [P] [US4] Add emoji icon 📊 with role="img" and aria-label to SpecKit-Manager card in index.html
- [X] T042 [US4] Add emoji icon 📊 with role="img" and aria-label to Allowance Manager card in index.html
- [X] T043 [US4] Add emoji icon 📚 with role="img" and aria-label to Vocabulary Cards card in index.html
- [X] T044 [US4] Add emoji icon 🔧 with role="img" and aria-label to Scan card in index.html
- [X] T045 [US4] Test icon display in browser and across platforms (Mac, Windows, iOS, Android if possible)

**Deliverable**: All cards display category-appropriate emoji icons

---

## Phase 6: Polish & Validation

**Goal**: Final validation, accessibility testing, and documentation updates

### Tasks

- [ ] T046 Run accessibility audit with axe DevTools or Lighthouse and fix any violations to achieve WCAG 2.1 AA compliance (MANUAL - User Action Required)
- [ ] T047 Test responsive design at 320px, 768px, 1024px, and 1920px breakpoints and verify no layout breaking (MANUAL - User Action Required)
- [ ] T048 Test keyboard navigation (Tab through links, verify focus states) and screen reader announcements (NVDA/VoiceOver) (MANUAL - User Action Required)
- [X] T049 Update README.md with design system documentation (category colors, status badges, how to add new projects)
- [ ] T050 Verify performance: run Lighthouse audit and confirm page load <3s, FCP <1.5s, CLS <0.1 (MANUAL - User Action Required)
- [ ] T051 Final visual QA: compare against acceptance criteria from spec.md for all 4 user stories (MANUAL - User Action Required)

**Deliverable**: Feature complete, accessible, performant, documented

---

## Dependency Graph

### Story Dependencies

```
Setup Phase (T001-T003)
    ↓
User Story 1 (T004-T014) [P1] ────┐
    ↓                              │
User Story 2 (T015-T032) [P1] ────┤ → MVP (independently deployable)
                                  │
User Story 3 (T033-T039) [P2] ────┤ → Enhancement (independently deployable)
                                  │
User Story 4 (T040-T045) [P3] ────┘ → Optional polish
    ↓
Polish & Validation (T046-T051)
```

**Key Dependencies**:
- US2 depends on US1 (needs category badges in footer before adding status badges)
- US3 is independent (can be done in parallel with US2 if desired)
- US4 is independent (can be done anytime after Setup)
- Polish depends on completing all desired user stories

### Critical Path (MVP)

```
T001 → T002 → T003 → T006 → T007 → T012 → T013 → T020-T027 → T032
```

**Estimated Time**: 2-3 hours for MVP

---

## Parallel Execution Opportunities

### Maximum Parallelization (Within Each Story)

**User Story 1 Tasks** (can run in parallel):
- T004, T005 (CSS utility classes)
- T008, T009, T010, T011 (adding data-category attributes to different cards)

**User Story 2 Tasks** (can run in parallel):
- T015, T016, T017, T018, T019 (CSS styles for tags, badges, features)
- T020, T021, T022, T023 (adding tech tags to different cards)
- T024, T025, T026, T027 (adding status badges to different cards)
- T028, T029, T030, T031 (adding features to different cards)

**User Story 3 Tasks** (can run in parallel):
- T033, T034, T035 (typography and spacing CSS updates)

**User Story 4 Tasks** (can run in parallel):
- T041, T042, T043, T044 (adding icons to different cards)

### Example Parallel Workflow (MVP)

```bash
# Terminal 1: HTML updates for US1
T007 → T008-T011 (parallel edits) → T012

# Terminal 2: CSS updates for US1
T003 → T004-T005 (parallel edits) → T006 → T013

# Terminal 3: HTML updates for US2
T020-T027 (parallel edits) → T028-T031 (parallel edits)

# Terminal 4: CSS updates for US2
T015-T019 (parallel edits)
```

---

## Testing Strategy

### Manual Visual Validation

Per constitutional principle IV (Pragmatic Testing), this feature uses manual validation rather than automated tests:

**After US1**:
- [ ] Open index.html in browser
- [ ] Verify 4 distinct category colors visible
- [ ] Verify category badges display correct text
- [ ] Verify screen reader announces "Category: [Name]"

**After US2**:
- [ ] Verify technology tags display as small pills
- [ ] Verify status badges show correct color and symbol
- [ ] Verify feature lists show 2-3 items with checkmarks
- [ ] Verify all metadata is scannable and not cluttered

**After US3**:
- [ ] Verify typography hierarchy (H1 > H2 > body > small)
- [ ] Verify consistent spacing using 8pt grid
- [ ] Verify hover effects are smooth
- [ ] Verify focus states are visible (3:1 contrast)

**After US4**:
- [ ] Verify emoji icons render correctly
- [ ] Verify icons have proper ARIA labels
- [ ] Test on multiple platforms if possible

### Accessibility Testing

**Tools**:
- axe DevTools (browser extension)
- Lighthouse (Chrome DevTools)
- WAVE (browser extension)
- NVDA (Windows) or VoiceOver (Mac)

**Checklist** (run during T046):
- [ ] Color contrast ≥4.5:1 for all text
- [ ] All interactive elements keyboard accessible
- [ ] Focus indicators visible (3:1 contrast)
- [ ] Screen reader announces all content in correct order
- [ ] ARIA attributes correctly applied
- [ ] No accessibility violations in axe/WAVE

### Responsive Testing

**Breakpoints to test** (during T047):
- [ ] 320px (small mobile)
- [ ] 375px (iPhone SE)
- [ ] 768px (tablet)
- [ ] 1024px (desktop)
- [ ] 1920px (large desktop)

**Validation**:
- [ ] No horizontal scrolling
- [ ] All content readable
- [ ] No layout breaking
- [ ] Touch targets ≥44x44px on mobile

### Browser Compatibility

**Test in** (during T047):
- [ ] Chrome 90+
- [ ] Firefox 88+
- [ ] Safari 14+
- [ ] Edge 90+

---

## Success Criteria Validation

Map each success criterion from spec.md to validation tasks:

| Success Criterion | Validation Task | How to Verify |
|-------------------|-----------------|---------------|
| SC-001: 2-second category identification | T014, T051 | Time yourself identifying project types |
| SC-002: 90% positive feedback | Post-deployment | User survey (deferred) |
| SC-003: 30% faster project finding | T051 | Compare time to find specific project before/after |
| SC-004: 8/10 aesthetic quality | T051 | Subjective assessment against design goals |
| SC-005: WCAG 2.1 AA compliance | T046 | axe/WAVE/Lighthouse must pass |
| SC-006: <3s page load | T050 | Lighthouse Performance audit |
| SC-007: <10min new project setup | T049 | Follow README to add fake 5th project |
| SC-008: 320px-1920px+ compatibility | T047 | Responsive testing at all breakpoints |

---

## Edge Case Handling

During implementation, handle these edge cases from spec.md:

| Edge Case | Handling | Task |
|-----------|----------|------|
| Project with no tech tags | Omit `.project-technologies` section entirely | T020-T023 |
| Very long description (>300 chars) | Truncate with CSS line-clamping (4 lines max) | T039 |
| Very small screens (<320px) | Accept horizontal scroll (out of scope) | T047 |
| Archived/inactive projects | Use `data-status="archived"` with gray badge | T024-T027 |
| 10+ technology tags | Show first 5, add "+N more" indicator | T020-T023 |
| Non-English characters | UTF-8 support already in place | T051 |

---

## Rollback Plan

If issues arise during implementation:

**Rollback US4** (icons):
```bash
git checkout main -- index.html  # Only if icons added
# Remove .project-icon CSS from styles.css
```

**Rollback US3** (visual polish):
```bash
# Revert typography and spacing changes in styles.css
git diff css/styles.css  # Review changes
git checkout HEAD~1 -- css/styles.css  # If needed
```

**Rollback US2** (metadata):
```bash
# Remove tech tags, status badges, features from index.html
# Keep category badges (US1)
```

**Full rollback**:
```bash
git checkout main -- index.html css/styles.css
# Or use backups from T002
cp specs/002-enhance-index-design/backups/* .
```

---

## Completion Criteria

**MVP is complete when**:
- ✅ All T001-T032 tasks completed
- ✅ All US1 + US2 acceptance criteria met
- ✅ Accessibility audit passes (T046)
- ✅ Responsive testing passes (T047)

**Feature is complete when**:
- ✅ All 51 tasks completed
- ✅ All 4 user stories' acceptance criteria met
- ✅ All 8 success criteria validated
- ✅ README.md updated with design system docs
- ✅ No accessibility violations
- ✅ Performance metrics met (<3s load, <1.5s FCP, <0.1 CLS)

---

## Notes for Implementation

### File Modification Summary

**index.html** (31 edits):
- Add data-category to 4 articles (T008-T011)
- Wrap H2 in header for 4 articles (T007)
- Add footer with badges to 4 articles (T012)
- Add tech tags to 4 articles (T020-T023)
- Add status badges to 4 articles (T024-T027)
- Add features to 4 articles (T028-T031)
- Add icons to 4 articles (T041-T044)

**css/styles.css** (20 edits):
- Add CSS custom properties (T003)
- Add utility classes (T004)
- Add category badge styles (T005-T006)
- Add category border styles (T013)
- Add tech tag styles (T015-T016)
- Add status badge styles (T017-T018)
- Add features styles (T019)
- Add typography updates (T033-T034)
- Add spacing system (T035)
- Add transitions (T036)
- Add focus styles (T037)
- Add responsive adjustments (T038)
- Add icon styles (T040)

**README.md** (1 edit):
- Add design system documentation (T049)

### Quick Reference Links

- **Design System**: [research.md](./research.md)
- **HTML Templates**: [data-model.md](./data-model.md)
- **HTML Contract**: [contracts/html-structure.md](./contracts/html-structure.md)
- **Quick Start Guide**: [quickstart.md](./quickstart.md)

---

**Document Status**: ✅ Ready for implementation
**Next Command**: `/speckit.implement` to execute these tasks
**Estimated Total Time**: 4-6 hours (MVP: 2-3 hours)
