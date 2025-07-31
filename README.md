
# Quarto Academic Website (No Local Install)

This repository is a minimal **Quarto** website tailored for academics. It publishes to **GitHub Pages** via **GitHub Actions**—you do **not** need to install Ruby, Jekyll, or Quarto locally.

## How to use

1. Create a new GitHub repository (e.g., `arojascastro.github.io`).
2. Upload these files to the repo (or unzip and push via Git).
3. Go to **Settings → Pages** and select **Source: Deploy from a branch** and **Branch: `gh-pages`** (the Action creates it on first run).
4. Push a commit to `main`. The workflow will:
   - Set up Quarto
   - Render the site
   - Publish to `gh-pages`

Visit `https://<your-username>.github.io` after the workflow completes.

## Customize

- Edit `_quarto.yml` (title, navbar, social links).
- Add your publications to `bibliography/references.bib` and cite them in `publications.qmd`.
- Add project pages under `projects/`.
- Add your PDF CV to `cv/cv.pdf`.

## Local preview (optional)

If you want live preview without installing tools on your machine, use **GitHub Codespaces**. It provides Quarto preinstalled in the cloud.
