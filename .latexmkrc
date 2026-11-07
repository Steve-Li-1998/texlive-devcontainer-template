# Build with LuaLaTeX (plantuml.sty is LuaLaTeX-only).
# -shell-escape comes from the image's /etc/LatexMk.
$pdf_mode = 4;

# The main file, built when latexmk is run without a file name (as CI does).
@default_files = ('main.tex');
