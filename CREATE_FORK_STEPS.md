# Create Your Fork on GitHub - Step by Step

**Problem:** The repository `yacinebaroudi/react-native-uitextview` doesn't exist on GitHub yet.

**Solution:** Create the fork on GitHub first, then push.

---

## Option 1: Create Fork via GitHub Website (Easiest)

### Step 1: Go to Bluesky's Repository
1. Open: https://github.com/bluesky-social/react-native-uitextview
2. Click the **"Fork"** button (top right)
3. GitHub will ask where to fork it
4. Select your account: `yacinebaroudi`
5. Click **"Create fork"**

### Step 2: Verify Your Fork Exists
- Go to: https://github.com/yacinebaroudi/react-native-uitextview
- You should see your fork (it will be empty or have Bluesky's code)

### Step 3: Push Your Branch
```bash
cd /Users/yacinebaroudi/Projects/react-native-uitextview
git push origin feature/add-selection-change-event
```

---

## Option 2: Create Fork via Command Line (If you have GitHub CLI)

```bash
# Install GitHub CLI if needed: brew install gh
gh repo fork bluesky-social/react-native-uitextview --clone=false
```

Then push:
```bash
git push origin feature/add-selection-change-event
```

---

## Option 3: If Fork Already Exists But URL is Wrong

If you already forked but the remote URL is wrong:

```bash
# Check current remote
git remote -v

# If origin points to wrong URL, update it:
git remote set-url origin https://github.com/yacinebaroudi/react-native-uitextview.git

# Then push
git push origin feature/add-selection-change-event
```

---

## What Happens After Forking

1. **GitHub creates your fork** - A copy of Bluesky's repo under your account
2. **Your local repo is already set up** - It's pointing to your fork (origin)
3. **You push your changes** - They go to YOUR fork
4. **You create PR** - From your fork → Bluesky's repo

---

## Quick Check: Does Your Fork Exist?

Try visiting: https://github.com/yacinebaroudi/react-native-uitextview

- **If it exists:** You'll see the repository page
- **If it doesn't:** You'll get a 404 error (need to create fork)

---

## After Creating Fork

Once your fork exists on GitHub:

```bash
# Push your branch
git push origin feature/add-selection-change-event

# If it asks for authentication, you may need to:
# 1. Use a Personal Access Token (not password)
# 2. Or use SSH instead of HTTPS
```

---

**Most likely:** You just need to click "Fork" on GitHub first! 🍴


