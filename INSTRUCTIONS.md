# 🚀 GitHub Profile Setup Instructions for Jotika

This zip contains the complete GitHub Profile Repository structure for **[jotika-meaw](https://github.com/jotika-meaw)**, formatted identically to **ariandesu/ariandesu**.

---

## 📁 Included Files

1. **`README.md`**: Main profile page with typing banner, bio, social links, tech stack badges, GitHub stats, featured projects, dev quote & profile view counter.
2. **`.github/workflows/snake.yml`**: GitHub Actions workflow that automatically generates the interactive contribution snake SVG every 6 hours into the `output` branch.
3. **`push_profile.sh`**: Automated setup bash script to create the repo and push all files directly via GitHub Personal Access Token (PAT).

---

## 🛠️ How to Push to GitHub

### Option A: Using Web / GitHub Desktop (No Command Line)
1. Go to [GitHub - Create a New Repository](https://github.com/new).
2. Set **Repository name** to `jotika-meaw` (it MUST match her exact username).
3. Set visibility to **Public**.
4. Check **Add a README file** (or leave unchecked).
5. Click **Create repository**.
6. Upload the files inside this directory (`README.md` and `.github/` folder) directly to the repository!

---

### Option B: Using Git / Terminal
1. Open terminal in this folder:
   ```bash
   git init -b main
   git add .
   git commit -m "Initial profile README"
   git remote add origin https://github.com/jotika-meaw/jotika-meaw.git
   git push -u origin main --force
   ```

---

### Option C: Using the `push_profile.sh` Script
1. Generate a GitHub Fine-Grained Personal Access Token (or Classic PAT) with `repo` permissions.
2. Run:
   ```bash
   chmod +x push_profile.sh
   ./push_profile.sh YOUR_GITHUB_TOKEN
   ```

---

## 🐍 Enabling the Contribution Snake
After pushing:
1. Go to the repository `jotika-meaw/jotika-meaw` on GitHub.
2. Click on the **Actions** tab.
3. Enable workflows and click on **Generate Snake** -> **Run workflow**.
4. Once run, the contribution snake SVG will automatically render on the README!
