# Simple Fork Guide - Contributing to Bluesky

**Don't worry! This is simpler than it seems. Here's what's happening:**

---

## What's a Fork? (Simple Explanation)

Think of it like this:
- **Bluesky's repo** = The original library (bluesky-social/react-native-uitextview)
- **Your fork** = Your own copy on GitHub (yacinebaroudi/react-native-uitextview)
- **Your changes** = The improvements you made (selection change events)

**What you're doing:**
You're saying "Hey Bluesky, I made this improvement. Want to add it to your library?"

---

## Current Situation

✅ **You have:**
- A fork on GitHub: `yacinebaroudi/react-native-uitextview`
- Changes that work in your app
- A feature branch: `feature/add-selection-change-event`

✅ **What's ready:**
- Code changes (committed)
- Documentation (needs to be committed)
- Code review (passed)

---

## Step-by-Step: Push Your Changes

### Step 1: Commit Your Documentation

```bash
cd /Users/yacinebaroudi/Projects/react-native-uitextview

# Add the documentation files
git add README.md CHANGELOG.md

# Commit them
git commit -m "docs: Add selection change event documentation"
```

### Step 2: Push Your Branch to YOUR Fork

```bash
# Push your feature branch to YOUR fork (origin)
git push origin feature/add-selection-change-event
```

**What this does:**
- Uploads your branch to YOUR GitHub fork
- Makes it available for creating a PR
- Doesn't affect Bluesky's repo (yet)

---

## Step-by-Step: Create the Pull Request

### Step 3: Go to GitHub

1. **Open your fork:**
   - Go to: https://github.com/yacinebaroudi/react-native-uitextview
   - You should see a yellow banner saying "Compare & pull request" (after pushing)

2. **OR manually create PR:**
   - Click the "Pull requests" tab
   - Click "New pull request"
   - Make sure it says:
     - **Base repository:** `bluesky-social/react-native-uitextview` ← (THEIR repo)
     - **Base branch:** `main`
     - **Head repository:** `yacinebaroudi/react-native-uitextview` ← (YOUR fork)
     - **Compare branch:** `feature/add-selection-change-event`

### Step 4: Fill Out the PR

**Title:**
```
feat: Add onSelectionChange event for native text selection detection
```

**Description:** (Copy from `PLANS/07-React-Native-UITextView-Fork-GitHub-Next-Steps.md`)

---

## Visual Guide

```
┌─────────────────────────────────────────────────────────┐
│  Bluesky's Repo (bluesky-social/react-native-uitextview)│
│  └─ main branch (original code)                         │
└─────────────────────────────────────────────────────────┘
                          ↑
                          │ PR (Pull Request)
                          │ "Please add my changes"
                          │
┌─────────────────────────────────────────────────────────┐
│  Your Fork (yacinebaroudi/react-native-uitextview)     │
│  └─ feature/add-selection-change-event (your changes)   │
└─────────────────────────────────────────────────────────┘
```

**What happens:**
1. You push to YOUR fork
2. You create a PR from YOUR fork → THEIR repo
3. They review it
4. If approved, they merge it into their main branch
5. Everyone benefits! 🎉

---

## Common Questions

**Q: Will this break my app?**
A: No! Your fork stays the same. The PR is just asking them to add your changes to their repo.

**Q: What if they say no?**
A: That's okay! Your fork still has your changes, and your app still works. You can keep using your fork.

**Q: What if they want changes?**
A: They'll comment on the PR. You make the changes, push to your branch, and the PR updates automatically.

**Q: Do I need to do anything after they merge?**
A: Nope! Your contribution is done. You helped improve the library for everyone.

---

## Quick Command Reference

```bash
# 1. Go to your fork directory
cd /Users/yacinebaroudi/Projects/react-native-uitextview

# 2. Make sure you're on the right branch
git branch  # Should show: * feature/add-selection-change-event

# 3. Commit documentation (if not done)
git add README.md CHANGELOG.md
git commit -m "docs: Add selection change event documentation"

# 4. Push to YOUR fork
git push origin feature/add-selection-change-event

# 5. Go to GitHub and create PR (see Step 3 above)
```

---

## What You're Contributing

You're giving back:
- ✅ A feature that eliminates polling overhead
- ✅ Better performance for everyone using this library
- ✅ Real-time selection detection
- ✅ Well-tested, production-ready code

**Thank you for contributing!** 🙏

---

## Need Help?

If you get stuck:
1. Check the error message
2. Make sure you're pushing to `origin` (your fork), not `upstream` (their repo)
3. Verify your branch name: `feature/add-selection-change-event`

---

**You've got this!** The hard part (making it work) is done. Now you're just sharing it. 🚀


