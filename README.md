# Project template

Files for a new LaTeX project that uses the images from [texlive-devcontainer](https://github.com/Steve-Li-1998/texlive-devcontainer). Start a repository from this template with **Use this template** on GitHub, or copy the files into an existing project:

```bash
git clone --depth 1 https://github.com/Steve-Li-1998/texlive-devcontainer-template.git /tmp/tpl
rm -rf /tmp/tpl/.git && cp -r /tmp/tpl/. /path/to/project/ && rm -rf /tmp/tpl
```

This README is copied along; delete it or replace it with your project's own.

| File | Purpose |
|---|---|
| `.devcontainer/devcontainer.json` | Opens the project in the prebuilt `dev` image, with rtex live preview and shell escape |
| `.gitlab-ci.yml` | Builds `main.pdf` in the `ci` image on GitLab |
| `.github/workflows/build-pdf.yml` | Builds `main.pdf` in the `ci` image on GitHub |
| `.latexmkrc` | Makes `latexmk` use LuaLaTeX |
| `.gitignore` | Ignores LaTeX build files and minted/mermaid/plantuml output |

## After copying

Replace the placeholder `<PROJECT_NAME>` in `.devcontainer/devcontainer.json` with your project's name, for example:

```bash
cd /path/to/new-project
sed -i 's|<PROJECT_NAME>|Masterarbeit|' .devcontainer/devcontainer.json
```

Also check:

- **CI:** keep the CI file for where your project is hosted and delete the other. Both build `main.tex`; change `FILE_NAME` in it if yours is named differently. A successful build keeps `main.pdf` for a week; a failed one keeps the whole working directory (logs, intermediate files, any partial PDF) instead.
- **Registry access:** `ghcr.io/steve-li-1998/texlive-devcontainer` and `ghcr.io/steve-li-1998/texlive-ci` are public and need no login.
## Writing the document

- Compile with LuaLaTeX. Under LuaLaTeX, don't load `\usepackage[T1]{fontenc}`: it turns `ß` into "SS" and `§` into "ğ". If the document must also build with pdfLaTeX, load it only there:
  ```latex
  \usepackage{iftex}
  \ifPDFTeX
    \usepackage[utf8]{inputenc}
    \usepackage[T1]{fontenc}
  \fi
  ```
- With `babel` and `ngerman`, use `\usepackage[ngerman,shorthands=off]{babel}`; the active `"` breaks rtex's live preview.
- Load `minted` before `csquotes`; the other order warns about `fvextra` and `\@parboxrestore`.

## License

The template files are under the [MIT license](https://opensource.org/license/mit), copyright (c) 2026 Hao LI. Projects made from them can use any license.
