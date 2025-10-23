---

description: "Task list for GitHub Pages Project Index implementation"
---

# Tasks: GitHub Pages Project Index

**Input**: Design documents from `/specs/001-pages-index/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: No automated tests required for this feature (manual browser testing per Pragmatic Testing Strategy)

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions

- **Single project**: Root directory (`index.html`, `css/`, `js/`, `assets/`)
- All files at repository root for GitHub Pages compatibility

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [x] T001 Create directory structure (css/, js/, assets/) at repository root
- [x] T002 [P] Create README.md with project description and deployment instructions
- [x] T003 [P] Create .gitignore file to exclude .DS_Store and editor-specific files

**Checkpoint**: Basic project structure ready

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T004 Create base HTML5 document structure in index.html with semantic elements (header, main, footer)
- [x] T005 Add meta tags for viewport, charset, and description in index.html <head>
- [x] T006 Create css/styles.css with CSS reset and base typography styles
- [ ] T007 [P] Add favicon.ico placeholder in assets/ directory (optional, can use default browser icon)

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - View All Projects at a Glance (Priority: P1) 🎯 MVP

**Goal**: Display a basic list of GitHub Pages projects with titles, descriptions, and clickable links

**Independent Test**: Open index.html in browser and verify:
- All project cards display with titles and links
- Clicking each link navigates to the correct project
- Page is readable and descriptions are visible
- Works on mobile (320px), tablet (768px), and desktop (1024px+)

### Implementation for User Story 1

- [x] T008 [US1] Create site header with h1 title "My GitHub Pages Projects" in index.html
- [x] T009 [US1] Create main content container with projects-grid section in index.html
- [x] T010 [US1] Add 3-5 sample project cards using <article> element with project-card class in index.html
- [x] T011 [US1] Implement project card HTML structure (h2 with link, p for description) per data-model.md in index.html
- [x] T012 [US1] Create mobile-first CSS Grid layout (1 column default) in css/styles.css
- [x] T013 [US1] Style project cards with borders, padding, and spacing in css/styles.css
- [x] T014 [US1] Style project titles and links with appropriate colors in css/styles.css
- [x] T015 [US1] Style project descriptions with readable typography in css/styles.css
- [x] T016 [US1] Add tablet breakpoint (768px) with 2-column grid layout in css/styles.css
- [x] T017 [US1] Add desktop breakpoint (1024px) with 3-column grid layout in css/styles.css
- [x] T018 [US1] Create site footer with copyright and optional GitHub link in index.html
- [ ] T019 [US1] Test page on mobile device or browser DevTools at 320px width
- [ ] T020 [US1] Test page on tablet at 768px width
- [ ] T021 [US1] Test page on desktop at 1024px+ width
- [ ] T022 [US1] Verify all project links navigate correctly (click each link)
- [ ] T023 [US1] Run HTML through W3C validator and fix any errors

**Checkpoint**: At this point, User Story 1 (P1 MVP) should be fully functional and testable independently. You have a deployable project index!

---

## Phase 4: User Story 2 - Navigate to Projects Easily (Priority: P2)

**Goal**: Enhance user experience with visual feedback and better organization

**Independent Test**: Open index.html and verify:
- Hover effects appear when mouse over links and cards
- Visual separation between projects is clear
- Links have visible focus states for keyboard navigation
- Interaction feels polished and responsive

### Implementation for User Story 2

- [ ] T024 [US2] Add CSS transition properties to project cards in css/styles.css
- [ ] T025 [US2] Implement hover effect for project cards (shadow, transform) in css/styles.css
- [ ] T026 [US2] Implement hover effect for project links (color change, underline) in css/styles.css
- [ ] T027 [US2] Add visible focus states for keyboard navigation in css/styles.css
- [ ] T028 [US2] Enhance visual separation between cards (adjust gaps, borders) in css/styles.css
- [ ] T029 [US2] Optimize spacing and layout for better readability in css/styles.css
- [ ] T030 [US2] Test hover effects on all interactive elements
- [ ] T031 [US2] Test keyboard navigation (Tab through all links)
- [ ] T032 [US2] Verify focus indicators are visible and clear

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently. Enhanced UX is live!

---

## Phase 5: User Story 3 - Understand Project Context (Priority: P3)

**Goal**: Add metadata (categories, status badges) to help visitors understand project context

**Independent Test**: Open index.html and verify:
- Category and status badges display for each project
- Badges are visually distinct and readable
- Data attributes are present for potential future filtering
- Metadata enhances but doesn't clutter the card design

### Implementation for User Story 3

- [ ] T033 [US3] Add data-category and data-status attributes to project cards in index.html
- [ ] T034 [US3] Add project-meta div with category and status spans to each card in index.html
- [ ] T035 [US3] Update sample project cards with example categories and statuses in index.html
- [ ] T036 [US3] Create badge base styles in css/styles.css
- [ ] T037 [US3] Create status-specific badge styles (badge-active, badge-archived, etc.) in css/styles.css
- [ ] T038 [US3] Style project-meta container with flexbox layout in css/styles.css
- [ ] T039 [US3] Ensure badges are responsive and readable on all screen sizes
- [ ] T040 [US3] Test visual hierarchy (badges don't overpower title/description)
- [ ] T041 [US3] Verify all metadata displays correctly across devices

**Checkpoint**: All user stories should now be independently functional. Full feature set complete!

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories and final quality checks

- [ ] T042 [P] Update README.md with usage instructions for adding new projects
- [ ] T043 [P] Add instructions for deployment to GitHub Pages in README.md
- [ ] T044 Add empty state message for when no projects exist in index.html
- [ ] T045 [P] Optimize CSS for performance (remove unused rules, combine selectors)
- [ ] T046 [P] Test cross-browser compatibility (Chrome, Firefox, Safari, Edge)
- [ ] T047 [P] Run CSS through W3C CSS validator
- [ ] T048 Run accessibility check using WAVE or axe DevTools
- [ ] T049 Run Lighthouse performance audit (target: Performance > 90, Accessibility > 90)
- [ ] T050 Create project template comment in HTML for easy copy-paste when adding projects
- [ ] T051 Final visual review and polish (spacing, colors, alignment)

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3, 4, 5)**: All depend on Foundational phase completion
  - User stories can then proceed in parallel (if desired)
  - Or sequentially in priority order (P1 → P2 → P3) - **RECOMMENDED for MVP-first approach**
- **Polish (Phase 6)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Can start after Foundational (Phase 2) - Enhances US1 but independently testable
- **User Story 3 (P3)**: Can start after Foundational (Phase 2) - Enhances US1 but independently testable

**Key Insight**: All user stories are independently implementable after Foundation phase. No cross-story dependencies!

### Within Each User Story

- HTML structure before CSS styling
- Base styles before hover/interactive effects
- Desktop styles before mobile responsive adjustments (mobile-first approach means mobile is default)
- Implementation before testing tasks

### Parallel Opportunities

- **Setup tasks**: T002 and T003 marked [P] can run in parallel
- **Foundational**: T007 can run in parallel with T004-T006
- **Polish tasks**: T042, T043, T045, T046, T047 marked [P] can run in parallel
- **User stories themselves**: US1, US2, US3 can be worked on in parallel by different team members once Foundation is complete

---

## Parallel Example: User Story 1

Since most US1 tasks modify the same files (index.html and css/styles.css), true parallel execution is limited. However, the approach is:

1. **HTML Structure First** (T008-T011, T018): Build the skeleton
2. **CSS Styling Next** (T012-T017): Style the structure
3. **Testing Last** (T019-T023): Verify everything works

Within CSS tasks, if using separate CSS files (e.g., layout.css, components.css), those could be parallelized. But for simplicity, this project uses a single styles.css.

---

## Implementation Strategy

### MVP First (User Story 1 Only) ⭐ RECOMMENDED

This is the fastest path to a working, deployable project:

1. Complete Phase 1: Setup (~5 minutes)
2. Complete Phase 2: Foundational (~15 minutes)
3. Complete Phase 3: User Story 1 (~30-45 minutes)
4. **STOP and VALIDATE**:
   - Open index.html in browser
   - Test on mobile, tablet, desktop
   - Click all links
   - Run W3C validator
5. **Deploy to GitHub Pages** (~5 minutes)
6. **Total MVP Time**: ~1-1.5 hours

**Deliverable**: A fully functional project index that visitors can use immediately.

### Incremental Delivery

Add features one story at a time:

1. Complete Setup + Foundational → Foundation ready (~20 minutes)
2. Add User Story 1 → Test independently → Deploy (MVP!) (~45 minutes)
3. Add User Story 2 → Test independently → Deploy (Enhanced UX) (~30 minutes)
4. Add User Story 3 → Test independently → Deploy (Full feature set) (~30 minutes)
5. Add Polish → Final deployment (~30 minutes)

**Total Time**: ~2.5-3 hours for complete feature set

Each story adds value without breaking previous stories.

### Parallel Team Strategy

If working with multiple developers:

1. Team completes Setup + Foundational together (~20 minutes)
2. Once Foundational is done:
   - Developer A: User Story 1 (HTML/CSS for basic list)
   - Developer B: User Story 2 (Prepare hover/interaction CSS)
   - Developer C: User Story 3 (Prepare metadata badge CSS)
3. Integrate:
   - Merge US1 first → Deploy MVP
   - Merge US2 → Deploy enhanced version
   - Merge US3 → Deploy full version
4. Team completes Polish together

**Note**: Since all tasks modify index.html and css/styles.css, parallel development requires careful coordination or feature branches.

---

## Notes

- No [P] markers within user story tasks because most modify the same files (index.html, css/styles.css)
- [P] markers used in Setup and Polish where tasks are truly independent (different files)
- Each user story is independently completable and testable per Incremental Delivery principle
- No automated tests needed - manual browser testing is appropriate for static HTML page
- Verify each user story works before moving to next priority
- Stop at any checkpoint to validate story independently
- All file paths are explicit for clarity
- MVP (User Story 1) can be deployed in ~1 hour

---

## Testing Checklist (Manual)

After completing each user story, verify:

### User Story 1 Testing
- [ ] Page loads without errors in browser
- [ ] All project titles and descriptions are visible
- [ ] All links navigate to correct destinations
- [ ] Mobile view (320px): Single column, readable text
- [ ] Tablet view (768px): 2 columns, good spacing
- [ ] Desktop view (1024px+): 3 columns, balanced layout
- [ ] HTML validates with W3C validator (no errors)

### User Story 2 Testing
- [ ] Hover over project card shows visual feedback (shadow/transform)
- [ ] Hover over project link shows color change/underline
- [ ] Tab through links shows visible focus indicators
- [ ] All interactive elements have minimum 44x44px touch targets (mobile)
- [ ] Transitions are smooth (no janky animations)

### User Story 3 Testing
- [ ] Category badges display correctly for each project
- [ ] Status badges display with appropriate colors
- [ ] Badges are readable on all screen sizes
- [ ] data-category and data-status attributes present in HTML
- [ ] Metadata doesn't clutter the card design

### Final Polish Testing
- [ ] Empty state message displays when no projects exist
- [ ] Cross-browser: Chrome, Firefox, Safari, Edge all render correctly
- [ ] CSS validates with W3C CSS validator
- [ ] Accessibility: WAVE or axe shows no critical errors
- [ ] Lighthouse: Performance > 90, Accessibility > 90
- [ ] Project template is easy to find and copy in HTML

---

## Task Summary

**Total Tasks**: 51
- Phase 1 (Setup): 3 tasks
- Phase 2 (Foundational): 4 tasks
- Phase 3 (User Story 1 - P1 MVP): 16 tasks
- Phase 4 (User Story 2 - P2): 9 tasks
- Phase 5 (User Story 3 - P3): 9 tasks
- Phase 6 (Polish): 10 tasks

**Parallel Opportunities**: 7 tasks marked [P]

**MVP Scope** (User Story 1 only): 23 tasks (Setup + Foundational + US1)
**Estimated MVP Time**: 1-1.5 hours
**Estimated Full Feature Time**: 2.5-3 hours

**Ready to Start**: ✅ All tasks are specific, have file paths, and follow the constitutional principles of simplicity and incremental delivery.

---

## Quick Reference: Adding a New Project

After deployment, adding a new project to the index:

1. Open `index.html`
2. Find the project template comment (added in T050)
3. Copy the template
4. Paste inside `<section class="projects-grid">`
5. Replace placeholders with actual project info
6. Save and commit
7. Push to GitHub
8. Wait 1-2 minutes for GitHub Pages to rebuild

**Time**: < 5 minutes ✅ (meets SC-005 success criterion)
